#coding=utf-8
#
# Code to test the system.
#
import unittest
import urlparse
import os

from webtest import TestApp
from google.appengine.api import apiproxy_stub_map
from google.appengine.api import datastore_file_stub
from google.appengine.api import mail_stub
from google.appengine.api import user_service_stub
from google.appengine.api.memcache import memcache_stub
from google.appengine.api.taskqueue import taskqueue_stub

from debianmeeting import application

APP_ID = u'debianmeeting'
AUTH_DOMAIN = 'gmail.com'
LOGGED_IN_ADMIN = 'test2@example.com'
LOGGED_IN_USER = 'test3@example.com'
TITLE = 'test1'
PREWORK = 'test4'
USER_PREWORK = 'test4'
USER_REALNAME = 'Mr Test9'
CAPACITY = 123456789

class SystemTest(unittest.TestCase):
    def setUp(self):
        """set up stub
        """

        # API proxy
        apiproxy_stub_map.apiproxy = apiproxy_stub_map.APIProxyStubMap()

        # have a dummy datastore
        stub = datastore_file_stub.DatastoreFileStub(
            APP_ID,
            '/dev/null',
            '/dev/null')
        apiproxy_stub_map.apiproxy.RegisterStub('datastore_v3', stub)
        os.environ['APPLICATION_ID'] = APP_ID

        # user authentication
        apiproxy_stub_map.apiproxy.RegisterStub(
            'user', user_service_stub.UserServiceStub())

        os.environ['AUTH_DOMAIN'] = AUTH_DOMAIN
        os.environ['USER_EMAIL'] = LOGGED_IN_ADMIN
        # I don't know why this is needed but there's a warning from taskqueue.
        os.environ['HTTP_HOST'] = 'localhost:8080'

        # mail
        apiproxy_stub_map.apiproxy.RegisterStub(
            'mail', mail_stub.MailServiceStub())
        
        # memcache
        apiproxy_stub_map.apiproxy.RegisterStub(
            'memcache', memcache_stub.MemcacheServiceStub())

        # taskqueue
        apiproxy_stub_map.apiproxy.RegisterStub(
            'taskqueue', taskqueue_stub.TaskQueueServiceStub())

        self.taskqueue_stub = apiproxy_stub_map.apiproxy.GetStub( 'taskqueue' ) 
        self.taskqueue_stub._root_path = os.path.dirname(__file__)

    # ==============================================================
    # Utility functions
    # ==============================================================

    def login(self, username):
        """change login account"""
        os.environ['USER_EMAIL'] = username

    def createPageCommitHelper(self, app, capacity=CAPACITY):
        """
        Creates an event.

        @return eventid
        """
        response = app.post('/eventadmin/register', {
                'eventid': 'na',
                'title': TITLE,
                'prework': PREWORK,
                'capacity': capacity,
                })
        self.assertEqual('302 Moved Temporarily', response.status)
        self.assertTrue('/thanks?eventid=' in response.location)
        eventid = response.location.split('=')[1]
        return eventid

    def verifyThanksPage(self, app, eventid):
        """verify that the Thanks Page content is okay."""
        response = app.get('/thanks?eventid=%s' % eventid)
        self.assertEqual('200 OK', response.status)
        self.assertTrue(eventid in response)

    def userEventEntryFormSimple(self, app, eventid, new_entry):
        response = app.get('/event', {
                'eventid': eventid,
                'ui': 'simple',
                })
        self.assertEqual('200 OK', response.status)
        self.assertTrue('<!-- simple_ui -->' in response)
        self.assertEqual(not new_entry, '<!-- not new entry -->' in response)
        return response

    def userEventEntryForm(self, app, eventid, new_entry):
        """Show the page user is prompted with before registration to an event.
        """
        response = app.get('/event', {
                'eventid': eventid,
                })
        self.assertEqual('200 OK', response.status)
        self.assertTrue('<!-- non_simple_ui -->' in response)
        self.assertEqual(not new_entry, '<!-- not new entry -->' in response)
        return response

    def checkUserEventEntryFormReturnValue(
        self, app, eventid, remaining_seats, response):
        """Check remaining seats value for event entry form."""
        self.assertTrue(str(remaining_seats) in response)

    def userEventEntry(self, app, eventid, capacity=CAPACITY, 
                       user_realname=USER_REALNAME):
        """Register user to event.
        Check that state changes before and after the event.
        """

        # check entry page has right number of remaining seats in the
        # two possible UIs.
        self.checkUserEventEntryFormReturnValue(
            app, eventid, capacity, 
            self.userEventEntryFormSimple(app, eventid, True))
        self.checkUserEventEntryFormReturnValue(
            app, eventid, capacity, 
            self.userEventEntryForm(app, eventid, True))

        response = app.post('/eventregister', {
                'eventid': eventid,
                'user_prework': USER_PREWORK,
                'user_attend': 'attend',
                'user_enkai_attend': 'enkai_attend',
                'user_realname': user_realname,
                })
        self.assertEqual('302 Moved Temporarily', response.status)
        self.assertTrue('/thanks?eventid=%s' % eventid
                        in response.location)
        self.verifyThanksPage(app, eventid)

        # check entry page has right number of remaining seats
        self.checkUserEventEntryFormReturnValue(
            app, eventid, capacity - 1, 
            self.userEventEntryFormSimple(app, eventid, False))
        self.checkUserEventEntryFormReturnValue(
            app, eventid, capacity - 1, 
            self.userEventEntryForm(app, eventid, False))


    def createEnquete(self, app, eventid, question_text = '''question 1
question 2
question 3'''):
        """Create an enquete. Should be ran as the admin."""
        response = app.get('/enquete/edit', {
                'eventid': eventid,
                })
        self.assertEqual('200 OK', response.status)

        response = app.post('/enquete/editdone', {
                'eventid': eventid,
                'overall_message': 'hello',
                'question_text': question_text,
                })
        self.assertEqual('200 OK', response.status)

        # make sure the next time to edit will show the content the
        # next time.
        response = app.get('/enquete/edit', {
                'eventid': eventid,
                })
        self.assertEqual('200 OK', response.status)
        self.assertTrue(question_text in response)

    # ==============================================================
    # Tests
    # ==============================================================

    def testTopPage(self):
        """test displaying of the top page."""
        app = TestApp(application)
        response = app.get('/')
        self.assertEqual('200 OK', response.status)
        self.assertTrue('Debian勉強会予約管理システム' in response)

    def testCreatePage(self):
        app = TestApp(application)
        response = app.get('/newevent')
        self.assertEqual('200 OK', response.status)
        self.assertTrue('幹事用イベント管理ページ' in response)

    def testCreatePageCommit(self):
        app = TestApp(application)
        self.createPageCommitHelper(app)

    def testListKnownAdminEvents(self):
        """Check admin dashboard if the newly created event can be seen.
        """
        app = TestApp(application)
        response = app.get('/')
        self.assertEqual('200 OK', response.status)
        self.assertFalse(TITLE in response)

        # generate event data
        self.createPageCommitHelper(app)

        # check the event is viewable.
        response = app.get('/')
        self.assertEqual('200 OK', response.status)
        self.assertTrue(TITLE in response)

    def testThanksPageFailCase(self):
        """test that Thanks page will fail when wrong eventid is requested."""
        app = TestApp(application)
        # try to get some incorrect eventid
        eventid = 'zzz'
        response = app.get('/thanks?eventid=%s' % eventid, status=404)
        self.assertTrue(eventid in response)


    def testUserRegisterEvent(self):
        """Test user registration workflow.
        """
        # generate event data first
        app = TestApp(application)

        eventid = self.createPageCommitHelper(app)

        # check user does not see the event yet
        self.login(LOGGED_IN_USER)
        response = app.get('/')
        self.assertEqual('200 OK', response.status)
        self.assertFalse(TITLE in response)

        # check user sees the event after registering
        self.userEventEntry(app, eventid)
        response = app.get('/')
        self.assertEqual('200 OK', response.status)
        self.assertTrue(TITLE in response)


    def testUserRegisterEventFull(self):
        """Test user registration failure workflow.
        """
        # generate event data first
        app = TestApp(application)

        # generate a event with capacity of 1
        eventid = self.createPageCommitHelper(app, capacity=1)

        # check user does not see the event yet
        self.login(LOGGED_IN_USER)
        response = app.get('/')
        self.assertEqual('200 OK', response.status)
        self.assertFalse(TITLE in response)

        # check user sees the event after registering
        self.userEventEntry(app, eventid, capacity=1)
        response = app.get('/')
        self.assertEqual('200 OK', response.status)
        self.assertTrue(TITLE in response)

        # check adding a different user to the event
        self.login(LOGGED_IN_ADMIN)
        response = app.post('/eventregister', {
                'eventid': eventid,
                'user_prework': USER_PREWORK,
                'user_attend': 'attend',
                'user_enkai_attend': 'enkai_attend',
                'user_realname': USER_REALNAME,
                }, status=404)
        self.assertTrue('you cannot reserve a place' in response)

    def testAdminReviewEvent(self):
        """Verify the event admin summary review flow.
        """
        app = TestApp(application)
        # register the event
        eventid = self.createPageCommitHelper(app)
        # user joins the event
        self.login(LOGGED_IN_USER)
        self.userEventEntry(app, eventid)

        self.login(LOGGED_IN_ADMIN)
        response = app.get('/eventadmin/summary', {
                'eventid': eventid,
                })

        self.assertEqual('200 OK', response.status)
        self.assertTrue(LOGGED_IN_USER in response)
        self.assertTrue(USER_PREWORK in response)

    def testLatexEnqueteEscape(self):
        app = TestApp(application)
        eventid = self.createPageCommitHelper(app)

        # user joins the event
        self.login(LOGGED_IN_USER)
        self.userEventEntry(app, eventid,
                            user_realname='man_with_underscore')
        
        # be the admin and create the enquete.
        self.login(LOGGED_IN_ADMIN)
        response = app.get('/eventadmin/preworklatex', {
                'eventid': eventid,
                })
        self.assertEqual('200 OK', response.status)
        self.assertTrue('man\_{}with\_{}underscore' in response.body)


    def testEnqueteCreate(self):
        """Test Enquete creation flow.
        """
        # generate event data first
        app = TestApp(application)
        eventid = self.createPageCommitHelper(app)

        # user joins the event
        self.login(LOGGED_IN_USER)
        self.userEventEntry(app, eventid)
        # does not see enquete request because there is no enquete yet.
        response = app.get('/', {
                'eventid': eventid,
                })
        self.assertFalse('アンケートに回答する' in response)

        # be the admin and create the enquete.
        self.login(LOGGED_IN_ADMIN)
        self.createEnquete(app, eventid)

        # admin sends out the enquete mail.
        response = app.get('/enquete/sendmail', {
                'eventid': eventid,
                })
        self.assertEqual('200 OK', response.status)

        # user responds to enquete
        # user sees top page with enquete requirement.
        self.login(LOGGED_IN_USER)
        response = app.get('/', {
                'eventid': eventid,
                })
        self.assertTrue('アンケートに回答する' in response)

        # user responds to enquete
        response = app.get('/enquete/respond', {
                'eventid': eventid,
                })
        self.assertEqual('200 OK', response.status)
        self.assertTrue('question 1' in response)
        self.assertTrue('question 2' in response)
        self.assertTrue('question 3' in response)

        response = app.post('/enquete/responddone', {
                'eventid': eventid,
                'question0': 0,
                'question1': 5,
                'question2': 4,
                'overall_comment': 'hello world',
                })
        self.assertEqual('200 OK', response.status)

        # user no longer sees top page with enquete requirement
        response = app.get('/', {
                'eventid': eventid,
                })
        self.assertFalse('アンケートに回答する' in response)

        # admin views the list
        self.login(LOGGED_IN_ADMIN)
        response = app.get('/enquete/showresult', {
                'eventid': eventid,
                })
        self.assertEqual('200 OK', response.status)
        self.assertEquals("question 1,question 2,question 3,自由記入\r\nNA,5,4,hello world\r\n", response.body)

        # admin views all the results
        self.login(LOGGED_IN_ADMIN)
        response = app.get('/enquete/showallresults')
        self.assertEqual('200 OK', response.status)


if __name__ == '__main__':
    unittest.main()
    

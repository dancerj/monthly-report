#coding=utf-8
# system test code. To run:
# PYTHONPATH=$(PATH_TO_GAE):$(PATH_TO_GAE)/lib/django/ python testSystem.py
import unittest
import urlparse
import os

from webtest import TestApp
from google.appengine.api import apiproxy_stub_map
from google.appengine.api import user_service_stub
from google.appengine.api import datastore_file_stub
from google.appengine.api import mail_stub
from google.appengine.api.xmpp import xmpp_service_stub

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
        stub = datastore_file_stub.DatastoreFileStub(APP_ID,
                                                     '/dev/null',
                                                     '/dev/null')
        apiproxy_stub_map.apiproxy.RegisterStub('datastore_v3', stub)
        os.environ['APPLICATION_ID'] = APP_ID

        # user authentication
        apiproxy_stub_map.apiproxy.RegisterStub(
            'user', user_service_stub.UserServiceStub())

        os.environ['AUTH_DOMAIN'] = AUTH_DOMAIN
        os.environ['USER_EMAIL'] = LOGGED_IN_ADMIN

        # mail
        apiproxy_stub_map.apiproxy.RegisterStub(
            'mail', mail_stub.MailServiceStub())
        
        # xmpp
        apiproxy_stub_map.apiproxy.RegisterStub(
            'xmpp', xmpp_service_stub.XmppServiceStub())


    def login(self, username):
        """change login account"""
        os.environ['USER_EMAIL'] = username

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


    def createPageCommitHelper(self, app, capacity=CAPACITY):
        response = app.post('/eventadmin/register', 
                            {
                'eventid': 'na',
                'title': TITLE,
                'prework': PREWORK,
                'capacity': capacity,
                })
        self.assertEqual('302 Moved Temporarily', response.status)
        self.assertTrue('/thanks?eventid=' in response.location)
        eventid = response.location.split('=')[1]
        return eventid

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

    def verifyThanksPage(self, app, eventid):
        """verify that the Thanks Page content is okay."""
        response = app.get('/thanks?eventid=%s' % eventid)
        self.assertEqual('200 OK', response.status)
        self.assertTrue(eventid in response)

    def testThanksPageFailCase(self):
        """test that Thanks page will fail when wrong eventid is requested."""
        app = TestApp(application)
        # try to get some incorrect eventid
        eventid = 'zzz'
        response = app.get('/thanks?eventid=%s' % eventid, status=404)
        self.assertTrue(eventid in response)

    def userEventEntryFormSimple(self, app, eventid):
        response = app.post('/event',
                            {
                'eventid': eventid,
                'ui': 'simple',
                })
        self.assertEqual('200 OK', response.status)
        self.assertTrue('<!-- simple_ui -->' in response)
        return response

    def userEventEntryForm(self, app, eventid):
        """Show the page user is prompted with before registration.
        Test the two variances.
        """
        response = app.post('/event',
                            {
                'eventid': eventid,
                })
        self.assertEqual('200 OK', response.status)
        self.assertTrue('<!-- non_simple_ui -->' in response)
        return response
        
    def checkUserEventEntryFormReturnValue(self, app, eventid, remaining_seats, response):
        """Check remaining seats value for event entry form."""
        self.assertTrue(str(remaining_seats) in response)

    def userEventEntry(self, app, eventid, capacity=CAPACITY):
        """Register to event."""
        # check entry page has right number of remaining seats
        self.checkUserEventEntryFormReturnValue(app, eventid, capacity, 
                                                self.userEventEntryFormSimple(app, eventid))
        self.checkUserEventEntryFormReturnValue(app, eventid, capacity, 
                                                self.userEventEntryForm(app, eventid))

        response = app.post('/eventregister', 
                            {
                'eventid': eventid,
                'user_prework': USER_PREWORK,
                'user_attend': 'attend',
                'user_enkai_attend': 'enkai_attend',
                'user_realname': USER_REALNAME,
                })
        self.assertEqual('302 Moved Temporarily', response.status)
        self.assertTrue('/thanks?eventid=%s' % eventid
                        in response.location)
        self.verifyThanksPage(app, eventid)

        # check entry page has right number of remaining seats
        self.checkUserEventEntryFormReturnValue(app, eventid, capacity - 1, 
                                                self.userEventEntryFormSimple(app, eventid))
        self.checkUserEventEntryFormReturnValue(app, eventid, capacity - 1, 
                                                self.userEventEntryForm(app, eventid))


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
        response = app.post('/')
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
        response = app.post('/')
        self.assertEqual('200 OK', response.status)
        self.assertTrue(TITLE in response)

        # check adding a different user to the event
        self.login(LOGGED_IN_ADMIN)
        response = app.post('/eventregister', 
                            {
                'eventid': eventid,
                'user_prework': USER_PREWORK,
                'user_attend': 'attend',
                'user_enkai_attend': 'enkai_attend',
                'user_realname': USER_REALNAME,
                }, status=404)
        self.assertTrue('you cannot reserve a place' in response)

    def testAdminReviewEvent(self):
        app = TestApp(application)
        # register the event
        eventid = self.createPageCommitHelper(app)
        # user joins the event
        self.login(LOGGED_IN_USER)
        self.userEventEntry(app, eventid)

        self.login(LOGGED_IN_ADMIN)
        response = app.post('/eventadmin/summary', 
                            {
                'eventid': eventid,
                })

        self.assertEqual('200 OK', response.status)
        self.assertTrue(LOGGED_IN_USER in response)
        self.assertTrue(USER_PREWORK in response)


if __name__ == '__main__':
    unittest.main()
    

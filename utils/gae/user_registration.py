# User event registration pages.
# coding=utf-8
from google.appengine.api import users

import schema
import send_notification
import webapp_generic

class UserEventRegistrationPage(webapp_generic.WebAppGenericProcessor):
    """Form where user signs up for an event, and edits old sign-up entries."""
    def process_input(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        if not user:
            self.send_user_to_auth_screen_in_different_window()
            return

        # try loading the item with same eventid from datastore
        event = self.load_event_with_eventid_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return

        user_realname = self.load_user_realname_with_userid(user)
        if user_realname == None:
            # if empty, create a new instance
            user_realname = schema.UserRealname()
            user_realname.user = user
            user_realname.realname = user.nickname()

        remaining_seats = self.count_remaining_seats(eventid, event.capacity)
        attendance = self.load_attendance_with_eventid_and_user(eventid, user)
        template_values = {
            'nickname': event.owner.nickname(),
            'eventid': event.eventid,
            'title': event.title,
            'location': event.location,
            'content_text': event.content_text,
            'content_url': event.content_url,
            'prework_text': event.prework_text,
            'event_date': event.event_date,
            'remaining_seats': remaining_seats,
            'user_realname': user_realname.realname,
            }

        if attendance == None:
            # this is a new registration
            template_values['user_prework'] = ""
            template_values['user_attend'] = True
            template_values['user_enkai_attend'] = True
            template_values['new_entry'] = True
        else:
            # Editing an old registration entry
            template_values['user_prework'] = attendance.prework_text
            template_values['user_attend'] = attendance.attend
            template_values['user_enkai_attend'] = attendance.enkai_attend

        if self.request.get('ui') == 'simple':
            template_filename = 'UserEventRegistrationPage_Simple.html'
        else:
            template_filename = 'UserEventRegistrationPage.html'

        self.template_render_output(template_values, template_filename)

    def send_user_to_auth_screen_in_different_window(self):
        """Send user to login screen, in a different window.  The
        original page will be inside an iframe, and it's not desirable
        to open up an authentication screen inside the iframe.
        """
        redirect_url = users.create_login_url(self.request.uri)
        template_filename = 'PopupReirectToLoginPage.html'
        template_values = {
            'redirect_url': redirect_url,
            }
        self.template_render_output(template_values, template_filename)

class UserCommitEventRegistration(webapp_generic.WebAppGenericProcessor):
    """The page to show after user commits to a registration."""
    def process_input(self):
        eventid = self.request.get('eventid')
        event = self.load_event_with_eventid_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        user = users.get_current_user()

        # update user_realname cache.
        user_realname = self.load_user_realname_with_userid(user)
        if user_realname == None:
            # if empty, create a new instance
            user_realname = schema.UserRealname()
            user_realname.user = user
        user_realname.realname = self.request.get('user_realname')
        user_realname.put()

        attendance = self.load_attendance_with_eventid_and_user(eventid, user)
        if attendance == None:
            # create new entry if it's not available yet, otherwise reuse an old entry.
            attendance = schema.Attendance()

            # check that the event has remaining seats, this part of code
            # should really be atomic, but it's not. I'm sloppy.
            remaining_seats = self.count_remaining_seats(eventid, event.capacity)
            if remaining_seats == 0:
                # the number of remaining seats is zero, so the party is full.
                self.http_error_message(u'イベントは満席です Event id %s is full, you cannot reserve a place' % (eventid))
                return
            # TODO: I should also check when someone unchecked attend -> checked attend again.

        attendance.eventid = eventid
        attendance.user = user
        attendance.user_realname = user_realname.realname
        attendance.prework_text = self.request.get('user_prework')
        attendance.attend = (self.request.get('user_attend') == 'attend')
        attendance.enkai_attend = (self.request.get('user_enkai_attend') == 'enkai_attend')

        attendance.put()

        mail_title = "[Debian登録システム] %s が %s に登録しました" % (user.nickname(), event.title.encode('utf-8')) 
        
        mail_template = {
            'attendance': attendance,
            'event': event,
            'event_url': 'http://%s/event?eventid=%s' % (self.request.host, eventid),
            }
        mail_message = self.template_render(mail_template, 'UserCommitEventRegistration.txt')
        send_notification.send_notification_to_user_and_owner(user.email(), 
                                                              event.owner.email(), 
                                                              event.owners_email,
                                                              mail_title, mail_message)
        self.redirect('/thanks?eventid=%s' % (eventid))


#!/usr/bin/env python
# Debian Meeting event registration and user registration forms.
# main dispatcher.

import cgi
import wsgiref.handlers
import os

from google.appengine.api import users
from google.appengine.ext import webapp

import admin_event
import schema
import user_registration
import webapp_generic

class TopPage(webapp_generic.WebAppGenericProcessor):
    """The top page for the site. 
    Has a form to create a new event."""
    def process_input(self):
        user = users.get_current_user()
        
        events = self.load_event_with_owners(user)
        attendances = schema.Attendance.gql('WHERE user = :1 ORDER BY timestamp DESC',
                                     user).fetch(1000)
        # look up the titles of events.
        attendance_titles = []
        for attendance in attendances:
            title = self.load_event_title_with_eventid_cached(attendance.eventid)
            attendance_titles.append({ 'title': title,
                                       'eventid': attendance.eventid,
                                       })
        template_values = {
            'nickname': user.nickname(),
            'events': events,
            'attendance_titles': attendance_titles,
            'logout_url': users.create_logout_url(self.request.uri)
            }
        self.template_render_output(template_values, 'TopPage.html')


class Thanks(webapp_generic.WebAppGenericProcessor):
    """Show a thanks page"""
    def process_input(self):
        eventid = self.request.get('eventid')
        event = self.load_event_with_eventid_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        template_values = {
            'eventid': eventid,
            }
        self.template_render_output(template_values, 'Thanks.html')

application = webapp.WSGIApplication([
    ('/', TopPage),
    ('/newevent', admin_event.NewEvent),
    ('/event', user_registration.UserEventRegistrationPage),
    ('/eventregister', user_registration.UserCommitEventRegistration),
    ('/eventadmin/edit', admin_event.EditEvent),
    ('/eventadmin/register', admin_event.RegisterEvent),
    ('/eventadmin/summary', admin_event.ViewEventSummary),
    ('/eventadmin/preworklatex', admin_event.PreworkLatex),
    ('/thanks', Thanks),
], debug=True)


def main():
    wsgiref.handlers.CGIHandler().run(application)


if __name__ == '__main__':
    main()

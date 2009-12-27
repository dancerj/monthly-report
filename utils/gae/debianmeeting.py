#!/usr/bin/env python
# Debian Meeting event registration and user registration forms.
# main dispatcher.

import cgi
import datetime
import wsgiref.handlers
import os
import hashlib

from google.appengine.api import users
from google.appengine.ext import webapp

import admin_event
import schema
import user_registration
import webapp_generic

def generate_eventid(event_title, username, time):
    """Create a sha1 hash hex string to use as event ID."""
    sourcestring = event_title + username + time
    h = hashlib.sha1()
    h.update(sourcestring.encode('utf-8'))
    return h.hexdigest()


class TopPage(webapp_generic.WebAppGenericProcessor):
    """The top page for the site. 
    Has a form to create a new event."""
    def process_input(self):
        user = users.get_current_user()
        
        events = schema.Event.gql('WHERE owner = :1 ORDER BY timestamp DESC', 
                           user).fetch(1000) + schema.Event.gql('WHERE owners_email = :1 ORDER BY timestamp DESC', 
                           user.email()).fetch(1000)
        attendances = schema.Attendance.gql('WHERE user = :1 ORDER BY timestamp DESC',
                                     user).fetch(1000)
        # look up the titles of events.
        attendance_titles = []
        for attendance in attendances:
            title = self.load_event_title_with_eventid(attendance.eventid)
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


application = webapp.WSGIApplication([
    ('/', TopPage),
    ('/newevent', admin_event.NewEvent),
    ('/event', user_registration.UserEventRegistrationPage),
    ('/eventregister', user_registration.UserCommitEventRegistration),
    ('/eventadmin/edit', admin_event.EditEvent),
    ('/eventadmin/register', admin_event.RegisterEvent),
    ('/eventadmin/summary', admin_event.ViewEventSummary),
], debug=True)


def main():
    wsgiref.handlers.CGIHandler().run(application)


if __name__ == '__main__':
    main()

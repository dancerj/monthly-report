#!/usr/bin/env python
# Debian Meeting event registration and user registration forms.

import cgi
import datetime
import wsgiref.handlers
import os
import hashlib

from google.appengine.ext import db
from google.appengine.api import users
from google.appengine.ext import webapp
from google.appengine.ext.webapp import template

class Event(db.Model):
    eventid = db.StringProperty()
    owner = db.UserProperty() # the creator is the owner
    owners_email = db.StringListProperty() # allow owner emails to be added if possible
    title = db.StringProperty()
    location = db.StringProperty(multiline=True)
    content = db.StringProperty(multiline=True)
    prework = db.StringProperty(multiline=True)
    event_date = db.StringProperty()
    timestamp = db.DateTimeProperty(auto_now_add=True)

class Attendance(db.Model):
    eventid = db.StringProperty()
    user = db.UserProperty()
    prework = db.StringProperty(multiline=True)
    attend = db.BooleanProperty()
    timestamp = db.DateTimeProperty(auto_now_add=True)


class WebAppGenericProcessor(webapp.RequestHandler):
    """Merge get and post requests so that both is handled by the same handler.
    """
    def process_input(self):
        """do something here"""

    def get(self):
        self.process_input()

    def post(self):
        self.process_input()

    def load_event_with_eventid(self, eventid):
        """Load an event with the eventid."""
        events = Event.gql('WHERE eventid = :1 ORDER BY timestamp DESC LIMIT 1', eventid)
        if events.count() == 0:
            self.response.out.write('Event id %s not found' % (eventid))
            return 
        event = events[0]
        return event

    def check_auth_owner(self, event):
        """Check if this user is an owner of this event"""
        if event.owner == users.get_current_user():
            return True
        # TODO: check for other owners too...
        return False

    def template_render_output(self, template_values, template_filename):
        """Convenience function to send out template results"""
        path = os.path.join(os.path.dirname(__file__), template_filename)
        self.response.out.write(template.render(path, template_values))

def generate_eventid(event_title, username, time):
    """Create a sha1 hash hex string to use as event ID."""
    sourcestring = event_title + username + time
    h = hashlib.sha1()
    h.update(sourcestring.encode('utf-8'))
    return h.hexdigest()


class TopPage(WebAppGenericProcessor):
    """The top page for the site. 
    Has a form to create a new event."""
    def process_input(self):
        user = users.get_current_user()
        
        events = Event.gql('WHERE owner = :1 ORDER BY timestamp DESC', 
                           user)
        attendances = Attendance.gql('WHERE user = :1 ORDER BY timestamp DESC',
                                     user)
        template_values = {
            'nickname': user.nickname(),
            'events': events,
            'attendances': attendances
            }
        self.template_render_output(template_values, 'index.html')

class NewEvent(WebAppGenericProcessor):
    """Form to create a new event."""
    def process_input(self):
        template_values = {
            'nickname': users.get_current_user().nickname(),
            'eventid': "na" # set it to N/A to later set it to something else...?
            }
        self.template_render_output(template_values, 'event.html')

class EditEvent(WebAppGenericProcessor):
    """Load from the existing data and edit the event"""
    def process_input(self):
        eventid = self.request.get('eventid')
        event = self.load_event_with_eventid(eventid)
        if event == None:
            return
        if not self.check_auth_owner(event):
            self.response.out.write('Not your event')
            return

        template_values = {
            'nickname': users.get_current_user().nickname(),
            'eventid': event.eventid,
            'title': event.title,
            'location': event.location,
            'content': event.content,
            'prework': event.prework,
            'event_date': event.event_date
            }
        self.template_render_output(template_values, 'event.html')

class RegisterEvent(WebAppGenericProcessor):
    """Load from the existing database and edit the event content"""
    def process_input(self):
        eventid = self.request.get('eventid') # TODO: this is not a trusted data, from user.
        title = self.request.get('title')
        owner = users.get_current_user()

        if eventid == 'na':
            # if it's new, create a new item
            event = Event()
            eventid = generate_eventid(title, owner.email(), event.timestamp.isoformat(' '))
            event.eventid = eventid
        else:
            event = self.load_event_with_eventid(eventid)
            if event == None:
                return

        event.eventid = eventid
        event.owner = owner
        event.title = title
        event.location = self.request.get('location')
        event.content = self.request.get('content')
        event.prework = self.request.get('prework')
        event.event_date = self.request.get('event_date')
        event.put()

        self.redirect('/eventadmin/edit?eventid=%s' % (eventid))


class UserEventRegistrationPage(WebAppGenericProcessor):
    """Form where user signs up for an event"""
    def process_input(self):
        eventid = self.request.get('eventid') # TODO: this is not a trusted data, from user.
        user = users.get_current_user()

        # try loading the item with same eventid from datastore
        event = self.load_event_with_eventid(eventid)
        if event == None:
            return

        template_values = {
            'nickname': event.owner.nickname(),
            'eventid': event.eventid,
            'title': event.title,
            'location': event.location,
            'content': event.content,
            'prework': event.prework,
            'event_date': event.event_date,
            'user_prework': "",
            'user_attend': True,
            }
        self.template_render_output(template_values, 'userreg.html')

class UserCommitEventRegistration(WebAppGenericProcessor):
    """The page to show after user commits to a registration."""
    def process_input(self):
        attendance = Attendance()
        attendance.eventid = self.request.get('eventid')
        attendance.user = users.get_current_user()
        attendance.prework = self.request.get('user_prework')
        attendance.attend = (self.request.get('user_attend') == 'attend')

        attendance.put()
        self.response.out.write("""
registered
""")


class ViewEventSummary(WebAppGenericProcessor):
    """View summary of registered users for a given event."""
    def process_input(self):
        eventid = self.request.get('eventid')
        event = self.load_event_with_eventid(eventid)
        if not self.check_auth_owner(event):
            self.response.out.write("""
You are not allowed to see a summary""")
            return

        attendances = Attendance.gql('WHERE eventid = :1 ORDER BY timestamp DESC', 
                                     eventid)
        for attendance in attendances:
            self.response.out.write("""
<li>%s: %s</li>
""" % (attendance.user.nickname(), 
       attendance.prework))


application = webapp.WSGIApplication([
    ('/', TopPage),
    ('/newevent', NewEvent),
    ('/event', UserEventRegistrationPage),
    ('/eventregister', UserCommitEventRegistration),
    ('/eventadmin/edit', EditEvent),
    ('/eventadmin/register', RegisterEvent),
    ('/eventadmin/summary', ViewEventSummary),
], debug=True)


def main():
    wsgiref.handlers.CGIHandler().run(application)


if __name__ == '__main__':
    main()

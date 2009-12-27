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
    """Convenience class to collect all methods that seem generally useful.

    Merge get and post requests so that both is handled by the same
    handler, process_input.
    """
    def process_input(self):
        """do something here"""

    def get(self):
        self.process_input()

    def post(self):
        self.process_input()

    def load_event_with_eventid(self, eventid):
        """Load an event with the eventid.
        """
        events = Event.gql('WHERE eventid = :1 ORDER BY timestamp DESC LIMIT 1', eventid)
        if events.count() == 0:
            self.response.out.write('Event id %s not found' % (eventid))
            return 
        event = events[0]
        return event

    def load_attendance_with_eventid_and_user(self, eventid, user):
        """Load an attendance with the eventid and user."""
        attendances = Attendance.gql('WHERE eventid = :1 and user = :2 ORDER BY timestamp DESC LIMIT 1', 
                                      eventid, user)
        if attendances.count() == 0:
            return
        attendance = attendances[0]
        return attendance

    def check_auth_owner(self, event):
        """Check if this user is an owner of this event, 
        or the email is listed in owner_email list."""
        user = users.get_current_user()
        if event.owner == user:
            return True
        for owner_email in event.owners_email:
            if owner_email == user.email():
                return True
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
                           user).fetch(1000) + Event.gql('WHERE owners_email = :1 ORDER BY timestamp DESC', 
                           user.email()).fetch(1000)
        attendances = Attendance.gql('WHERE user = :1 ORDER BY timestamp DESC',
                                     user)
        template_values = {
            'nickname': user.nickname(),
            'events': events,
            'attendances': attendances,
            'logout_url': users.create_logout_url(self.request.uri)
            }
        self.template_render_output(template_values, 'TopPage.html')

class NewEvent(WebAppGenericProcessor):
    """Form to create a new event."""
    def process_input(self):
        template_values = {
            'nickname': users.get_current_user().nickname(),
            'eventid': "na" # set it to N/A to later set it to something else...?
            }
        self.template_render_output(template_values, 'EditEvent.html')

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
            'nickname': event.owner.nickname(), # the owner might be not me.
            'owners_email': (','.join(event.owners_email)),
            'eventid': event.eventid,
            'title': event.title,
            'location': event.location,
            'content': event.content,
            'prework': event.prework,
            'event_date': event.event_date
            }
        self.template_render_output(template_values, 'EditEvent.html')

class RegisterEvent(WebAppGenericProcessor):
    """Load from the existing database and edit the event content"""
    def process_input(self):
        eventid = self.request.get('eventid')
        title = self.request.get('title')

        if eventid == 'na':
            # if it's new, create a new item
            event = Event()
            owner = users.get_current_user()
            eventid = generate_eventid(title, owner.email(), event.timestamp.isoformat(' '))
            event.eventid = eventid
            event.owner = owner
        else:
            event = self.load_event_with_eventid(eventid)
            if event == None:
                return

        event.eventid = eventid
        event.owners_email = self.request.get('owners_email').split(',')
        event.title = title
        event.location = self.request.get('location')
        event.content = self.request.get('content')
        event.prework = self.request.get('prework')
        event.event_date = self.request.get('event_date')
        event.put()

        self.redirect('/eventadmin/edit?eventid=%s' % (eventid))


class UserEventRegistrationPage(WebAppGenericProcessor):
    """Form where user signs up for an event, and edits old sign-up entries."""
    def process_input(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()

        # try loading the item with same eventid from datastore
        event = self.load_event_with_eventid(eventid)
        if event == None:
            return

        attendance = self.load_attendance_with_eventid_and_user(eventid, user)
        template_values = {
            'nickname': event.owner.nickname(),
            'eventid': event.eventid,
            'title': event.title,
            'location': event.location,
            'content': event.content,
            'prework': event.prework,
            'event_date': event.event_date,
            }

        if attendance == None:
            # this is a new registration
            template_values['user_prework'] = ""
            template_values['user_attend'] = True
        else:
            # Editing an old registration entry
            template_values['user_prework'] = attendance.prework
            template_values['user_attend'] = attendance.attend

        self.template_render_output(template_values, 'UserEventRegistrationPage.html')


class UserCommitEventRegistration(WebAppGenericProcessor):
    """The page to show after user commits to a registration."""
    def process_input(self):
        eventid = self.request.get('eventid')
        if self.load_event_with_eventid(eventid) == None:
            return
        user = users.get_current_user()
        attendance = self.load_attendance_with_eventid_and_user(eventid, user)
        if attendance == None:
            # create new entry if it's not available yet, otherwise reuse an old entry.
            attendance = Attendance()
        attendance.eventid = eventid
        attendance.user = user
        attendance.prework = self.request.get('user_prework')
        attendance.attend = (self.request.get('user_attend') == 'attend')

        attendance.put()
        self.redirect('/event?eventid=%s' % (eventid))

class ViewEventSummary(WebAppGenericProcessor):
    """View summary of registered users for a given event."""
    def process_input(self):
        eventid = self.request.get('eventid')
        event = self.load_event_with_eventid(eventid)
        if not event:
            return
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

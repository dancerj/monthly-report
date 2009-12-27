# Wrappers for webapp.RequestHandler.
import os

from google.appengine.api import users
from google.appengine.ext import webapp
from google.appengine.ext.webapp import template

import schema

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
        events = schema.Event.gql('WHERE eventid = :1 ORDER BY timestamp DESC LIMIT 1', eventid)
        event = events.get()
        return event

    def load_attendance_with_eventid_and_user(self, eventid, user):
        """Load an attendance with the eventid and user."""
        attendances = schema.Attendance.gql('WHERE eventid = :1 and user = :2 ORDER BY timestamp DESC LIMIT 1', 
                                      eventid, user)
        attendance = attendances.get()
        return attendance

    def load_event_title_with_eventid(self, eventid):
        """Load an event title with the eventid.
        """
        event = self.load_event_with_eventid(eventid)
        return event.title

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

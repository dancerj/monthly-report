# Definition of GAE tables.
from google.appengine.ext import db

class Event(db.Model):
    eventid = db.StringProperty()
    owner = db.UserProperty() # the creator is the owner
    owners_email = db.StringListProperty() # allow owner emails to be added if possible
    title = db.StringProperty()
    location = db.StringProperty(multiline=True)
    content = db.StringProperty(multiline=True) # obsolete, use content_text
    content_text = db.TextProperty()
    content_url = db.StringProperty()
    prework = db.StringProperty(multiline=True) # obsolete, use prework_text
    prework_text = db.TextProperty()
    event_date = db.StringProperty()
    timestamp = db.DateTimeProperty(auto_now_add=True)
    capacity = db.IntegerProperty() # the number of possible people attending the meeting

class Attendance(db.Model):
    eventid = db.StringProperty()
    user = db.UserProperty()
    user_realname = db.StringProperty() # keep a cache of last realname entry.
    prework = db.StringProperty(multiline=True) # obsolete, but used in initial version
    prework_text = db.TextProperty() # Used everywhere, populate from prework if available.
    attend = db.BooleanProperty()
    enkai_attend = db.BooleanProperty()
    timestamp = db.DateTimeProperty(auto_now_add=True)

class UserRealname(db.Model):
    """Backup of user realname configuration so that user doesn't have to reenter that information."""
    user = db.UserProperty()
    realname = db.StringProperty()
    timestamp = db.DateTimeProperty(auto_now_add=True)

class EventEnquete(db.Model):
    """Enquete questions for an event."""
    eventid = db.StringProperty()
    overall_message = db.TextProperty()
    question_text = db.StringListProperty()
    timestamp = db.DateTimeProperty(auto_now_add=True)

class EventEnqueteResponse(db.Model):
    """Enquete respnose for an event by one person."""
    eventid = db.StringProperty()
    # responses for 1-5 questions. 0 is N/A
    question_response = db.ListProperty(long)
    overall_comment = db.TextProperty() # a general comment from user.
    timestamp = db.DateTimeProperty(auto_now_add=True)
    user = db.UserProperty()

# Definition of GAE tables.
from google.appengine.ext import db

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

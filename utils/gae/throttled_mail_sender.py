from google.appengine.api import taskqueue

import send_notification
import webapp_generic


def send_mail(eventid, to_email, mail_title, mail_message):
    """Send mail via throttled queue."""
    taskqueue.add(url = '/batch/throttledmailsender',
                  queue_name = 'throttledmailsender',
                  params = {
            'eventid': eventid,
            'to': to_email,
            'mail_title': mail_title,
            'mail_message': mail_message,
            })


class ThrottledMailSender(webapp_generic.WebAppGenericProcessor):
    """Taskqueue email handler. This is the worker job which will
    actually send mail.

    Used for enquete mail sending and other notifications.
    
    Requires the following parameters:

    eventid: which event we are notifying for.
    to: mail address to send to
    mail_title: the title.
    mail_message: the body.
    """
    def post(self):
        eventid = self.request.get('eventid')
        event = self.event_cache.get_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return

        # TODO: expand owners 

        # don't try sending notification to every owner, but one.
        send_notification.send_notification(
            self.request.get('to'),
            event.owner.email(),
            self.request.get('mail_title'),
            self.request.get('mail_message'))


    def expand_owners(self, owners_email, owner_address):
        """ TODO: use something like this. """
        owners_email.append(owner_address)
        # Make sure join does the right thing when it is empty list. We
        # don't want to send to ',hoge'.
        if "" in owners_email:
            owners_email.remove("")
    
        return ",".join(owners_email)

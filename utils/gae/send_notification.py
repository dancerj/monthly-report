# notification code. Send email and XMPP notifications.
# coding=utf-8
import logging

from google.appengine.api import xmpp
from google.appengine.api import mail

def send_notification(from_address, address, owner_address, title, mail_body):
    """Send simple notification message to address.

    from_address should be the developer's email address, or the
    currently logged in user's address.
    """
    # send XMPP message containing just the short title
    xmpp.send_message(address + "," + owner_address, title)

    # sending mail with full body
    mail.send_mail(from_address, address, title, mail_body, bcc=owner_address)

def send_notification_to_user_and_owner(user_address, owner_address, owners_email, title, mail_body):
    """Send feedback to registering user, and owner."""
    owners_email.append(owner_address)
    
    send_notification(user_address, user_address, ",".join(owners_email), title, mail_body)

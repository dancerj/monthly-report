# notification code. Send email notifications.
# coding=utf-8
import logging

from google.appengine.api import mail

def send_notification(address, owner_address, title, mail_body):
    """Send simple notification message to address.

    The mail will always come from the application mail address.
    """
    # sending mail with full body
    mail.send_mail(
        'noreply@debianmeeting.appspotmail.com', 
        address, title, mail_body, bcc=owner_address)

def send_notification_to_user_and_owner(user_address, owner_address, owners_email, title, mail_body):
    """Send feedback to registering user, and owner."""
    owners_email.append(owner_address)

    # Make sure join does the right thing when it is empty list. We
    # don't want to send to ',hoge'.
    if "" in owners_email:
        owners_email.remove("")
    
    send_notification(user_address, ",".join(owners_email), title, mail_body)

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

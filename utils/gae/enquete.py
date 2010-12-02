# Enquete page editing and submitting.
# coding=utf-8
from google.appengine.api import users

import schema
import send_notification
import webapp_generic


class EnqueteAdminEdit(webapp_generic.WebAppGenericProcessor):
    """Admin edits the enquete questionnaire."""
    def process_input(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        event = self.load_event_with_eventid_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        if not self.check_auth_owner(event):
            self.http_error_message('Not your event')
            return
        enquete = self.load_enquete_with_eventid(eventid)
        if enquete == None:
            enquete = schema.EventEnquete()
        template_values = {
            'eventid': event.eventid,
            'event_title': event.title,
            'overall_message': enquete.overall_message,
            'question_text': '\n'.join(enquete.question_text),
            }
        self.template_render_output(template_values, 'EnqueteAdminEdit.html')


class EnqueteAdminEditDone(webapp_generic.WebAppGenericProcessor):
    """Admin submits edits to the enquete questionnaire."""
    def process_input(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        event = self.load_event_with_eventid_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        if not self.check_auth_owner(event):
            self.http_error_message('Not your event')
            return
        enquete = self.load_enquete_with_eventid(eventid)
        if enquete == None:
            enquete = schema.EventEnquete()
        enquete.eventid = eventid
        enquete.overall_message = self.request.get('overall_message')
        enquete.question_text = self.request.get('question_text').splitlines()
        enquete.put()
        template_values = {
            'eventid': eventid,
            }
        self.template_render_output(template_values, 'Thanks.html')


class EnqueteAdminSendMail(webapp_generic.WebAppGenericProcessor):
    """Send mail to all participants by request of the administrator."""
    def process_input(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        event = self.load_event_with_eventid_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        if not self.check_auth_owner(event):
            self.http_error_message('Not your event')
            return
        enquete = self.load_enquete_with_eventid(eventid)
        if enquete == None:
            self.http_error_message('Enquete for event id %s not found' %
                                    (eventid))
            return
        attendances, num_attend, num_enkai_attend = self.load_users_with_eventid(eventid)
        self.response.headers['Content-type'] = 'text/plain; charset=utf-8'
        for attendance in attendances:
            mail_template = {
                'eventid': eventid,
                'user_realname': attendance.user_realname,
                }
            mail_message = self.template_render(
                mail_template, 'EnqueteAdminSendMail.txt')
            mail_title = "[Debian登録システム] イベント %s のアンケートの依頼" % event.title.encode('utf-8')

            send_notification.send_notification_to_user_and_owner(
                user.email(), # send from currently logged in admin user.
                attendance.user.email(),
                event.owner.email(),
                event.owners_email,
                mail_title, mail_message)

            # show page content
            self.response.out.write(mail_message)

class EnqueteRespond(webapp_generic.WebAppGenericProcessor):
    """Page for user to enter form for enquete."""
    # TODO: should I allow for editing ?
    def process_input(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        attendance = self.load_attendance_with_eventid_and_user(eventid, user)
        if attendance == None:
            self.http_error_message('User not registered in event %s' %
                                    (eventid))
            return
        event = self.load_event_with_eventid_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        enquete = self.load_enquete_with_eventid(eventid)
        if enquete == None:
            self.http_error_message('Enquete for event id %s not found' %
                                    (eventid))
            return

        question_text_array = []
        for sequence, question_item in enumerate(enquete.question_text):
            question_text_array.append({
                    'name': 'question' + str(sequence),
                    'question_text': question_item,
                    })
        template_values = {
            'eventid': eventid,
            'event': event,
            'overall_message': enquete.overall_message,
            'question_text_array': question_text_array,
            }
        self.template_render_output(template_values, 'EnqueteRespond.html')


class EnqueteRespondDone(webapp_generic.WebAppGenericProcessor):
    """User has responded to enquete and sends the result. We will
    store the resulting data to database."""
    def process_input(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        event = self.load_event_with_eventid_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        attendance = self.load_attendance_with_eventid_and_user(eventid, user)
        if attendance == None:
            self.http_error_message('User not registered in event %s' %
                                    (eventid))
            return
        enquete = self.load_enquete_with_eventid(eventid)
        if enquete == None:
            self.http_error_message('Enquete for event id %s not found' %
                                    (eventid))
            return
        enquete_response = schema.EventEnqueteResponse()
        enquete_response.overall_comment = self.request.get('overall_comment')
        for sequence, question_item in enumerate(enquete.question_text):
            enquete_response.question_response.append(long(self.request.get('question' + str(sequence))))
        enquete_response.put()
        template_values = {
            'eventid': eventid,
            }
        self.template_render_output(template_values, 'Thanks.html')

        # send mail backup of the enquete.
        question_text_array = []
        for question_text, question_response in zip(enquete.question_text, enquete_response.question_response):
            question_text_array.append({
                    'question_text': question_text,
                    'value': question_response,
                    })
        mail_template = {
            'eventid': eventid,
            'user_realname': attendance.user_realname,
            'question_text_array': question_text_array,
            }
        mail_message = self.template_render(
            mail_template, 'EnqueteRespondDone.txt')
        mail_title = "[Debian登録システム] イベント %s のアンケート結果" % event.title.encode('utf-8')

        send_notification.send_notification_to_user_and_owner(
            user.email(),
            user.email(),
            event.owner.email(),
            event.owners_email,
            mail_title, mail_message)

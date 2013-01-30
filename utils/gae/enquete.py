# Enquete page editing and submitting.
# coding=utf-8
from google.appengine.api import users

import StringIO
import csv
import schema
import webapp_generic
import throttled_mail_sender

class EnqueteAdminEdit(webapp_generic.WebAppGenericProcessor):
    """Admin edits the enquete questionnaire."""
    def get(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        event = self.event_cache.get_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        if not self.check_auth_owner(event):
            self.http_error_message('Not your event')
            return
        enquete = self.enquete_cache.get_uncached(eventid)
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
    def post(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        event = self.event_cache.get_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        if not self.check_auth_owner(event):
            self.http_error_message('Not your event')
            return
        enquete = self.enquete_cache.get_uncached(eventid)
        if enquete == None:
            enquete = schema.EventEnquete()
        enquete.eventid = eventid
        enquete.overall_message = self.request.get('overall_message')
        enquete.question_text = self.request.get('question_text').splitlines()
        enquete.put()
        self.enquete_cache.invalidate_cache(eventid)
        template_values = {
            'eventid': eventid,
            }
        self.template_render_output(template_values, 'Thanks.html')


class EnqueteAdminSendMail(webapp_generic.WebAppGenericProcessor):
    """Send mail to all participants by request of the administrator.
    This code will queue the mail through GAE taskqueue."""
    def get(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        event = self.event_cache.get_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        if not self.check_auth_owner(event):
            self.http_error_message('Not your event')
            return
        enquete = self.enquete_cache.get_cached(eventid)
        if enquete == None:
            self.http_error_message('Enquete for event id %s not found' %
                                    (eventid))
            return
        attendances, num_attend, num_enkai_attend = self.load_users_with_eventid(eventid)
        self.response.headers['Content-type'] = 'text/plain; charset=utf-8'
        for attendance in attendances:
            mail_template = {
                'eventid': eventid,
                'event': event,
                'user_realname': attendance.user_realname,
                'admin_email': user.email()
                }
            mail_message = self.template_render(
                mail_template, 'EnqueteAdminSendMail.txt')
            mail_title = "[Debian登録システム] イベント %s のアンケートの依頼" % event.title.encode('utf-8')

            throttled_mail_sender.send_mail(
                eventid,
                attendance.user.email(),
                mail_title,
                mail_message)

            # show page content
            self.response.out.write(mail_message)


class EnqueteRespond(webapp_generic.WebAppGenericProcessor):
    """Page for user to enter form for enquete."""
    # TODO: should I allow for editing ?
    def get(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        attendance = self.load_attendance_with_eventid_and_user(eventid, user)
        if attendance == None:
            self.http_error_message('User not registered in event %s' %
                                    (eventid))
            return
        event = self.event_cache.get_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        enquete = self.enquete_cache.get_cached(eventid)
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
    def post(self):
        eventid = self.request.get('eventid')
        user = users.get_current_user()
        event = self.event_cache.get_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        attendance = self.load_attendance_with_eventid_and_user(eventid, user)
        if attendance == None:
            self.http_error_message('User not registered in event %s' %
                                    (eventid))
            return
        enquete = self.enquete_cache.get_cached(eventid)
        if enquete == None:
            self.http_error_message('Enquete for event id %s not found' %
                                    (eventid))
            return
        enquete_response = schema.EventEnqueteResponse()
        enquete_response.eventid = eventid
        enquete_response.user = user
        enquete_response.overall_comment = self.request.get('overall_comment')
        for sequence, question_item in enumerate(enquete.question_text):
            enquete_response.question_response.append(long(self.request.get('question' + str(sequence))))
        enquete_response.put()
        self.enquete_response_cache.invalidate_cache(eventid)

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
            'overall_comment': enquete_response.overall_comment,
            }
        mail_message = self.template_render(
            mail_template, 'EnqueteRespondDone.txt')
        mail_title = "[Debian登録システム] イベント %s のアンケート結果" % event.title.encode('utf-8')

        throttled_mail_sender.send_mail(
            eventid,
            user.email(),
            mail_title,
            mail_message)

def convert_score_to_string(value):
    """Convert score to string for processing with R. 0 is converted to NA."""
    if value == 0:
        return 'NA'
    return str(value)

class EnqueteAdminShowEnqueteResult(webapp_generic.WebAppGenericProcessor):
    """Admin lists enquete results summary."""
    def get(self):
        eventid = self.request.get('eventid')
        event = self.event_cache.get_cached(eventid)
        if event == None:
            self.http_error_message('Event id %s not found' % (eventid))
            return
        if not self.check_auth_owner(event):
            self.http_error_message('Not your event')
            return
        enquete = self.enquete_cache.get_cached(eventid)
        if enquete == None:
            self.http_error_message('Enquete for event id %s not found' %
                                    (eventid))
            return
        enquete_responses = self.enquete_response_cache.get_cached(eventid)
        if enquete_responses == None:
            self.http_error_message('Event id %s has not enquete response' % (eventid))
            return

        # Output csv buffer for doing output in csv format.
        string_io = StringIO.StringIO()
        csv_writer = csv.writer(string_io)

        csv_writer.writerow([x.encode('utf-8') for x in enquete.question_text] + 
                            ['自由記入'])
        for enquete_response in enquete_responses:
            csv_writer.writerow(
                [convert_score_to_string(x)
                 for x in enquete_response.question_response] +
                [enquete_response.overall_comment.encode('utf-8')]
                )

        self.response.headers['Content-type'] = 'text/csv; charset=utf-8'
        self.response.headers['Content-Disposition'] = 'attachment; filename=enquete.csv'
        self.response.out.write(string_io.getvalue())


class EnqueteAdminShowAllEnqueteResults(webapp_generic.WebAppGenericProcessor):
    """Admin lists all enquete results."""

    def conditional_get_enquete_map(self, enquete_map_of_user_key, key):
        """Get the key from enquete map with optional mapping of 0 to NA."""
        return convert_score_to_string(enquete_map_of_user_key.get(key, 'NA'))

    def generate_question_key(self, event, question_text, eventid):
        """Generate a key string used for question.

        The string should be reasonably unique and also readable for
        later analysis with R.

        Returns utf-8 string."""
        return (
            event.title + '-' + question_text + '-' + eventid[:4]
            ).encode('utf-8')

    def get(self):
        """List all enquete results in a big matrix."""

        # Output csv buffer for doing output in csv format.
        string_io = StringIO.StringIO()
        csv_writer = csv.writer(string_io)

        user = users.get_current_user()
        events = self.load_event_with_owners(user)

        # dict contains user -> event -> score.
        enquete_map = {}

        # questions dict which is eventid + question -> True.
        list_of_questions = {}

        for event in events:
            eventid = event.eventid

            # load event information for the title. If an event didn't
            # exist, that's weird, but allow for an error.
            event = self.event_cache.get_cached(eventid)
            if event == None:
                self.http_error_message('Event id %s not found' % (eventid))
                continue

            enquete = self.enquete_cache.get_cached(eventid)
            if enquete == None:
                # There wasn't an enquete for this eventid, which is a
                # reasonable error condition before enquete is
                # created.
                continue

            enquete_responses = self.enquete_response_cache.get_cached(eventid)
            if enquete_responses == None:
                # It's also possible that there is no enquete response
                # for an enquete.
                continue

            # We now have a list of enquete responses and matching events.
            for i in range(len(enquete.question_text)):
                # a key to use for the map. Use the first 4 letters of
                # the hash and question name to make it reasonably
                # unique.
                question_key = self.generate_question_key(event, 
                                                          enquete.question_text[i], 
                                                          eventid)

                list_of_questions[question_key] = True

                for enquete_response in enquete_responses:
                    if len(enquete_response.question_response) < i:
                        # check for data corruption case where enquete
                        # was updated after the respose was made
                        continue
                    enquete_map.setdefault(
                        enquete_response.user.email(), 
                        {})[question_key] = (
                        enquete_response.question_response[i])

        self.response.headers['Content-type'] = 'text/csv; charset=utf-8'
        self.response.headers['Content-Disposition'] = 'attachment; filename=enquete.csv'

        sorted_list_of_questions = sorted(list_of_questions.keys())

        csv_writer.writerow(sorted_list_of_questions)

        for user_email in enquete_map.iterkeys():
            csv_writer.writerow(
                [self.conditional_get_enquete_map(
                        enquete_map[user_email], x) 
                 for x in sorted_list_of_questions])

        self.response.out.write(string_io.getvalue())

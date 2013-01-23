from google.appengine.api import memcache

import schema

MEMCACHE_EXPIRE_TIME = 24 * 60 * 60 # Make it so that cache expires after 24 hours. Should be good enough?

class MemcacheManager:
    """Convenience class to have memcache managed.

    Instead of raw content, memcache will store a dictionary with
    'value' so that it is possible to store 'None' too.

    Inherit this class and define the key and uncached get methods.
    """
    def get_uncached(self, key):
        """Get something uncached."""
        return None # TODO: make it error

    def memcache_key(self, key):
        """Get key for use with memcache."""
        return None # TODO: make it error

    def get_cached(self, key):
        """Get something cached."""
        cached_data = memcache.get(self.memcache_key(key))
        if cached_data is not None:
            return cached_data['value']
        data = self.get_uncached(key)
        cached_data = {
            'value': data
            }
        memcache.add(
            self.memcache_key(key), 
            cached_data, 
            MEMCACHE_EXPIRE_TIME)
        return data

    def invalidate_cache(self, key):
        memcache.delete(self.memcache_key(key))

class EnqueteCache(MemcacheManager):
    """Cache for enquete."""
    def get_uncached(self, eventid):
        enquetes = schema.EventEnquete.gql('WHERE eventid = :1 ORDER BY timestamp DESC LIMIT 1', eventid)
        enquete = enquetes.get()
        return enquete

    def memcache_key(self, eventid):
        return 'enquete %s' % eventid


class EnqueteResponseCache(MemcacheManager):
    """Cache for enquete, keyed by eventid. This is a list of responses.
    Use extract_user for extracting the specific user's response."""
    def get_uncached(self, eventid):
        enquete_responses = schema.EventEnqueteResponse.gql(
            'WHERE eventid = :1 ORDER BY timestamp DESC', 
            eventid).fetch(1000)
        return enquete_responses

    def memcache_key(self, eventid):
        return 'enquete_response %s' % eventid

    def get_cached_for_user(self, eventid, user):
        """Return the enquete response for the particular user."""
        enquete_responses = self.get_cached(eventid)
        for enquete_response in enquete_responses:
            if enquete_response.user == user:
                return enquete_response
        return None


class EventCache(MemcacheManager):
    """Cache for event."""
    def get_uncached(self, eventid):
        events = schema.Event.gql('WHERE eventid = :1 ORDER BY timestamp DESC LIMIT 1', eventid)
        event = events.get()
        if event is not None:
            self.fixup_event(event)
        return event

    def memcache_key(self, eventid):
        return 'load_event_with_eventid_v3 %s' % eventid

    def fixup_event(self, event):
        """Fixup event after loading.

        Try to cover migration where event.prework -> prework_text, and content -> content_text
        """
        if event.content_text is None:
            event.content_text = event.content
        if event.prework_text is None:
            event.prework_text = event.prework

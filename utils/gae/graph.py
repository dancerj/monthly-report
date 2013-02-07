import time
import datetime

NUM_BUCKETS = 10
WIDTH = 500
HEIGHT = 100
def get_bucket_seconds(timestamps):
    """Take an array of datetime timestamps, and bucket them as histogram
    for output.

    returns a dict with labels, and a series which is array of index,
    frequency and bucket representative value."""
    seconds = [{'timestamp': timestamp, 
                'seconds': time.mktime(timestamp.timetuple()),
                } for timestamp in timestamps]
    min_seconds = min(seconds, key=lambda s: s['seconds'])
    max_seconds = max(seconds, key=lambda s: s['seconds'])
    time_range = max_seconds['seconds'] - min_seconds['seconds']

    # If there's no range, I can't bucket it.
    if time_range == 0:
        return []

    bucket_interval = (time_range + 1) / float(NUM_BUCKETS)
    bucketed_frequency = [0] * NUM_BUCKETS
    for second in seconds:
        bucket = int((second['seconds'] - min_seconds['seconds']) / bucket_interval)
        bucketed_frequency[bucket] += 1
    max_bucketed_frequency = max(bucketed_frequency)

    return { 'ylabel_top': max_bucketed_frequency, 
             'ylabel_bottom': 0,
             'xlabel_right': max_seconds['timestamp'].strftime("%Y-%m-%d"), 
             'xlabel_left': min_seconds['timestamp'].strftime("%Y-%m-%d"),
             'series':
                 [{ 'index': i, 
                    'frequency': frequency, 
                    'bucket': i * bucket_interval + min_seconds['seconds'],
                    'x': i * (WIDTH / NUM_BUCKETS),
                    'y': HEIGHT - (frequency / max_bucketed_frequency) * HEIGHT,
                    } for i, frequency in enumerate(bucketed_frequency)],
             }


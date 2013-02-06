NUM_BUCKETS = 10
WIDTH = 500
HEIGHT = 100
def get_bucket_delta_seconds(delta_seconds):
    """Take an array of delta seconds, and bucket them as histogram
    for output.

    returns a dict with labels, and a series which is array of index,
    frequency and bucket representative value."""
    min_delta_seconds = min(delta_seconds)
    max_delta_seconds = max(delta_seconds)
    time_range = max_delta_seconds - min_delta_seconds

    # If there's no range, I can't bucket it.
    if time_range == 0:
        return []

    bucket_interval = (time_range + 1) / float(NUM_BUCKETS)
    bucketed_frequency = [0] * NUM_BUCKETS
    for delta_second in delta_seconds:
        bucket = int((delta_second - min_delta_seconds) / bucket_interval)
        bucketed_frequency[bucket] += 1
    max_bucketed_frequency = max(bucketed_frequency)

    return { 'ylabel_top': max_bucketed_frequency, 
             'ylabel_bottom': 0,
             'xlabel_right': max_delta_seconds, 
             'xlabel_left': min_delta_seconds,
             'series':
                 [{ 'index': i, 
                    'frequency': frequency, 
                    'bucket': i * bucket_interval + min_delta_seconds,
                    'x': i * (WIDTH / NUM_BUCKETS),
                    'y': HEIGHT - (frequency / max_bucketed_frequency) * HEIGHT,
                    } for i, frequency in enumerate(bucketed_frequency)],
             }


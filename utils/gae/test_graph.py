import unittest
import datetime

import graph

class TestBucketDeltaSeconds(unittest.TestCase):
    def setUp(self):
        """setup."""

    def testBucketing(self):
        times = [datetime.datetime(2013, 2, 9, 13, 12, 28, 0),
                datetime.datetime(2013, 2, 9, 13, 12, 30, 0),
                datetime.datetime(2013, 2, 9, 13, 12, 50, 0),
                datetime.datetime(2013, 2, 10, 13, 12, 50, 0)]
        buckets = graph.get_bucket_seconds(times)
        self.assertEqual({'ylabel_bottom': 0, 'xlabel_right': '2013-02-10', 'series': [{'y': 0.0, 'index': 0, 'frequency': 3, 'bucket': 1360383148.0, 'x': 0}, {'y': 100.0, 'index': 1, 'frequency': 0, 'bucket': 1360391790.3, 'x': 50}, {'y': 100.0, 'index': 2, 'frequency': 0, 'bucket': 1360400432.6, 'x': 100}, {'y': 100.0, 'index': 3, 'frequency': 0, 'bucket': 1360409074.9, 'x': 150}, {'y': 100.0, 'index': 4, 'frequency': 0, 'bucket': 1360417717.2, 'x': 200}, {'y': 100.0, 'index': 5, 'frequency': 0, 'bucket': 1360426359.5, 'x': 250}, {'y': 100.0, 'index': 6, 'frequency': 0, 'bucket': 1360435001.8, 'x': 300}, {'y': 100.0, 'index': 7, 'frequency': 0, 'bucket': 1360443644.1, 'x': 350}, {'y': 100.0, 'index': 8, 'frequency': 0, 'bucket': 1360452286.4, 'x': 400}, {'y': 66.66666666666667, 'index': 9, 'frequency': 1, 'bucket': 1360460928.7, 'x': 450}], 'xlabel_left': '2013-02-09', 'ylabel_top': 3} , 
                         buckets)

if __name__ == '__main__':
    unittest.main()



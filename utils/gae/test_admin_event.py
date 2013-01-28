import admin_event
import unittest

class TestBucketDeltaSeconds(unittest.TestCase):
    def setUp(self):
        """setup."""

    def testBucketing(self):
        delta_seconds = [10, 86400+100, 86400+300, 86400*2 + 100, 86400 * 4]
        buckets = admin_event.get_bucket_delta_seconds(delta_seconds)
        self.assertEqual(buckets, [1, 0, 2, 0, 0, 1, 0, 0, 0, 1])

if __name__ == '__main__':
    unittest.main()



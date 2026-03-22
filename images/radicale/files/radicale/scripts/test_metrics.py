import unittest
from unittest.mock import patch, MagicMock
import os
import sys

# Mock prometheus_client
sys.modules['prometheus_client'] = MagicMock()

class TestRadicaleMetrics(unittest.TestCase):
    @patch('os.walk')
    def test_get_event_count(self, mock_walk):
        mock_walk.return_value = [
            ('/root', ['dir1'], ['a.ics']),
            ('/root/dir1', [], ['b.ics', 'c.txt'])
        ]
        from metrics_exporter import get_event_count
        count = get_event_count('/root')
        self.assertEqual(count, 2)

    @patch('subprocess.check_output')
    def test_get_git_sync_status_healthy(self, mock_subprocess):
        mock_subprocess.return_value = b"Your branch is up to date with 'origin/main'."
        from metrics_exporter import get_git_sync_status
        status = get_git_sync_status('/var/lib/radicale')
        self.assertEqual(status, 1)

    def test_parse_nlp_success(self):
        log_lines = [
            "Agentic v3: Update -> WORK",
            "Agentic v3: Lunch -> PERSONAL"
        ]
        from metrics_exporter import parse_nlp_success
        count = parse_nlp_success(log_lines)
        self.assertEqual(count, 2)

if __name__ == '__main__':
    unittest.main()

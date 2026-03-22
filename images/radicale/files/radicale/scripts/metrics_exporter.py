import os, subprocess, time
from prometheus_client import start_http_server, Gauge, Counter

def get_event_count(path):
    count = 0
    for root, dirs, files in os.walk(path):
        count += sum(1 for f in files if f.endswith('.ics'))
    return count

def get_git_sync_status(path):
    try:
        output = subprocess.check_output(['git', '-C', path, 'status'], stderr=subprocess.STDOUT).decode('utf-8')
        return 1 if 'up to date with' in output else 0
    except:
        return 0

def parse_nlp_success(lines):
    return sum(1 for line in lines if 'Agentic v3:' in line)

if __name__ == '__main__':
    # Only run server if not imported
    DATA_DIR = os.getenv('RADICALE_DATA_DIR', '/var/lib/radicale')
    LOG_FILE = os.getenv('RADICALE_LOG_FILE', '/var/log/radicale/radicale.log')
    
    # Prometheus Gauges
    events_gauge = Gauge('radicale_events_total', 'Total number of calendar events')
    sync_gauge = Gauge('radicale_git_sync_status', 'Git sync status (1=synced, 0=unsynced)')
    nlp_counter = Counter('radicale_nlp_success_total', 'Total successful NLP categorisations')
    
    start_http_server(9100)
    print('>>> Radicale Prometheus Exporter started on port 9100')
    
    while True:
        events_gauge.set(get_event_count(DATA_DIR))
        sync_gauge.set(get_git_sync_status(DATA_DIR))
        # Note: In production, we would tail the log. For this logic, we provide the parsing function.
        time.sleep(60)

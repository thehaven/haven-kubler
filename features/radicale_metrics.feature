Feature: Radicale Prometheus Metrics
  As an SRE, I want to monitor Radicale health and storage.

  Rule: Metrics are exposed via an HTTP endpoint on port 9100

    @critical
    Scenario: Metrics endpoint is reachable
      Given the metrics exporter is running
      When I request "/metrics" on port 9100
      Then the response status is 200
      And the response contains "radicale_events_total"

  Rule: Storage metrics accurately reflect the filesystem state

    Scenario: Event count increases when a new .ics file is added
      Given the current "radicale_events_total" is X
      When a new file "test.ics" is created in "/var/lib/radicale"
      And I wait for the cache refresh
      Then the new "radicale_events_total" is X + 1

  Rule: Git sync health is reported

    @critical
    Scenario: Git sync status is reported as healthy
      Given the Git repository in "/var/lib/radicale" is synced with origin
      When I request "/metrics"
      Then the metric "radicale_git_sync_status" has value 1

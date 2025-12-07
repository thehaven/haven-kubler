#!/bin/sh
# HAProxy health check - simple and reliable

# Check if HAProxy process is running
pgrep -x haproxy > /dev/null 2>&1

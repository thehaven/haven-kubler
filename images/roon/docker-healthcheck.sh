#!/usr/bin/env sh
set -eo pipefail

# Do some tests and exit with either 0 for healthy or 1 for unhealthy
if [ $( ps | grep /app/RoonServer/RoonMono/bin/RoonServer | wc -l ) -ge 2 ]; then
  exit 0
else
  exit 1
fi

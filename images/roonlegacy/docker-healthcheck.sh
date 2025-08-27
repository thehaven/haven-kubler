#!/usr/bin/env sh
set -eu

HOST="${HEALTH_HOST:-127.0.0.1}"
PORTS="${HEALTH_PORTS:-9332 9330}"
TIMEOUT="${HEALTH_TIMEOUT:-2}"

for p in $PORTS; do
  if nc -z -w "$TIMEOUT" "$HOST" "$p"; then
    exit 0
  fi
done

# No control sockets are accepting connections yet
exit 1

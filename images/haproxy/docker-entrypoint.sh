#!/bin/sh
set -e

# Check if HAProxy config exists, if not copy default
HAPROXY_CONFIG_TYPE="custom"
if [ ! -f /etc/haproxy/haproxy.cfg ]; then
    echo "No HAProxy configuration found, using default config..."
    cp /usr/share/haproxy/haproxy.cfg.default /etc/haproxy/haproxy.cfg
    echo "Default HAProxy configuration copied to /etc/haproxy/haproxy.cfg"
    HAPROXY_CONFIG_TYPE="default"
else
    echo "Using custom HAProxy configuration: /etc/haproxy/haproxy.cfg"
fi

# Check if Dataplane API config exists
DATAPLANE_CONFIG_TYPE="custom"
if [ -f /etc/haproxy/dataplaneapi.yaml ]; then
    DATAPLANE_ENABLED=true
    echo "Using custom Dataplane API configuration: /etc/haproxy/dataplaneapi.yaml"
else
    # Copy default config for convenience (zero-config deployment)
    echo "No Dataplane API configuration found, using default config..."
    cp /usr/share/haproxy/dataplaneapi.yaml.default /etc/haproxy/dataplaneapi.yaml
    echo "Default Dataplane API configuration copied to /etc/haproxy/dataplaneapi.yaml"
    DATAPLANE_ENABLED=true
    DATAPLANE_CONFIG_TYPE="default"
fi

# Display startup information
echo ""
if [ "$HAPROXY_CONFIG_TYPE" = "default" ]; then
    echo "Starting HAProxy with default configuration:"
    echo "  - HTTP on port 80"
    echo "  - Prometheus metrics on port 8404/metrics"
    echo "  - Stats UI on port 8404/stats"
else
    echo "Starting HAProxy with custom configuration"
    echo "  (ports and frontends defined in your haproxy.cfg)"
fi

if [ "$DATAPLANE_ENABLED" = "true" ]; then
    if [ "$DATAPLANE_CONFIG_TYPE" = "default" ]; then
        echo "  - Dataplane API on port 5555 (default config)"
        echo ""
        echo "Default Dataplane API credentials: admin / haproxy"
        echo "⚠️  CHANGE THESE CREDENTIALS IN PRODUCTION!"
    else
        echo "  - Dataplane API enabled (using custom config)"
    fi
fi
echo ""

# Start HAProxy in the background
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -W -db &
HAPROXY_PID=$!

# Start Dataplane API if enabled
if [ "$DATAPLANE_ENABLED" = "true" ]; then
    echo "Starting HAProxy Dataplane API..."
    # Don't fail container if Dataplane API fails to start
    if /usr/bin/dataplaneapi --config-file=/etc/haproxy/dataplaneapi.yaml & then
        DATAPLANEAPI_PID=$!
        echo "Dataplane API started successfully (PID: $DATAPLANEAPI_PID)"
    else
        echo "⚠️  WARNING: Dataplane API failed to start, continuing with HAProxy only"
        DATAPLANE_ENABLED=false
    fi
fi

# Function to handle shutdown
shutdown() {
    echo "Shutting down..."
    if [ -n "$DATAPLANEAPI_PID" ]; then
        kill -TERM "$DATAPLANEAPI_PID" 2>/dev/null || true
    fi
    kill -TERM "$HAPROXY_PID" 2>/dev/null || true
    wait
    exit 0
}

# Trap signals
trap shutdown TERM INT

# Wait for processes
wait $HAPROXY_PID

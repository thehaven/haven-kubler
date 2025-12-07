## haven/haproxy

This image includes HAProxy with support for:

- **HAProxy Dataplane API** - Runtime configuration and management API (port 5555)
- **Built-in Prometheus Metrics** - Native metrics endpoint (port 8404)
- **Hatop** - HAProxy monitoring tool

### Quick Start (No Configuration Required)

Run HAProxy with everything enabled out-of-the-box:

```bash
docker run -d \
    --name haproxy --hostname haproxy \
    -p 80:80/tcp \
    -p 5555:5555/tcp \
    -p 8404:8404/tcp \
    haven/haproxy:latest
```

The entrypoint will automatically create default configurations if none are mounted. The default configuration includes production-ready best practices:

**Core Features:**

- **HTTP frontend** on port 80 with security headers and rate limiting
- **HTTPS frontend** template (ready to uncomment when you add SSL certs)
- **Dataplane API** on port 5555 (credentials: `admin` / `haproxy`)
- **Prometheus metrics** endpoint at `http://localhost:8404/metrics`
- **Stats UI** at `http://localhost:8404/stats`

**Production Features:**

- **Gzip compression** for text/html, CSS, JS, JSON, XML
- **Security headers**: X-Frame-Options, X-Content-Type-Options, X-XSS-Protection
- **Rate limiting**: 100 requests/second per IP address
- **HTTP/2 support** (when HTTPS enabled with ALPN)
- **Modern TLS ciphers** (TLS 1.2+ only)
- **Connection reuse** and keep-alive for better performance
- **Health checks** on backend servers
- **Request forwarding headers** (X-Forwarded-For)

⚠️ **Security Warning**: The default Dataplane API credentials are `admin` / `haproxy`. **Change these in production!**

### Custom Configuration

#### Volume Mount Strategy

Both HAProxy and Dataplane API configurations share the **same volume**: `/etc/haproxy/`

- **HAProxy config**: `/etc/haproxy/haproxy.cfg`
- **Dataplane API config**: `/etc/haproxy/dataplaneapi.yaml`
- **SSL certificates**: `/etc/ssl/`

You can mount the entire directory or individual files:

##### Option 1: Mount entire config directory

```bash
docker run -d \
    --name haproxy --hostname haproxy \
    -p 80:80/tcp \
    -p 443:443/tcp \
    -p 5555:5555/tcp \
    -p 8404:8404/tcp \
    -v "./config:/etc/haproxy:ro" \
    -v "./ssl:/etc/ssl:ro" \
    --restart=unless-stopped \
    haven/haproxy:latest
```

##### Option 2: Mount individual config files

```bash
docker run -d \
    --name haproxy --hostname haproxy \
    -p 80:80/tcp \
    -p 5555:5555/tcp \
    -p 8404:8404/tcp \
    -v "./haproxy.cfg:/etc/haproxy/haproxy.cfg:ro" \
    -v "./dataplaneapi.yaml:/etc/haproxy/dataplaneapi.yaml:ro" \
    haven/haproxy:latest
```

If you don't mount a config file, the default will be used automatically.

#### Extracting the Default Configuration

To get the default configuration file for customization:

```bash
# Start a temporary container
docker run --rm haven/haproxy:latest cat /usr/share/haproxy/haproxy.cfg.default > haproxy.cfg

# Edit the config as needed
vim haproxy.cfg

# Run with your customized config
docker run -d \
    --name haproxy \
    -p 80:80 -p 8404:8404 \
    -v "$(pwd)/haproxy.cfg:/etc/haproxy/haproxy.cfg:ro" \
    haven/haproxy:latest
```

### HAProxy Dataplane API

The HAProxy Dataplane API provides a RESTful interface for managing HAProxy configuration at runtime without restarts. **The API is enabled by default** with credentials `admin` / `haproxy`.

#### Using the Dataplane API

The API is automatically started as a sidecar process. Access it directly:

```bash
# Get configuration
curl -u admin:haproxy http://localhost:5555/v2/services/haproxy/configuration/backends

# Add a backend server
curl -X POST -u admin:haproxy \
  -H "Content-Type: application/json" \
  -d '{"name":"web1","address":"192.168.1.10","port":8080}' \
  http://localhost:5555/v2/services/haproxy/configuration/servers?backend=http_back

# List all servers in a backend
curl -u admin:haproxy http://localhost:5555/v2/services/haproxy/configuration/servers?backend=http_back
```

#### Customizing the Dataplane API

The default Dataplane API configuration includes:

**Features:**

- **Atomic transactions**: Configuration changes are validated and applied atomically
- **Failed transaction retention**: Keep failed configs for debugging
- **Automatic validation**: Checks config syntax before applying changes
- **Graceful reloads**: Uses SIGUSR2 for zero-downtime reloads
- **Resource management**: Organized directories for maps, SSL certs, and storage
- **Logging**: Warning level by default (configurable to debug/info/error)
- **System info**: API responses include HAProxy version and system details

To customize credentials or other settings, create your own `/etc/haproxy/dataplaneapi.yaml`:

```yaml
dataplaneapi:
  host: 0.0.0.0
  port: 5555
  
  user:
    - name: admin
      password: your-secure-password-here
      insecure: true  # Set to false for production with proper TLS
  
  log:
    level: info  # debug, info, warning, error
    format: text
  
  transaction:
    transaction_dir: /tmp/haproxy
    keep_failed: true
  
  haproxy:
    config_file: /etc/haproxy/haproxy.cfg
    haproxy_bin: /usr/sbin/haproxy
    
    reload:
      reload_delay: 5
      reload_cmd: "kill -SIGUSR2 1"
      validate_cmd: "/usr/sbin/haproxy -c -f /etc/haproxy/haproxy.cfg"
      
    runtime_api_urls:
      - /run/haproxy.sock
```

Mount this file to override the default:

```bash
docker run -d \
    --name haproxy \
    -p 80:80/tcp \
    -p 5555:5555/tcp \
    -v "./dataplaneapi.yaml:/etc/haproxy/dataplaneapi.yaml:ro" \
    haven/haproxy:latest
```

To extract the full default configuration:

```bash
docker run --rm haven/haproxy:latest cat /usr/share/haproxy/dataplaneapi.yaml.default > dataplaneapi.yaml
```

#### Adding Backend Servers

The default configuration includes an empty backend. Add your servers using the Dataplane API:

```bash
# Add backend servers dynamically
curl -X POST -u admin:haproxy \
  -H "Content-Type: application/json" \
  -d '{"name":"web1","address":"192.168.1.10","port":8080,"check":"enabled"}' \
  http://localhost:5555/v2/services/haproxy/configuration/servers?backend=http_back

curl -X POST -u admin:haproxy \
  -H "Content-Type: application/json" \
  -d '{"name":"web2","address":"192.168.1.11","port":8080,"check":"enabled"}' \
  http://localhost:5555/v2/services/haproxy/configuration/servers?backend=http_back

# Commit the transaction
curl -X POST -u admin:haproxy \
  http://localhost:5555/v2/services/haproxy/configuration/transactions/<transaction_id>
```

Or edit your `haproxy.cfg` backend section:

```haproxy
backend http_back
    balance roundrobin
    option http-keep-alive
    server web1 192.168.1.10:8080 check inter 5s fall 3 rise 2
    server web2 192.168.1.11:8080 check inter 5s fall 3 rise 2
```

#### Dataplane API Documentation

- API Specification: `http://localhost:5555/v2/specification`
- Full documentation: [HAProxy Dataplane API](https://www.haproxy.com/documentation/dataplaneapi/latest/)

### HAProxy Prometheus Metrics

HAProxy 3.x includes built-in Prometheus metrics support through its stats endpoint. **Metrics are enabled by default** on port 8404.

#### Accessing Metrics

Metrics are immediately available:

```bash
# View all metrics
curl http://localhost:8404/metrics

# View stats UI
open http://localhost:8404/stats
```

#### Configuration

The default configuration includes:

   ```haproxy
   frontend stats
       bind *:8404
       http-request use-service prometheus-exporter if { path /metrics }
       stats enable
       stats uri /stats
       stats refresh 10s
   ```

   This configuration:
   - Exposes Prometheus metrics at `http://<host>:8404/metrics`
   - Provides HAProxy stats UI at `http://<host>:8404/stats`

3. **Configure Prometheus** to scrape the metrics:

   ```yaml
   scrape_configs:
     - job_name: 'haproxy'
       static_configs:
         - targets: ['haproxy:8404']
       metrics_path: '/metrics'
   ```

4. **Available metrics** include:
   - `haproxy_backend_status` - Backend status (UP/DOWN)
   - `haproxy_backend_current_sessions` - Current sessions
   - `haproxy_backend_bytes_in_total` - Total bytes received
   - `haproxy_backend_bytes_out_total` - Total bytes sent
   - `haproxy_backend_http_responses_total` - HTTP responses by code
   - `haproxy_server_status` - Server status
   - `haproxy_server_check_failures_total` - Health check failures
   - And many more...

5. **Access metrics directly**:

   ```bash
   curl http://localhost:8404/metrics
   ```

### Docker Compose Example

Here's a complete Docker Compose setup with both Dataplane API and Prometheus metrics:

```yaml
version: '3.8'
services:
  haproxy:
    image: haven/haproxy:latest
    container_name: haproxy
    ports:
      - "80:80"
      - "443:443"
      - "5555:5555"  # Dataplane API
      - "8404:8404"  # Metrics & Stats
    volumes:
      - ./haproxy:/etc/haproxy
      - ./ssl:/etc/ssl
    restart: unless-stopped
```

**How it works:**

- The entrypoint automatically starts HAProxy
- If `/etc/haproxy/dataplaneapi.yaml` exists, it automatically starts the Dataplane API sidecar
- Prometheus metrics are exposed directly by HAProxy on port 8404 via the `prometheus-exporter` service in haproxy.cfg (see configuration above)
- No manual process management needed!

### Kubernetes Example

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: haproxy
spec:
  containers:
  - name: haproxy
    image: haven/haproxy:latest
    ports:
    - containerPort: 80
    - containerPort: 443
    - containerPort: 5555  # Dataplane API (if configured)
    - containerPort: 8404  # Metrics & Stats
    volumeMounts:
    - name: config
      mountPath: /etc/haproxy
    - name: ssl
      mountPath: /etc/ssl
  volumes:
  - name: config
    configMap:
      name: haproxy-config
  - name: ssl
    secret:
      secretName: haproxy-ssl
```

The entrypoint will automatically start the Dataplane API sidecar process if `/etc/haproxy/dataplaneapi.yaml` is present in the ConfigMap.

### Health Checks

The image uses a simple, reliable health check that works with **any custom configuration**:

**Health Check:** Verifies the HAProxy process is running

**Why this approach:**

- ✅ Works with any custom configuration (any ports, any frontends)
- ✅ No dependency on specific endpoints or ports
- ✅ Simple and fast
- ✅ Most reliable indicator of service health

**Health Check Parameters:**

- **Interval**: 10 seconds
- **Timeout**: 3 seconds
- **Start period**: 10 seconds (allows time for HAProxy to initialize)
- **Retries**: 3

You can override these in your deployment if needed.

---

[Last Build][packages]

[packages]: PACKAGES.md

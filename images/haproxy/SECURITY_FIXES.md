# HAProxy Security Improvements Applied

## Changes Made

### 1. Fixed Dataplane API Crash (Nil Pointer Dereference)

- **Problem**: Dataplane API started before HAProxy runtime socket was ready
- **Solution**: Added infinite wait loop for `/var/run/haproxy.sock` before starting Dataplane API (no timeout)

### 2. Run Dataplane API as Non-Root User

- **Problem**: Dataplane API was running as root
- **Solution**:
  - Run dataplaneapi as `haproxy` user via `su`
  - Set ownership of `dataplaneapi.yaml` to `haproxy:haproxy`
  - Set ownership of runtime socket to `haproxy:haproxy`

### 3. Proper Directory Permissions

- **Problem**: Volume mounts can override build-time directories
- **Solution**: Create and set ownership of required directories at runtime:
  - `/etc/haproxy/maps`
  - `/etc/haproxy/ssl`
  - `/etc/haproxy/storage`
  - `/etc/haproxy/spoe` (Stream Processing Offload Engine)
  - `/etc/haproxy/backups`
  - `/tmp/haproxy`
  - `/tmp/haproxy/spoe`
  - `/var/lib/haproxy` (for chroot)
  - `/var/run` (for runtime socket)

### 4. Fixed Dataplane API 3.1.5 Configuration

- **Problem**: Missing required configuration fields caused nil pointer dereference
- **Solution**: Added required fields to dataplaneapi.yaml:
  - `spoe_dir` and `spoe_transaction_dir` for SPOE support
  - `backups_dir` for configuration backups
  - `log` section for proper logging configuration

## For Users with Custom haproxy.cfg

If you see this warning:

```text
[WARNING] HAProxy was started as the root user and does not make use of 'user' nor 'uid' global options
```

Add these lines to your `haproxy.cfg` in the `global` section:

```haproxy
global
    # Runtime API socket for Dataplane API
    stats socket /var/run/haproxy.sock mode 770 level admin expose-fd listeners
    
    user haproxy
    group haproxy
    chroot /var/lib/haproxy
```

## Rebuild Required

After pulling these changes, rebuild the image:

```bash
kubler build haven/haproxy
```

Or manually copy the updated `docker-entrypoint.sh` to test without rebuilding.

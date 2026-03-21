#!/bin/bash
set -e

DATA_DIR="/var/lib/radicale"
SCRIPTS_DIR="/opt/scripts"
CONFIG_DIR="/etc/radicale"

# 1. UID/GID Sync (Portability)
HOST_UID=$(stat -c '%u' "$DATA_DIR")
HOST_GID=$(stat -c '%g' "$DATA_DIR")
echo ">>> Syncing radicale user to host (UID: $HOST_UID, GID: $HOST_GID)..."
groupmod -g "$HOST_GID" radicale || true
usermod -u "$HOST_UID" -g "$HOST_GID" radicale || true

# 2. Git Identity (Ensures push works on any volume)
echo ">>> Configuring Git identity..."
export HOME="$DATA_DIR"
git config --global user.name "Radicale Server"
git config --global user.email "radicale@thehavennet.org.uk"
git config --global safe.directory "$DATA_DIR"

# 3. Secret Injection
if [ -n "$RADICALE_USERS_HTPASSWD" ]; then
    echo ">>> Injecting users from environment..."
    echo "$RADICALE_USERS_HTPASSWD" > "$CONFIG_DIR/users"
fi

# 4. Dynamic Recovery & Remote Setup
if [ -z "$(ls -A "$DATA_DIR")" ] && [ -n "$RADICALE_GIT_REMOTE" ]; then
    echo ">>> Data volume is empty. Recovery via git clone..."
    git clone "$RADICALE_GIT_REMOTE" "$DATA_DIR"
elif [ ! -d "$DATA_DIR/.git" ]; then
    echo ">>> Initializing new Git repository..."
    git init "$DATA_DIR"
fi

# Ensure remote is always correct
if [ -n "$RADICALE_GIT_REMOTE" ]; then
    echo ">>> Configuring Git remote origin..."
    git -C "$DATA_DIR" remote remove origin || true
    git -C "$DATA_DIR" remote add origin "$RADICALE_GIT_REMOTE"
fi

# 5. Hook Deployment
echo ">>> Refreshing pre-commit hooks..."
mkdir -p "$DATA_DIR/.git/hooks"
cp "$SCRIPTS_DIR/pre-commit" "$DATA_DIR/.git/hooks/pre-commit"
chmod +x "$DATA_DIR/.git/hooks/pre-commit"

# 6. Final Permissions & Privilege Drop
echo ">>> Applying final permissions..."
chown -R radicale:radicale "$CONFIG_DIR" "/var/log/radicale" "$DATA_DIR" "$SCRIPTS_DIR"

echo ">>> Starting Radicale..."
exec setpriv --reuid=radicale --regid=radicale --init-groups \
    /usr/bin/radicale --config "$CONFIG_DIR/config"
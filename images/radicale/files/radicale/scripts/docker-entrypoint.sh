#!/bin/bash
set -e

# Data directory
DATA_DIR="/var/lib/radicale"
SCRIPTS_DIR="/opt/scripts"

# Initialize Git repository if not present
if [ ! -d "$DATA_DIR/.git" ]; then
    echo "Initializing Git repository in $DATA_DIR..."
    git init "$DATA_DIR"
    cd "$DATA_DIR"
    
    if [ -n "$RADICALE_GIT_REMOTE" ]; then
        echo "Adding remote origin: $RADICALE_GIT_REMOTE"
        git remote add origin "$RADICALE_GIT_REMOTE"
    fi
fi

# Link/Copy the pre-commit hook to the repository
if [ -d "$DATA_DIR/.git/hooks" ]; then
    echo "Setting up pre-commit hook..."
    cp "$SCRIPTS_DIR/pre-commit" "$DATA_DIR/.git/hooks/pre-commit"
    chmod +x "$DATA_DIR/.git/hooks/pre-commit"
fi

# Execute Radicale
echo "Starting Radicale..."
exec /usr/bin/radicale --config /etc/radicale/config
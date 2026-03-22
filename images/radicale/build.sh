_packages="www-apps/radicale sys-apps/shadow sys-apps/util-linux"

configure_bob()
{
    update_keywords 'dev-python/uv' '+~amd64'
    emerge dev-python/uv
}

configure_rootfs_build()
{
    emerge net-misc/curl net-misc/rsync dev-vcs/git
    update_keywords 'dev-python/python-dateutil' '+~amd64'
    update_keywords 'dev-python/vobject' '+~amd64'
    update_keywords 'www-apps/radicale' '+~amd64'
    :
}

finish_rootfs_build()
{
    # Copy configuration files and create a golden copy for bootstrapping
    mkdir -p "${_EMERGE_ROOT}/etc/radicale"
    mkdir -p "${_EMERGE_ROOT}/opt/defaults/etc/radicale"
    for f in config rights logging; do
        cp -rp "${_CONFIG}/files/radicale/$f" "${_EMERGE_ROOT}/etc/radicale/" 2>/dev/null || true
        cp -rp "${_CONFIG}/files/radicale/$f" "${_EMERGE_ROOT}/opt/defaults/etc/radicale/" 2>/dev/null || true
    done
    
    # Copy scripts to /opt/scripts
    mkdir -p "${_EMERGE_ROOT}/opt/scripts"
    cp -rp "${_CONFIG}/files/radicale/scripts/"* "${_EMERGE_ROOT}/opt/scripts/"
    
    # Ensure log and data directories exist
    mkdir -p "${_EMERGE_ROOT}/var/log/radicale"
    mkdir -p "${_EMERGE_ROOT}/var/lib/radicale"
    
    # Setup venv for NLP in /opt/scripts/venv
    local venv_path="${_EMERGE_ROOT}/opt/scripts/venv"
    rm -rf "${venv_path}"
    
    echo ">>> Setting up NLP venv with uv..."
    # Ensure uv is available
    if ! type -p uv > /dev/null; then
        echo "!!! uv not found in PATH, attempting manual install..."
        emerge dev-python/uv
    fi
    
    # Use --seed to include pip so 'spacy download' works
    uv venv --seed "${venv_path}"
    uv pip install --python "${venv_path}/bin/python" spacy passlib bcrypt icalendar prometheus_client
    # Download spacy model
    "${venv_path}/bin/python" -m spacy download en_core_web_sm
    
    # Fix permissions (Radicale UID 327)
    chmod +x "${_EMERGE_ROOT}/opt/scripts/smart_categorize.py"
    chmod +x "${_EMERGE_ROOT}/opt/scripts/pre-commit"
    chmod +x "${_EMERGE_ROOT}/opt/scripts/docker-entrypoint.sh"
    
    chown -R 327:327 "${_EMERGE_ROOT}/etc/radicale"
    chown -R 327:327 "${_EMERGE_ROOT}/var/log/radicale"
    chown -R 327:327 "${_EMERGE_ROOT}/var/lib/radicale"
    chown -R 327:327 "${_EMERGE_ROOT}/opt/scripts"
}
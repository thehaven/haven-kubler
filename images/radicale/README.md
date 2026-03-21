## haven/radicale

A lightweight CalDAV/CardDAV server with Git-backed storage, automated mirroring, and intelligent NLP-driven categorisation.

### Core Features

- **Portability**: Automatically syncs internal user (UID/GID) to match your host volume permissions.
- **NLP Categorisation**: Automatically extracts tags (e.g., `DRUMS`, `KIDS`) from event summaries using spaCy.
- **Git Integrity**: Storage root `/var/lib/radicale` is a Git repository with automated commits and mirroring.
- **Disaster Recovery**: Automatically clones from `RADICALE_GIT_REMOTE` if the data volume is empty on boot.

### Environment Variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `RADICALE_GIT_REMOTE` | GitLab/GitHub remote URL for mirroring. | `https://oauth2:TOKEN@gitlab.com/user/repo.git` |
| `RADICALE_USERS_HTPASSWD` | Raw `htpasswd` content for user authentication. | `admin:$apr1$hash...` (Supports multiline) |

#### Managing Many Users
For large user sets, provide a multiline string in your `.env` or Docker Compose file:

```yaml
environment:
  - RADICALE_USERS_HTPASSWD=|
      user1:hash1
      user2:hash2
      user3:hash3
```

Alternatively, if this variable is unset, you can mount a custom users file directly to `/etc/radicale/users`.

### Usage

```bash
docker run -d \
  --name radicale \
  -p 5232:5232 \
  -e RADICALE_GIT_REMOTE="https://oauth2:TOKEN@gitlab.thehavennet.org.uk/systems/calendar.git" \
  -e RADICALE_USERS_HTPASSWD="haven:plain_or_hash_password" \
  -v /storage/radicale/data:/var/lib/radicale \
  -v /storage/radicale/config:/etc/radicale \
  haven/radicale
```

### NLP Engine
The **Agentic NLP Engine** (Python 3.13 + spaCy) runs on every Git commit via a `pre-commit` hook. 
- **Mappings**: Customise tagging rules in `/opt/scripts/mappings.json` (accessible via container exec or custom image build).
- **Group Expansion**: Map collective terms like "Kids" to individual members (`ALEXIS, ETHAN, ISAAC`).

### Git Configuration
The container automatically asserts its Git identity and configures `safe.directory` at runtime, ensuring `git push` works seamlessly even across different host environments.

[Last Build][packages]

[radicale]: https://radicale.org
[packages]: PACKAGES.md
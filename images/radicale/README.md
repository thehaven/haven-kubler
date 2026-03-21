## haven/radicale

A lightweight CalDAV/CardDAV server with Git-backed storage and intelligent NLP-driven categorisation.

### NLP Categorisation

This image includes an **Agentic NLP Engine** that automatically extracts metadata tags from event summaries.

- **Engine**: Python 3.12+ with spaCy (`en_core_web_sm`).
- **Feature**: Automatically injects `CATEGORIES` into `.ics` files based on the `SUMMARY`.
- **Customisation**: Mappings can be adjusted in `/etc/radicale/scripts/mappings.json`.
- **Hook**: Triggered via a Git `pre-commit` hook in the storage root.

### Usage

Run this [radicale][] image with:

```bash
docker run -d \
  --name radicale \
  -p 5232:5232 \
  -v radicale_config:/etc/radicale \
  -v radicale_data:/var/lib/radicale \
  haven/radicale
```

### Git-Backed Storage

The storage root `/var/lib/radicale` is intended to be a Git repository. Every change is automatically committed and can be pushed to a remote (e.g., GitLab).

Ensure your data volume is initialized as a Git repo if you want to use the automated mirroring and NLP features.

[Last Build][packages]

[radicale]: https://radicale.org
[packages]: PACKAGES.md

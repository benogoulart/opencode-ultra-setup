# Headroom

> **Original project:** https://github.com/headroomlabs-ai/headroom

Compresses context **before** sending it to the model, reducing token usage by ~20–57% without losing critical lines. It's **reversible** — it fetches the original text when needed.

## Installation

```bash
pip install "headroom-ai[all]"
```

## Running

A `start-headroom.ps1` launcher starts the proxy on port **8787** (logs in `~/.headroom/`).

## Routing OpenCode through it (optional)

OpenCode isn't routed through the proxy yet. To enable it, set the base URL for the provider:

```
ANTHROPIC_BASE_URL=http://127.0.0.1:8787   # via `headroom wrap` or the launcher
```

## Status

✅ **Installed and up** (v0.37.0) — proxy healthy at `http://127.0.0.1:8787/health`. Running standalone; routing OpenCode through it is optional and not yet configured.
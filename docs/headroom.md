# Headroom

> **Original project:** https://github.com/headroomlabs-ai/headroom

Compresses context **before** sending it to the model, reducing token usage by ~20–57% without losing critical lines. It's **reversible** — it fetches the original text when needed.

## Installation

```bash
pip install "headroom-ai[all]"
```

## Running

A `start-headroom.ps1` launcher starts the proxy on port **8787** (logs in `~/.headroom/`).

## Status

⏳ **Being tuned** — the proxy (health `http://127.0.0.1:8787/health`) had timeouts. See [plan](plano.md).
# opencode-supermemory

> **Original project:** https://github.com/supermemoryai/opencode-supermemory

**Persistent memory across sessions.** OpenCode remembers project conventions, decisions, and context even after closing the terminal or compressing the context.

## Installation

```bash
bunx opencode-supermemory@latest install --no-tui
bunx opencode-supermemory@latest login   # opens browser to authenticate
```

Creates the `/supermemory-init`, `/supermemory-login`, `/supermemory-logout`, `/supermemory-status` commands and a `supermemory.jsonc`.

## Status

✅ **Working** — authenticated, project container created, per-turn recall + capture every 3 turns and at end of session. Requires an OpenCode restart after login.

> ⚠️ **Note:** the console dashboard (`console.supermemory.ai/auth/connect`) sometimes hangs on the "Loading workspaces…" step. It's not a network/CLI problem — trying an incognito window or re-running `login` usually fixes it.
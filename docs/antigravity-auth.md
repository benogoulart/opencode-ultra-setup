# opencode-antigravity-auth

> **Original project:** https://github.com/NoeFabris/opencode-antigravity-auth

Google OAuth authentication so OpenCode uses **Antigravity** (Google's IDE) models — Claude Opus/Sonnet and Gemini 3 — with your Google credentials. No API key.

## Features

- Claude Opus 4.6 / Sonnet 4.6 and Gemini 3.1 Pro/Flash via Google OAuth
- Multi-account rotation when hitting rate limits
- Dual quota (Antigravity + Gemini CLI)

## Installation

```jsonc
"plugin": ["opencode-antigravity-auth@latest"]
```

Then run `opencode auth login` → Google → **OAuth with Google (Antigravity)** and follow the prompt to auto-configure the models in `opencode.json`.

## Status

✅ **Installed** (`@latest` on the plugin list). Still requires `opencode auth login` with a Google account before first use.

> ⚠️ **Caution:** using this plugin (or any Antigravity proxy) is against Google's Terms of Service, and some users have reported their Google account being banned or shadow-banned. Use at your own discretion.

> 🔧 **403 `Permission denied` on `cloudaicompanion`:** the plugin falls back to a default project. Fix: create/select a project in the [Google Cloud Console](https://console.cloud.google.com/), enable the **Gemini for Google Cloud API**, and add `projectId` to the accounts file.
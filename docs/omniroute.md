# OmniRoute

> **Original project:** https://github.com/diegosouzapw/OmniRoute
> **OpenCode plugin:** https://www.npmjs.com/package/@omniroute/opencode-provider

**Free** AI gateway (MIT). One endpoint → **352 providers** (150+ free tiers), ~**1.47B free tokens/month**. Auto-fallback between providers, compression (RTK+Caveman, 15–95%), quota-aware routing, MCP/A2A.

## Why use it alongside GOAT

- Access to top models **without depending on a paid key** (OpenCode Free, free tiers)
- **Automatic fallback**: if GOAT limits/crashes, OmniRoute redistributes to another provider
- Runs locally (`http://localhost:20128/v1`), zero-config

## Installation

```bash
npm install -g --allow-scripts=bun omniroute
```

> ⚠️ On Windows/npm, post-install scripts (bun, keytar, sharp, esbuild, etc.) may be blocked by `allow-scripts`. Configuration that worked:
>
> ```bash
> npm config set allow-scripts=omniroute,keytar,sharp,@swc/core,protobufjs,esbuild,onnxruntime-node,tls-client-node,@parcel/watcher,koffi --location=user
> ```

## OpenCode integration

The `@omniroute/opencode-provider` plugin generates the provider entry for `opencode.json` delegating execution to `@ai-sdk/openai-compatible`:

```jsonc
"provider": {
  "omniroute": {
    "npm": "@ai-sdk/openai-compatible",
    "name": "OmniRoute",
    "options": {
      "baseURL": "http://localhost:20128/v1",
      "apiKey": "sk_omniroute"
    }
  }
}
```

## Status

✅ **Installed** (v3.8.50) and **gateway up** (`localhost:20128`); OpenCode config integration pending (see [plan](plano.md)).
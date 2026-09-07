# OmniRoute

> **Projeto original:** https://github.com/diegosouzapw/OmniRoute
> **Plugin OpenCode:** https://www.npmjs.com/package/@omniroute/opencode-provider

AI gateway **gratuito** (MIT). Um endpoint → **352 providers** (150+ free tiers), ~**1.47B tokens/mês grátis**. Auto-fallback entre providers, compressão (RTK+Caveman, 15–95%), quota-aware routing, MCP/A2A.

## Por que usar junto com o GOAT

- Acesso a modelos top **sem depender de chave paga** (OpenCode Free, tiers gratuitos)
- **Fallback automático**: se o GOAT limitar/cair, o OmniRoute redistribui para outro provider
- Roda local (`http://localhost:20128/v1`), zero-config

## Instalação

```bash
npm install -g --allow-scripts=bun omniroute
```

> ⚠️ No Windows/npm, os scripts de pós-instalação (bun, keytar, sharp, esbuild, etc.) podem ficar bloqueados por `allow-scripts`. Configuração que resolveu:
>
> ```bash
> npm config set allow-scripts=omniroute,keytar,sharp,@swc/core,protobufjs,esbuild,onnxruntime-node,tls-client-node,@parcel/watcher,koffi --location=user
> ```

## Integração com OpenCode

O plugin `@omniroute/opencode-provider` gera a entrada de provider para `opencode.json` delegando a execução ao `@ai-sdk/openai-compatible`:

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

✅ **Instalado** (v3.8.50) — gateway em `localhost:20128` e integração no config pendentes (ver [plano](plano.md)).

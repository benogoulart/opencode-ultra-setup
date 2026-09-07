# Plano e pendências

## Referências de projetos investigados

| Projeto | Link | Decisão |
|---|---|---|
| Command Code GOAT | https://github.com/commandcode-ai/commandcode | 🎯 integrar como provider pago |
| OmniRoute | https://github.com/diegosouzapw/OmniRoute | ✅ instalado; integrar gateway |
| awesome-opencode | https://github.com/awesome-opencode/awesome-opencode | 📋 referência (não é plugin) |
| andrej-karpathy-skills | https://github.com/multica-ai/andrej-karpathy-skills | ✅ usado no AGENTS.md |
| opencode-agent-skills | https://github.com/joshuadavidthomas/opencode-agent-skills | ✅ plugin ativo |
| claude-mem (Grok Mem) | https://github.com/thedotmack/claude-mem | ⏸️ skip (redundante com supermemory) |
| claude-plugins-official | https://github.com/anthropics/claude-plugins-official | ⏸️ skip (para Claude Code) |
| anti-slop | https://github.com/peakoss/anti-slop | ✅ princípios no AGENTS.md |

## Pendências do setup

- [ ] **GOAT** — obter API key e integrar como provider
- [ ] **OmniRoute** — subir gateway (localhost:20128) + integrar provider no `opencode.jsonc`
- [ ] **supermemory** — rodar `bunx opencode-supermemory@latest login`
- [ ] **headroom** — verificar/relançar proxy (health `127.0.0.1:8787`)
- [ ] **wakatime** — configurar API key no `~/.wakatime.cfg`
- [ ] **validação final** — `doctor` + reiniciar OpenCode

## Integração do Command Code GOAT (planejada)

O GOAT é uma assinatura de API ($10/mês → $70 de créditos) com 48 modelos (GPT-5.6 Sol, GLM-5.2, Kimi K2.7 Code, DeepSeek V4 Flash, MiniMax M3). Entra como **provider custom** no OpenCode (endpoint OpenAI-compatível).

Configuração planejada em `opencode.jsonc`:

```jsonc
"provider": {
  "commandcode": {
    "npm": "@ai-sdk/openai-compatible",
    "name": "Command Code GOAT",
    "options": { "baseURL": "https://api.commandcode.ai/provider/v1" },
    "models": {
      "openai/gpt-5.6-sol":   { "name": "GPT-5.6 Sol ($70/mês)" },
      "glm/glm-5.2":         { "name": "GLM 5.2 ($70/mês)" },
      "kimi/kimi-k2-7-code":  { "name": "Kimi K2.7 Code ($60/mês)" },
      "deepseek/deepseek-v4-flash": { "name": "DeepSeek V4 Flash ($60/mês)" },
      "minimax/minimax-m3": { "name": "MiniMax M3 ($47/mês)" },
      "kimi/kimi-k3":        { "name": "Kimi K3 ($20/mês)" }
    }
  }
}
```

### Roteamento planejado dos agentes

| Agente | Modelo GOAT |
|---|---|
| Sisyphus (orquestrador) | `glm/glm-5.2` |
| Hephaestus (deep work) | `openai/gpt-5.6-sol` |
| Oracle (debug/arquitetura) | `openai/gpt-5.6-sol` |
| Explore / Librarian (utilidades) | `deepseek/deepseek-v4-flash` |
| Atlas / Metis (orquestração) | `glm/glm-5.2` |
| Momus (review) | `openai/gpt-5.6-sol` |

> Usei apenas modelos OpenAI/GPT-compatíveis; modelos Anthropic (claude-*) exigiriam outro endpoint (`/messages`).

### Como integrar (passos)

1. Gerar API key no Studio: https://commandcode.ai/studio/
2. Rodar `/connect` no OpenCode → Other → provider id `commandcode` (ou usar `options.apiKey`)
3. Adicionar provider + modelos no `opencode.jsonc`
4. Mapear cada agente do `~/.omo/omo.jsonc` para o modelo GOAT
5. Validar com `doctor`

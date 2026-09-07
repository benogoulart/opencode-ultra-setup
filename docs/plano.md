# Plan and pending items

## Investigated project references

| Project | Link | Decision |
|---|---|---|
| Command Code GOAT | [commandcode.ai](https://commandcode.ai) | 🎯 integrate as paid provider |
| OmniRoute | https://github.com/diegosouzapw/OmniRoute | ✅ installed; gateway up |
| awesome-opencode | https://github.com/awesome-opencode/awesome-opencode | 📋 reference (not a plugin) |
| andrej-karpathy-skills | https://github.com/multica-ai/andrej-karpathy-skills | ✅ used in AGENTS.md |
| anti-slop | https://github.com/peakoss/anti-slop | ✅ principles in AGENTS.md |
| opencode-agent-skills | https://github.com/joshuadavidthomas/opencode-agent-skills | ✅ active plugin |
| opencode-supermemory | https://github.com/supermemoryai/opencode-supermemory | ✅ active plugin |
| opencode-pty | https://github.com/shekohex/opencode-pty | ✅ active plugin |
| opencode-websearch-cited | https://github.com/ghoulr/opencode-websearch-cited | ✅ active plugin |
| opencode-wakatime | https://github.com/angristan/opencode-wakatime | ✅ active plugin |
| headroom | https://github.com/headroomlabs-ai/headroom | ⏳ installed, proxy being tuned |
| claude-mem (Grok Mem) | https://github.com/thedotmack/claude-mem | ⏸️ skipped (redundant with supermemory) |
| claude-plugins-official | https://github.com/anthropics/claude-plugins-official | ⏸️ skipped (for Claude Code) |

## Setup pending items

- [ ] **GOAT** — get an API key and integrate as a provider
- [ ] **OmniRoute** — gateway up; add provider to `opencode.jsonc`
- [ ] **supermemory** — finish login (browser)
- [ ] **headroom** — check/re-launch proxy (health `127.0.0.1:8787`)
- [ ] **wakatime** — configure API key in `~/.wakatime.cfg`
- [ ] **final validation** — `doctor` + restart OpenCode

## Command Code GOAT integration (planned)

GOAT is an API subscription ($10/month → $70 in credits) with 48 models (GPT-5.6 Sol, GLM-5.2, Kimi K2.7 Code, DeepSeek V4 Flash, MiniMax M3). It enters as a **custom provider** in OpenCode (OpenAI-compatible endpoint).

Planned configuration in `opencode.jsonc`:

```jsonc
"provider": {
  "commandcode": {
    "npm": "@ai-sdk/openai-compatible",
    "name": "Command Code GOAT",
    "options": { "baseURL": "https://api.commandcode.ai/provider/v1" },
    "models": {
      "openai/gpt-5.6-sol":   { "name": "GPT-5.6 Sol ($70/month)" },
      "glm/glm-5.2":         { "name": "GLM 5.2 ($70/month)" },
      "kimi/kimi-k2-7-code":  { "name": "Kimi K2.7 Code ($60/month)" },
      "deepseek/deepseek-v4-flash": { "name": "DeepSeek V4 Flash ($60/month)" },
      "minimax/minimax-m3": { "name": "MiniMax M3 ($47/month)" },
      "kimi/kimi-k3":        { "name": "Kimi K3 ($20/month)" }
    }
  }
}
```

### Planned agent routing

| Agent | GOAT model |
|---|---|
| Sisyphus (orchestrator) | `glm/glm-5.2` |
| Hephaestus (deep work) | `openai/gpt-5.6-sol` |
| Oracle (debug/architecture) | `openai/gpt-5.6-sol` |
| Explore / Librarian (utilities) | `deepseek/deepseek-v4-flash` |
| Atlas / Metis (orchestration) | `glm/glm-5.2` |
| Momus (review) | `openai/gpt-5.6-sol` |

> I only used OpenAI/GPT-compatible models; Anthropic models (claude-*) would require a different endpoint (`/messages`).

### How to integrate (steps)

1. Generate an API key in the Studio: https://commandcode.ai/studio/
2. Run `/connect` in OpenCode → Other → provider id `commandcode` (or use `options.apiKey`)
3. Add the provider + models to `opencode.jsonc`
4. Map each agent in `~/.omo/omo.jsonc` to a GOAT model
5. Validate with `doctor`
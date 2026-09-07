# OpenCode Ultra Setup

Documentação do meu setup do [OpenCode](https://opencode.ai) levado ao "ultra": um time de 11 agentes com team mode, memória persistente, compressão de contexto, terminal interativo, web search com citação, métricas, skills e diretrizes anti-slop.

> Status: **em progresso** — vários componentes instalados e rodando, outros ainda em ajuste (ver [Plano](docs/plano.md)).

## O que tem aqui

| Componente | Projeto original | O que faz | Status |
|---|---|---|---|
| [oh-my-openagent](docs/oh-my-openagent.md) | [code-yeongyu/oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) | 11 agentes (Sisyphus, Hephaestus, Oracle, Atlas, Metis, Momus, ...) com **Team Mode** e `ultrawork` | ✅ instalado |
| [opencode-agent-skills](docs/agent-skills.md) | [joshuadavidthomas/opencode-agent-skills](https://github.com/joshuadavidthomas/opencode-agent-skills) | skills reutilizáveis, carregadas sob demanda | ✅ instalado |
| [opencode-supermemory](docs/supermemory.md) | [supermemoryai/opencode-supermemory](https://github.com/supermemoryai/opencode-supermemory) | memória persistente entre sessões | ⏳ instalado, login em andamento |
| [headroom](docs/headroom.md) | [headroomlabs-ai/headroom](https://github.com/headroomlabs-ai/headroom) | comprime o contexto em até ~57% antes de mandar pro modelo | ⏳ instalado, proxy em ajuste |
| [opencode-pty](docs/pty.md) | [shekohex/opencode-pty](https://github.com/shekohex/opencode-pty) | terminal interativo (dev server em background real) | ✅ instalado |
| [opencode-websearch-cited](docs/websearch-cited.md) | [ghoulr/opencode-websearch-cited](https://github.com/ghoulr/opencode-websearch-cited) | busca web com citação e fonte | ✅ instalado |
| [opencode-wakatime](docs/wakatime.md) | [angristan/opencode-wakatime](https://github.com/angristan/opencode-wakatime) | métricas de quanto o agente codeja | ⏳ instalado, falta API key |
| [OmniRoute](docs/omniroute.md) | [diegosouzapw/OmniRoute](https://github.com/diegosouzapw/OmniRoute) | AI gateway gratuito (352 providers, auto-fallback, compressão) | ✅ installedo; gateway no ar |
| [AGENTS.md (Karpathy + anti-slop)](docs/agentes.md) | [multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills) · [peakoss/anti-slop](https://github.com/peakoss/anti-slop) | diretrizes globais pro agente não fazer overengineering | ✅ ativo |
| [Command Code GOAT](docs/plano.md) | [commandcode.ai](https://commandcode.ai) | provider de API (GPT-5.6 Sol, GLM 5.2, Kimi K2.7 Code, DeepSeek V4 Flash) | 🎯 planejado |
| [awesome-opencode](docs/awesome-opencode.md) | [awesome-opencode/awesome-opencode](https://github.com/awesome-opencode/awesome-opencode) | referência de projetos/recursos para OpenCode (não é plugin) | 📋 referência |

## Projetos avaliados e não usados

| Projeto | Motivo |
|---|---|
| [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) | Redundante com o supermemory |
| [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) | Plugins para Claude Code, não OpenCode |

## Começando

1. Instale o OpenCode
2. Siga os passos de cada componente nos docs acima
3. Referencie o `AGENTS.md` global com as diretrizes de qualidade

## Arquivos de config

Os arquivos que compõem o setup ficam em `config/` (sanitizados, sem keys):
- `config/opencode.jsonc` — plugins, providers, permissões
- `config/omo.jsonc` — agentes/teams do oh-my-openagent
- `config/supermemory.jsonc` — memória persistente
- `config/start-headroom.ps1` — launcher do proxy headroom
- `config/AGENTS.md` — diretrizes globais

> ⚠️ **Segurança:** não commitei API keys, tokens ou configurações locais com secrets. Adicione apenas os arquivos de exemplo.
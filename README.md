# OpenCode Ultra Setup

Documentação do meu setup do [OpenCode](https://opencode.ai) levado ao "ultra": um time de 11 agentes com team mode, memória persistente, compressão de contexto, terminal interativo, web search com citação, métricas e diretrizes anti-slop.

> Status: **em progresso** — vários componentes instalados e rodando, outros ainda em ajuste (ver [Plano](docs/plano.md)).

## O que tem aqui

| Componente | O que faz | Status |
|---|---|---|
| [oh-my-openagent](docs/oh-my-openagent.md) | 11 agentes (Sisyphus, Hephaestus, Oracle, Atlas, Metis, Momus, ...) com **Team Mode** e `ultrawork` | ✅ instalado |
| [opencode-supermemory](docs/supermemory.md) | memória persistente entre sessões | ⏳ instalado, falta login |
| [headroom](docs/headroom.md) | comprime o contexto em até ~57% antes de mandar pro modelo | ⏳ instalado, proxy em ajuste |
| [opencode-pty](docs/pty.md) | terminal interativo (dev server em background real) | ✅ instalado |
| [opencode-websearch-cited](docs/websearch-cited.md) | busca web com citação e fonte | ✅ instalado |
| [opencode-wakatime](docs/wakatime.md) | métricas de quanto o agente codeja | ⏳ instalado, falta API key |
| [AGENTS.md (Karpathy + anti-slop)](docs/agentes.md) | diretrizes globais pro agente não fazer overengineering | ✅ ativo |
| [Command Code GOAT](docs/goat.md) | provider de API (GPT-5.6 Sol, GLM 5.2, Kimi K2.7 Code, DeepSeek V4 Flash) | 🎯 planejado |

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

# oh-my-openagent

> **Original project:** https://github.com/code-yeongyu/oh-my-openagent

A team of **11 agents** with **Team Mode** (parallel execution, `ultrawork`) and **hashline edits** (hash-verified edits), persistent **goal**, and **auto-resume**.

## Installation

```bash
npm install -g --allow-scripts=bun bun
bunx oh-my-openagent install --no-tui --platform=opencode --claude=no --openai=no --gemini=yes --copilot=yes --skip-auth
```

The plugin is registered in `opencode.jsonc` and the agents config lives in `~/.omo/omo.jsonc`.

## Agents

| Agent | Role |
|---|---|
| **Sisyphus** | orchestrates the team, breaks tasks down, distributes |
| **Hephaestus** | deep work / heavy lifting |
| **Oracle** | debugging and architecture |
| **Atlas / Metis** | orchestration and coordination |
| **Momus** | code review |
| **Prometheus** | testing and iteration |
| **Explore** | scans the code |
| **Librarian** | docs and utilities |
| **Multimodal** | multimodal inputs |

## Commands

- `ultrawork` / `ulw` — activates all agents for complex tasks
- `/goal <objective>` — sets a persistent objective
- `/handoff` — generates a context summary between sessions

## Key feature

Each agent can be pointed at a **different model**, allowing you to route heavy work to the expensive model and repetitive tasks to the cheap one. See [Command Code GOAT](plano.md) for the planned routing.
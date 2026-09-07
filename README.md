<div align="center">

# OpenCode Ultra Setup

**My [OpenCode](https://opencode.ai) setup taken to the "ultra" — documented and reproducible.** A team of 11 agents with team mode, persistent memory, context compression, a real interactive terminal, web search with citations, metrics, skills, and anti-slop guidelines.

<img src="https://img.shields.io/badge/OpenCode-agent-000000?style=flat&logo=opencode&logoColor=white" alt="OpenCode">
<img src="https://img.shields.io/badge/agents-11-8A2BE2?style=flat" alt="11 agents">
<img src="https://img.shields.io/badge/MCP-2-32CD32?style=flat" alt="MCP servers">
<img src="https://img.shields.io/badge/plugins-7-1E90FF?style=flat" alt="plugins">
<img src="https://img.shields.io/badge/AGENTS.md-Karpathy%2Banti--slop-FF4500?style=flat" alt="AGENTS.md">
<img src="https://img.shields.io/badge/status-in_progress-F0AD4E?style=flat" alt="status">

<p align="center">
  <a href="#preview">Preview</a> ·
  <a href="#use-cases">Use Cases</a> ·
  <a href="#architecture">Architecture</a> ·
  <a href="#components">Components</a> ·
  <a href="#getting-started">Getting Started</a> ·
  <a href="#security">Security</a> ·
  <a href="#troubleshooting">Troubleshooting</a> ·
  <a href="#plan">Plan</a>
</p>

</div>

---

Documentation of a working [OpenCode](https://opencode.ai) setup taken to the "ultra": instead of re-explaining the project to every session, the agent remembers context (supermemory), compresses what doesn't matter (headroom), delegates work to a team of specialized agents (oh-my-openagent), and queries your codebase (Cortex) and GitHub (MCP) on demand.

> **Status: in progress** — several components installed and running, others still being tuned (see [Plan](docs/plano.md)).

## Preview

```
❯ opencode

  ██ OpenCode Ultra Setup
  agents       11 (team mode) · ultrawork
  memory       supermemory (persistent across sessions)
  context      headroom (compression ~20–57%)
  mcp          cortex · github
  providers    omniroute (gateway) · goat (planned)

  /goal "refactor the billing module"
  → 11 agents in parallel (Sisyphus orchestrates, Momus reviews, ...)
  → context rebuilt every session, no need to re-explain the project
```

## Use Cases

What this setup allows you to do with OpenCode:

- **Team work** — `ultrawork`/`ulw` fires 11 agents in parallel with team mode, each pointed at the right model (expensive for deep work, cheap for utilities).
- **Persistent memory** — the agent remembers project decisions and conventions across sessions (supermemory).
- **Lean context** — the headroom proxy compresses context up to ~57% before sending it to the model, without losing critical lines.
- **Real terminal** — dev servers and REPLs run in real background with `opencode-pty`.
- **Sourced search** — web search with inline citations and source URLs.
- **Free top models** — Google OAuth (Antigravity) gives Claude Opus/Sonnet and Gemini 3 with no API key (opencode-antigravity-auth).
- **Dev intelligence** — Cortex indexes the codebase: semantic search, dependency graph, project memory, planner, and code review via CLI + MCP.
- **GitHub automation** — issues, PRs, code, Actions, and CI straight from the agent via the GitHub MCP.
- **Honest quality** — Karpathy + anti-slop guidelines in the global `AGENTS.md` to avoid overengineering and slop.
- **Metrics** — wakatime measures how much the agent codes (lines, hours, model used).

## Architecture

```mermaid
graph TD
    Oc["OpenCode (agent core)"] --> Plugins
    Oc --> Mcp
    Oc --> Providers

    GS["Global AGENTS.md — Karpathy + anti-slop"] -.->|guidelines| Oc
    Hd["headroom — compression proxy"] -.->|minimizes tokens| Oc

    subgraph Plugins["Plugins"]
        OMO["oh-my-openagent — 11 agents · team mode"]
        SM["supermemory — persistent memory"]
        PTY["opencode-pty — interactive terminal"]
        SK["opencode-agent-skills — on-demand skills"]
        WS["websearch-cited — cited search"]
        WK["wakatime — metrics"]
        AA["opencode-antigravity-auth — Google OAuth models"]
    end

    subgraph Mcp["MCP servers"]
        CX["cortex — dev intelligence"]
        GH["github-mcp — issues/PRs/actions"]
    end

    subgraph Providers["Model providers"]
        GOAT["Command Code GOAT (paid)"]
        OR["OmniRoute — free gateway (352 providers)"]
    end

    OMO -->|routes work| Providers
```

## Components

| Component | Original project | What it does | Status |
|---|---|---|---|
| [oh-my-openagent](docs/oh-my-openagent.md) | [code-yeongyu/oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) | 11 agents (Sisyphus, Hephaestus, Oracle, Atlas, Metis, Momus, ...) with **Team Mode** and `ultrawork` | ✅ installed |
| [opencode-agent-skills](docs/agent-skills.md) | [joshuadavidthomas/opencode-agent-skills](https://github.com/joshuadavidthomas/opencode-agent-skills) | reusable skills loaded on demand | ✅ installed |
| [opencode-antigravity-auth](docs/antigravity-auth.md) | [NoeFabris/opencode-antigravity-auth](https://github.com/NoeFabris/opencode-antigravity-auth) | Google OAuth for free Antigravity models (Claude Opus/Sonnet, Gemini 3) | ✅ installed |
| [opencode-supermemory](docs/supermemory.md) | [supermemoryai/opencode-supermemory](https://github.com/supermemoryai/opencode-supermemory) | persistent memory across sessions | ✅ authenticated |
| [headroom](docs/headroom.md) | [headroomlabs-ai/headroom](https://github.com/headroomlabs-ai/headroom) | compresses context up to ~57% before sending it to the model | ✅ proxy up (routing optional) |
| [opencode-pty](docs/pty.md) | [shekohex/opencode-pty](https://github.com/shekohex/opencode-pty) | interactive terminal (real background dev server) | ✅ installed |
| [opencode-websearch-cited](docs/websearch-cited.md) | [ghoulr/opencode-websearch-cited](https://github.com/ghoulr/opencode-websearch-cited) | web search with citation and source | ✅ installed |
| [opencode-wakatime](docs/wakatime.md) | [angristan/opencode-wakatime](https://github.com/angristan/opencode-wakatime) | metrics of how much the agent codes | ✅ installed + API key |
| [OmniRoute](docs/omniroute.md) | [diegosouzapw/OmniRoute](https://github.com/diegosouzapw/OmniRoute) | free AI gateway (352 providers, auto-fallback, compression) | ✅ gateway + provider |
| [AGENTS.md (Karpathy + anti-slop)](docs/agentes.md) | [multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills) · [peakoss/anti-slop](https://github.com/peakoss/anti-slop) | global guidelines so the agent avoids overengineering | ✅ active |
| [Command Code GOAT](docs/plano.md) | [commandcode.ai](https://commandcode.ai) | API provider (GPT-5.6 Sol, GLM 5.2, Kimi K2.7 Code, DeepSeek V4 Flash) | 🎯 planned |
| [Cortex](docs/cortex.md) | [benogoulart/Cortex](https://github.com/benogoulart/Cortex) | developer intelligence — indexes the codebase, dependency graph, semantic search, project memory, code review, and planner via CLI + MCP | ✅ installed |
| [GitHub MCP](docs/github-mcp.md) | [github/github-mcp-server](https://github.com/github/github-mcp-server) | local MCP for issues/PRs, code, Actions, and GitHub automation | ✅ installed |
| [awesome-opencode](docs/awesome-opencode.md) | [awesome-opencode/awesome-opencode](https://github.com/awesome-opencode/awesome-opencode) | reference of projects/resources for OpenCode (not a plugin) | 📋 reference |

## Getting Started

The repo is a working reference. To reproduce the setup: install the runtime deps, copy the sanitized example configs, authenticate, and start `opencode`.

1. **Install [OpenCode](https://opencode.ai).**
2. **Install the runtime deps** each component needs:

   | Tool | Why | Install |
   |---|---|---|
   | OmniRoute | free gateway (provider `auto`, 352 providers) | `npm install -g --allow-scripts=bun omniroute` |
   | GitHub MCP | issues/PRs/Actions/CI | `npm install -g @modelcontextprotocol/server-github` |
   | headroom | context-compression proxy | `pip install "headroom-ai[all]"` |
   | supermemory | persistent memory | `bunx opencode-supermemory@latest install --no-tui` |
   | Cortex | dev intelligence (CLI + MCP) | see [cortex.md](docs/cortex.md) |
   | oh-my-openagent | 11 agents / team mode | see [oh-my-openagent.md](docs/oh-my-openagent.md) |

3. **Copy the example configs** from `config/` into `~/.config/opencode/` (Windows: `%USERPROFILE%\.config\opencode\`) — see [Config files](#config-files). Then customize:
   - `omo.jsonc` → replace the placeholder models with ones your providers expose (`auto` via OmniRoute, Antigravity `google/...`, GitHub Copilot, or GOAT).
   - `opencode.jsonc` → set your GitHub PAT via the `GITHUB_PERSONAL_ACCESS_TOKEN` env var (never hardcode it).
4. **Authenticate**:
   - supermemory: `bunx opencode-supermemory@latest login`
   - antigravity-auth (Claude/Gemini without an API key): `opencode auth login` → Google
5. **(Optional) Start the headroom proxy**: `powershell -File config/start-headroom.ps1` (port 8787).
6. **Validate**: launch `opencode`, then `bunx opencode-supermemory@latest status` and `headroom doctor`.

## Config files

Sanitized examples (no keys) that make the setup reproducible. Not versioned: the local files with real credentials stay out of the repo (see [Security](#security)).

| File | Copies to | Contents |
|---|---|---|
| `config/opencode.example.jsonc` | `~/.config/opencode/opencode.json` | plugins, providers, permissions, MCPs |
| `config/omo.example.jsonc` | `~/.omo/omo.jsonc` | oh-my-openagent agents/team |
| `config/supermemory.example.jsonc` | `~/.config/opencode/supermemory.jsonc` | persistent-memory settings |
| `config/AGENTS.example.md` | `~/.config/opencode/AGENTS.md` | Karpathy + anti-slop global guidelines |
| `config/start-headroom.ps1` | run as-is | headroom proxy launcher (port 8787) |

## Security

Best practices to avoid leaking credentials (mirrored from the [GitHub MCP Server](https://github.com/github/github-mcp-server)):

- **Never commit secrets.** API keys, tokens, and local configs with secrets stay out of the repo (`.gitignore` with `config/*.local.jsonc`, `**/.env`, `**/.wakatime.cfg`). Add only the example files.
- **Least privilege.** Use tokens with only the scopes you need (e.g., GitHub PAT with `repo` — don't use an account-wide token).
- **Rotation.** Rotate tokens periodically and use one token per environment/project.
- **Prefer environment variables** over hardcoded tokens in the config whenever the host supports it (e.g., OpenCode uses `environment` in MCP).
- **Watch out for auth flows.** The supermemory dashboard sometimes hangs on "Loading workspaces…" (see [Troubleshooting](#troubleshooting)).

## Troubleshooting

Known issues and the workaround that worked — details in each doc:

- **Windows:** `pnpm link --global` may create broken shims. Fix: create `cortex.cmd` and `cortex-mcp.cmd` manually pointing to `dist` (see [cortex.md](docs/cortex.md)).
- **Windows/npm:** blocked post-install scripts with broken `allow-scripts` (OmniRoute). Fix: `npm config set allow-scripts=...` (see [omniroute.md](docs/omniroute.md)).
- **supermemory:** the console dashboard sometimes hangs on "Loading workspaces…". Fix: incognito window or re-run `login` (see [supermemory.md](docs/supermemory.md)).
- **headroom:** proxy timeouts on health `http://127.0.0.1:8787/health` (see [headroom.md](docs/headroom.md)).
- **antigravity-auth:** 403 `Permission denied` on `cloudaicompanion` — create/select a GCP project and enable the Gemini for Google Cloud API (see [antigravity-auth.md](docs/antigravity-auth.md)).

## Plan

Next steps, pending items, and planned model routing → [docs/plano.md](docs/plano.md).

## Evaluated projects not used

| Project | Reason |
|---|---|
| [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) | Redundant with supermemory |
| [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) | Plugins for Claude Code, not OpenCode |
# Cortex

> **Original project:** https://github.com/benogoulart/Cortex

**"Developer intelligence"** for your codebase: it scans, indexes, and understands the project — files, symbols, dependencies, and architecture — and exposes everything via **CLI + MCP** for coding agents like OpenCode. Instead of re-explaining the project to every session, `cortex init` once and the context is always there.

## What it does

- **Indexing** of the codebase (tree-sitter AST) → `.cortex/index.json`
- **Symbol extraction** (classes, functions, types, enums — exported and private)
- **Dependency graph** with cycle detection and impact scoring
- **Architecture analysis** (layers, entry points, composition)
- **Semantic search** with multi-factor scoring (path, symbol, import, relevance)
- **Context engine** — pulls relevant files/symbols/dependency chains for a topic
- **Project memory** — persistent decisions, conventions, patterns, and mistakes
- **Task planner** with risk assessment
- **Code review** of the git diff (architecture, security, tests)
- **Specialized agents** (architect, reviewer, security, tester)
- **Unified report** with a health score

## Installation

```bash
# Clone and link globally
git clone https://github.com/benogoulart/Cortex.git
cd Cortex
pnpm install
pnpm build
pnpm link --global
```

> ⚠️ **Windows/pnpm:** `pnpm link --global` may fail to create the shims. Fix that worked: create `cortex.cmd` and `cortex-mcp.cmd` manually in `%APPDATA%\npm` pointing straight at `dist`:
> ```
> @echo off
> node "C:\Users\Windows\Cortex\packages\cli\dist\index.js" %*
> ```
> (plus the equivalent for `cortex-mcp` pointing at `packages\mcp\dist\index.js`). Remove the broken shims from `%LOCALAPPDATA%\pnpm\cortex*` so they don't conflict in `PATH`.

## Usage in a project

```bash
cd my-project
cortex init               # scan and create .cortex/index.json
cortex analyze            # project insights
cortex search "auth"      # find relevant code
cortex context "payment"  # full context for a topic
cortex report             # unified analysis with score
cortex remember "use repository pattern"  # save a convention
cortex memory search "pattern"            # recall knowledge
cortex plan "add payment system"          # generate an execution plan
```

## Main commands

| Command | Description |
|---|---|
| `cortex init` | Scans the codebase and creates the index at `.cortex/index.json` |
| `cortex analyze` | Stats, architecture, dependency health, and top symbols |
| `cortex status` | Index metadata (version, last analysis, file count) |
| `cortex search <query>` | Search files/symbols by semantic relevance score |
| `cortex context <topic>` | Files, symbols, dependency chains, and impact for a topic |
| `cortex remember <text>` | Save a decision, convention, pattern, or mistake to project memory |
| `cortex memory` | List/`search`/`show`/`delete` memory entries |
| `cortex plan <description>` | Generate a structured execution plan with risk assessment |
| `cortex review` | Review the git diff (architecture, security, tests) |
| `cortex agent <name>` | Run a specialized agent: `architect`, `reviewer`, `security`, `tester`, `all` |
| `cortex report` | Run all agents and produce a unified report with score |
| `cortex history` | List saved report snapshots and plans |
| `cortex setup` | Configure the MCP for OpenCode, Claude Code, or Codex |

Useful flags: `-r/--root` (project root), `-n/--limit` (search results), `-c/--category` (memory category), `-j/--json`, `--save`.

## OpenCode integration (MCP)

Cortex exposes **21 MCP tools over stdio**. Config in `opencode.jsonc`:

```jsonc
"mcp": {
  "cortex": {
    "type": "local",
    "command": ["cortex-mcp"],
    "args": [],
    "enabled": true
  }
}
```

There's also an automatic command: `cortex setup --agent opencode` (or `all`) that writes the entry into the config for you.

### Available MCP tools

Cortex exposes **21 tools** over MCP, grouped by function:

| Tool | Description |
|---|---|
| **Indexing** | |
| `cortex_init` | Index the project |
| `cortex_status` | Index stats |
| `cortex_analyze` | Dependency analysis (cycles, impact, critical path) |
| **Search & context** | |
| `cortex_search` | Semantic search |
| `cortex_context` | Context with dependency chains |
| `cortex_dependencies` | Dependencies of a specific file |
| **Memory** | |
| `cortex_remember` | Save memory |
| `cortex_memory_search` | Search memory |
| `cortex_memory_list` | List memories |
| `cortex_memory_get` | Show an entry |
| `cortex_memory_delete` | Delete an entry |
| **Planning & review** | |
| `cortex_plan` | Generate an execution plan |
| `cortex_review` | Review the git diff |
| **Agents & report** | |
| `cortex_agent_architect` | Architecture analysis |
| `cortex_agent_reviewer` | Graph-aware review |
| `cortex_agent_security` | Security analysis |
| `cortex_agent_tester` | Test strategy |
| `cortex_agent_all` | Run all agents |
| `cortex_report` | Unified report |
| `cortex_history` | Report/plan history |
| `cortex_config_get` | Read the current configuration |

## Configuration

Cortex persists per-project settings in `.cortex/config.json`: include/ignore patterns, layer definitions, custom security patterns, search weights, and review rules. Without the file, it uses sensible defaults (e.g., ignores `node_modules/**`, `dist/**`; search weights `path 3`, `symbol 5`, `import 2`, `export 1`, `structural 2`).

## Status

✅ **Installed** (v1.0.0) — `cortex` and `cortex-mcp` CLIs working; MCP added to `opencode.jsonc`. Requires an OpenCode restart to load the MCP.
# GitHub MCP

> **Original project:** https://github.com/github/github-mcp-server
> **npm package in use:** [`@modelcontextprotocol/server-github`](https://www.npmjs.com/package/@modelcontextprotocol/server-github)

An MCP server that connects the coding agent directly to the GitHub platform: read repositories and code, manage issues/PRs, analyze commits, automate workflows, and query Actions/CI.

## Use cases

- **Repositories** — browse and query code, search files, analyze commits, and understand project structure.
- **Issues & PRs** — create, update, and manage issues and pull requests; review code changes.
- **CI/CD** — monitor GitHub Actions workflow runs, analyze build failures, and manage releases.
- **Code analysis** — query security findings, Dependabot alerts, and code patterns.
- **Collaboration** — access discussions, notifications, and team activity.

## Local install (npm — what's in use)

```bash
npm install -g @modelcontextprotocol/server-github
```

This package generates the `mcp-server-github` binary (`.cmd`/`.ps1` on Windows in `%APPDATA%\npm`).

## OpenCode configuration

In `opencode.jsonc`, under the `mcp` key (in OpenCode the env key is `environment`, not `env`):

```jsonc
"mcp": {
  "github": {
    "type": "local",
    "command": ["mcp-server-github.cmd"],
    "args": [],
    "enabled": true,
    "environment": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "<your PAT>"
    }
  }
}
```

The PAT is created in **Settings → Developer settings → Personal access tokens**. Typical minimum scopes: `repo` (repository operations). **Never commit the token** (the repo sanitizes configs in `config/`).

## Official alternative (`github/github-mcp-server`)

The npm package is the old community server. The **official** alternative (Go/Docker) delivers more toolsets and can be used **remotely** (hosted by GitHub at `https://api.githubcopilot.com/mcp/`) or **locally** via Docker:

```jsonc
// Remote (recommended when using a token)
"mcp": {
  "github": {
    "type": "remote",
    "url": "https://api.githubcopilot.com/mcp/",
    "enabled": true,
    "oauth": false,
    "headers": {
      "Authorization": "Bearer {env:GITHUB_PERSONAL_ACCESS_TOKEN}"
    }
  }
}
```

```jsonc
// Local via Docker
"mcp": {
  "github": {
    "type": "local",
    "command": ["docker", "run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN", "ghcr.io/github/github-mcp-server"],
    "enabled": true,
    "environment": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "<your PAT>"
    }
  }
}
```

### Toolsets

The official server groups tools into toolsets. The default is `context, repos, issues, pull_requests, users`. Others: `actions`, `code_security`, `dependabot`, `discussions`, `gists`, `git`, `labels`, `notifications`, `orgs`, `projects`, `releases`, `secret_protection`, `stargazers`. Filter with the `GITHUB_TOOLSETS` env var or the `--toolsets` flag to avoid blowing up context.

| Toolset | Description |
|---|---|
| `context` *(default)* | Current user and GitHub context (e.g., `get_me`, `get_teams`) |
| `repos` *(default)* | Repos, files, commits, branches, releases, search |
| `issues` *(default)* | Issues, comments, sub-issues, search |
| `pull_requests` *(default)* | PRs, reviews, review comments, merge, diff |
| `users` *(default)* | User search, stargazers |
| `actions` | GitHub Actions workflows and runs |
| `code_security` | Code scanning alerts |
| `dependabot` | Dependabot alerts |
| `discussions`, `gists`, `git`, `labels`, `notifications`, `orgs`, `projects`, `secret_protection`, `stargazers` | Other GitHub areas |

> Tip: on the official server, `--read-only` exposes only read tools; `--lockdown-mode` filters public-repo content by authors without push access (reduces prompt-injection risk).

## PAT security

Best practices when using a personal access token (PAT):

- **Least privilege** — only what the tool needs (e.g., `repo` for repository operations; `read:org`, `read:packages` as used).
- **Separate tokens** — one PAT per project/environment for easier rotation.
- **Never commit** — keep out of version control (the repo sanitizes in `config/`).
- **Prefer env vars** — in OpenCode use `environment` in the MCP instead of hardcoding into the config when possible.

## Status

✅ **Installed** locally via npm (`@modelcontextprotocol/server-github`); configured in `opencode.jsonc` with a PAT. Requires an OpenCode restart to load the MCP.
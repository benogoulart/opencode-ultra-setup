# MCP GitHub

> **Projeto original:** https://github.com/github/github-mcp-server
> **Pacote npm em uso:** [`@modelcontextprotocol/server-github`](https://www.npmjs.com/package/@modelcontextprotocol/server-github)

MCP server que conecta o agente de código direto à plataforma GitHub: ler repositórios e código, gerenciar issues/PRs, analisar commits, automatizar workflows e consultar Actions/CI.

## Instalação local (npm — o que está em uso)

```bash
npm install -g @modelcontextprotocol/server-github
```

Esse pacote gera o binário `mcp-server-github` (`.cmd`/`.ps1` no Windows em `%APPDATA%\npm`).

## Configuração no OpenCode

No `opencode.jsonc`, sob a chave `mcp` (em OpenCode a chave de env é `environment`, não `env`):

```jsonc
"mcp": {
  "github": {
    "type": "local",
    "command": ["mcp-server-github.cmd"],
    "args": [],
    "enabled": true,
    "environment": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "<seu PAT>"
    }
  }
}
```

O PAT é criado em **Settings → Developer settings → Personal access tokens**. Escopos mínimos típicos: `repo` (operações de repositório). **Nunca commite o token** (o repo sanitiza configs em `config/`).

## Alternativa oficial (`github/github-mcp-server`)

O pacote npm é o servidor comunitário antigo. A alternativa **oficial** (Go/Docker) entrega mais toolsets e pode ser usada **remotamente** (hospedado pelo GitHub em `https://api.githubcopilot.com/mcp/`) ou **localmente** via Docker:

```jsonc
// Remote (recomendado quando se usa token)
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
      "GITHUB_PERSONAL_ACCESS_TOKEN": "<seu PAT>"
    }
  }
}
```

### Toolsets

O servidor oficial agrupa tools em toolsets. O default é `context, repos, issues, pull_requests, users`. Outros: `actions`, `code_security`, `dependabot`, `discussions`, `gists`, `git`, `labels`, `notifications`, `orgs`, `projects`, `releases`, `secret_protection`, `stargazers`. Filtre por env `GITHUB_TOOLSETS` ou flag `--toolsets` para não estourar o contexto.

## Status

✅ **Instalado** localmente via npm (`@modelcontextprotocol/server-github`); configurado no `opencode.jsonc` com PAT. Requer restart do OpenCode para carregar o MCP.
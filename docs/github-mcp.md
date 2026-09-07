# MCP GitHub

> **Projeto original:** https://github.com/github/github-mcp-server
> **Pacote npm em uso:** [`@modelcontextprotocol/server-github`](https://www.npmjs.com/package/@modelcontextprotocol/server-github)

MCP server que conecta o agente de código direto à plataforma GitHub: ler repositórios e código, gerenciar issues/PRs, analisar commits, automatizar workflows e consultar Actions/CI.

## Use cases

- **Repositórios** — navegar e consultar código, buscar arquivos, analisar commits e entender a estrutura do projeto.
- **Issues & PRs** — criar, atualizar e gerenciar issues e pull requests; revisar mudanças de código.
- **CI/CD** — monitorar workflow runs do GitHub Actions, analisar falhas de build e gerenciar releases.
- **Análise de código** — consultar security findings, Dependabot alerts e padrões de código.
- **Colaboração** — acessar discussions, notificações e atividade do time.

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

| Toolset | Descrição |
|---|---|
| `context` *(default)* | Contexto do usuário e do GitHub atual (ex.: `get_me`, `get_teams`) |
| `repos` *(default)* | Repositórios, arquivos, commits, branches, releases, busca |
| `issues` *(default)* | Issues, comentários, sub-issues, busca |
| `pull_requests` *(default)* | PRs, reviews, review comments, merge, diff |
| `users` *(default)* | Busca de usuários, stargazers |
| `actions` | Workflows e runs do GitHub Actions |
| `code_security` | Code scanning alerts |
| `dependabot` | Dependabot alerts |
| `discussions`, `gists`, `git`, `labels`, `notifications`, `orgs`, `projects`, `secret_protection`, `stargazers` | Demais áreas do GitHub |

> Dica: no servidor oficial, `--read-only` expõe apenas tools de leitura; `--lockdown-mode` filtra conteúdo de repositórios públicos por autores sem push access (reduz risco de prompt injection).

## Segurança do PAT

Boas práticas ao usar token pessoal (PAT):

- **Escopos mínimos** — só o que a ferramenta precisa (ex.: `repo` para operações de repositório; `read:org`, `read:packages` conforme o uso).
- **Tokens separados** — um PAT por projeto/ambiente, facilitando rotação.
- **Nunca commitar** — mantenha fora do versionamento (o repo sanitiza em `config/`).
- **Preferir env vars** — no OpenCode, use `environment` no MCP em vez de hardcoded no config quando possível.

## Status

✅ **Instalado** localmente via npm (`@modelcontextprotocol/server-github`); configurado no `opencode.jsonc` com PAT. Requer restart do OpenCode para carregar o MCP.
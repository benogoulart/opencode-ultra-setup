# Cortex

> **Projeto original:** https://github.com/benogoulart/Cortex

**"Developer intelligence"** para o codebase: escaneia, indexa e entende o projeto — arquivos, símbolos, dependências e arquitetura — e expõe tudo via **CLI + MCP** para agentes de código como o OpenCode. Em vez de reexplicar o projeto a cada sessão, `cortex init` uma vez e o contexto fica sempre disponível.

## O que faz

- **Indexação** do codebase (tree-sitter AST) → `.cortex/index.json`
- **Extração de símbolos** (classes, funções, tipos, enums — exportados e privados)
- **Grafo de dependências** com detecção de ciclos e scoring de impacto
- **Análise de arquitetura** (camadas, entry points, composição)
- **Busca semântica** com scoring multi-fator (path, símbolo, import, relevância)
- **Context engine** — pega arquivos/símbolos/cadeias de dependência relevantes para um tópico
- **Memória de projeto** — decisões, convenções, padrões e erros persistentes
- **Planejador de tarefas** com avaliação de risco
- **Code review** do git diff (arquitetura, segurança, testes)
- **Agentes especializados** (architect, reviewer, security, tester)
- **Relatório unificado** com score de saúde

## Instalação

```bash
# Clone e link global
git clone https://github.com/benogoulart/Cortex.git
cd Cortex
pnpm install
pnpm build
pnpm link --global
```

> ⚠️ **Windows/pnpm:** o `pnpm link --global` pode falhar ao criar os shims. Solução que resolveu: criar manualmente `cortex.cmd` e `cortex-mcp.cmd` em `%APPDATA%\npm` apontando direto para o `dist`:
> ```
> @echo off
> node "C:\Users\Windows\Cortex\packages\cli\dist\index.js" %*
> ```
> (e o equivalente para `cortex-mcp` apontando para `packages\mcp\dist\index.js`). Remova os shims quebrados de `%LOCALAPPDATA%\pnpm\cortex*` para não conflitarem no `PATH`.

## Uso no projeto

```bash
cd my-project
cortex init               # scan e cria .cortex/index.json
cortex analyze            # insights do projeto
cortex search "auth"      # acha código relevante
cortex context "payment"  # contexto completo de um tópico
cortex report             # análise unificada com score
cortex remember "use repository pattern"  # salva convenção
cortex memory search "pattern"            # recupera conhecimento
cortex plan "add payment system"          # gera plano de execução
```

## Principais comandos

| Comando | Descrição |
|---|---|
| `cortex init` | Escaneia o codebase e cria o índice em `.cortex/index.json` |
| `cortex analyze` | Stats, arquitetura, saúde de dependências e símbolos top |
| `cortex status` | Metadados do índice (versão, última análise, contagem de arquivos) |
| `cortex search <query>` | Busca arquivos/símbolos por score semântico |
| `cortex context <topic>` | Arquivos, símbolos, cadeias de dependência e impacto para um tópico |
| `cortex remember <text>` | Salva decisão, convenção, padrão ou erro na memória do projeto |
| `cortex memory` | Lista/`search`/`show`/`delete` entradas de memória |
| `cortex plan <description>` | Gera plano de execução estruturado com avaliação de risco |
| `cortex review` | Revisa git diff (arquitetura, segurança, testes) |
| `cortex agent <name>` | Roda agente especializado: `architect`, `reviewer`, `security`, `tester`, `all` |
| `cortex report` | Roda todos os agentes e gera relatório unificado com score |
| `cortex history` | Lista snapshots de relatórios e planos salvos |
| `cortex setup` | Configura o MCP para OpenCode, Claude Code ou Codex |

Flags úteis: `-r/--root` (raiz do projeto), `-n/--limit` (resultados de busca), `-c/--category` (categoria de memória), `-j/--json`, `--save`.

## Integração com OpenCode (MCP)

Cortex expõe **21 tools via MCP (stdio)**. Config no `opencode.jsonc`:

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

Também há um comando automático: `cortex setup --agent opencode` (ou `all`) que grava a entrada no config por você.

### Tools MCP disponíveis

Cortex expõe **21 tools** no MCP. Agrupadas por função:

| Tool | Descrição |
|---|---|
| **Indexação** | |
| `cortex_init` | Indexa o projeto |
| `cortex_status` | Stats do índice |
| `cortex_analyze` | Análise de dependências (ciclos, impacto, critical path) |
| **Busca e contexto** | |
| `cortex_search` | Busca semântica |
| `cortex_context` | Contexto com cadeias de dependência |
| `cortex_dependencies` | Dependências de um arquivo específico |
| **Memória** | |
| `cortex_remember` | Salva memória |
| `cortex_memory_search` | Busca memória |
| `cortex_memory_list` | Lista memórias |
| `cortex_memory_get` | Mostra uma entrada |
| `cortex_memory_delete` | Deleta uma entrada |
| **Planejamento e review** | |
| `cortex_plan` | Gera plano de execução |
| `cortex_review` | Revisa git diff |
| **Agentes e relatório** | |
| `cortex_agent_architect` | Análise de arquitetura |
| `cortex_agent_reviewer` | Review graph-aware |
| `cortex_agent_security` | Análise de segurança |
| `cortex_agent_tester` | Estratégia de testes |
| `cortex_agent_all` | Roda todos os agentes |
| `cortex_report` | Relatório unificado |
| `cortex_history` | Histórico de relatórios/planos |
| `cortex_config_get` | Lê a configuração atual |

## Configuração

Cortex persiste ajustes por projeto em `.cortex/config.json`: padrões de include/ignore, definição de camadas, padrões de segurança customizados, pesos de busca e regras de review. Sem o arquivo, usa defaults sensatos (ex.: ignora `node_modules/**`, `dist/**`; busca com pesos `path 3`, `symbol 5`, `import 2`, `export 1`, `structural 2`).

## Status

✅ **Instalado** (v1.0.0) — CLIs `cortex` e `cortex-mcp` funcionando; MCP adicionado ao `opencode.jsonc`. Requer restart do OpenCode para carregar o MCP.

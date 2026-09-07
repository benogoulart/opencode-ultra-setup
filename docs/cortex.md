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

`cortex_init`, `cortex_status`, `cortex_analyze`, `cortex_search`, `cortex_context`, `cortex_remember`, `cortex_memory_search`, `cortex_memory_list`, `cortex_memory_get`, `cortex_memory_delete`, `cortex_plan`, `cortex_review`, `cortex_dependencies`, `cortex_agent_architect`, `cortex_agent_reviewer`, `cortex_agent_security`, `cortex_agent_tester`, `cortex_agent_all`, `cortex_report`, `cortex_history`, `cortex_config_get`.

## Status

✅ **Instalado** (v1.0.0) — CLIs `cortex` e `cortex-mcp` funcionando; MCP adicionado ao `opencode.jsonc`. Requer restart do OpenCode para carregar o MCP.

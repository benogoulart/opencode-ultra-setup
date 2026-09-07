# opencode-agent-skills

> **Projeto original:** https://github.com/joshuadavidthomas/opencode-agent-skills

Adiciona **skills reutilizáveis** ao OpenCode — workflows e instruções especializadas que o agente carrega sob demanda quando a tarefa casa com uma skill. Exemplo nativo: a skill `customize-opencode` para editar a própria config do OpenCode.

## Instalação

Adicionado como plugin `opencode-agent-skills` no `opencode.jsonc`.

## O que permite

- Carregar instruções/workflow específicos (ex.: "como configurar o opencode corretamente")
- Divisão por contexto, evitando desperdício de contexto em instruções que não se aplicam à tarefa atual

# oh-my-openagent

Um time de **11 agentes** com **Team Mode** (execução paralela, `ultrawork`) e **hashline edits** (edições verificadas por hash), **goal** persistente e **auto-resume**.

## Instalação

```bash
npm install -g --allow-scripts=bun bun
bunx oh-my-openagent upgrade --claude=no --openai=no --gemini=yes --copilot=yes --skip-auth
```

O plugin é registrado no `opencode.jsonc` e a config dos agentes fica em `~/.omo/omo.jsonc`.

## Agentes

| Agente | Função |
|---|---|
| **Sisyphus** | orquestra o time, quebra tarefas, distribui |
| **Hephaestus** | deep work / trabalho pesado |
| **Oracle** | debug e arquitetura |
| **Atlas / Metis** | orquestração e coordenação |
| **Momus** | review de código |
| **Prometheus** | testes e iteração |
| **Explore** | varre o código |
| **Librarian** | docs e utilitários |
| **Multimodal** | entradas multimodais |

## Comandos

- `ultrawork` / `ulw` — ativa todos os agentes em tarefas complexas
- `/goal <objetivo>` — define objetivo persistente
- `/handoff` — gera resumo de contexto entre sessões

## Feature principal

Cada agente pode ser apontado para um **modelo diferente**, permitindo rotear trabalho pesado pro modelo caro e tarefas repetitivas pro modelo barato. Ver [Command Code GOAT](goat.md) para o roteamento planejado.

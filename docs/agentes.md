# AGENTS.md global — Karpathy + Anti-Slop

Diretrizes globais (em `~/.config/opencode/AGENTS.md`) para o agente parar de fazer **overengineering** e seguir boas práticas de qualidade.

Baseado nas diretrizes de **Andrej Karpathy** (ex-OpenAI/Tesla) e no **anti-slop**.

## Princípios

1. **Think before coding** — declare suposições, mostre tradeoffs, pergunte quando incerto.
2. **Simplicity first** — código mínimo que resolve; nada especulativo.
3. **Surgical changes** — toque apenas no que foi pedido; não "melhore" o que não está quebrado.
4. **Goal-driven** — critérios de sucesso verificáveis; repita até passar.
5. **Anti-slop** — sem preâmbulos desnecessários, sem código comentado inútil, sem docs falsas, sem mudanças cosméticas.

## O problema que resolve

Agentes de código tendem a: fazer feature além do pedido, "melhorar" código adjacente, comentar demais, gerar commit genérico. Essas diretrizes forçam eles a **serem mínimos e honestos** sobre o que mudam.

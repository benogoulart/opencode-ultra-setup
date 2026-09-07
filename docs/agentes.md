# Global AGENTS.md — Karpathy + Anti-Slop

> **Original project (Karpathy):** https://github.com/multica-ai/andrej-karpathy-skills
> **Original project (Anti-Slop):** https://github.com/peakoss/anti-slop

Global guidelines (in `~/.config/opencode/AGENTS.md`) so the agent stops **overengineering** and follows quality best practices.

Based on the guidelines of **Andrej Karpathy** (ex-OpenAI/Tesla) and **anti-slop**.

## Principles

1. **Think before coding** — declare assumptions, show tradeoffs, ask when uncertain.
2. **Simplicity first** — minimal code that solves the problem; nothing speculative.
3. **Surgical changes** — touch only what was asked; don't "improve" what isn't broken.
4. **Goal-driven** — verifiable success criteria; iterate until passing.
5. **Anti-slop** — no unnecessary preambles, no useless commented code, no fake docs, no cosmetic changes.

## The problem it solves

Coding agents tend to: build features beyond what was asked, "improve" adjacent code, over-comment, and write generic commit messages. These guidelines force them to **be minimal and honest** about what they change.
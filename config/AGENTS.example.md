# AGENTS.md — Global agent guidelines (example)

> Based on Andrej Karpathy (multica-ai/andrej-karpathy-skills) and peakoss/anti-slop.

Copy to `~/.config/opencode/AGENTS.md` so every project inherits the rules below.
**Tradeoff:** these rules lean toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Show tradeoffs.**

- Declare your assumptions explicitly. Ask when uncertain.
- If multiple interpretations exist, present them — don't pick silently.
- If a simpler approach exists, say it. Opine when justified.
- If something isn't clear, stop, name the confusion, and ask.

## 2. Simplicity First

**Minimal code that solves the problem. Nothing speculative.**

- No features beyond what was asked. No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- Ask: "Would a senior engineer call this overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what's needed. Clean up only your own mess.**

- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor what isn't broken. Respect existing style.
- Remove imports/variables/functions your change left unused; don't delete pre-existing dead code unless asked.

## 4. Goal-Driven Execution

**Define verifiable success criteria. Iterate until verified.**

- "Add validation" → "write tests for invalid inputs, then make them pass".
- "Fix the bug" → "write a test that reproduces it, then make it pass".
- For multi-step tasks, declare a brief plan with a check per step.

## 5. Anti-Slop

- No unnecessary preambles. No commented-out code.
- No inflated or fake documentation.
- No generic commit messages ("fix stuff").
- No cosmetic changes out of scope.
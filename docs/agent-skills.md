# opencode-agent-skills

> **Original project:** https://github.com/joshuadavidthomas/opencode-agent-skills

Adds **reusable skills** to OpenCode — specialized workflows and instructions that the agent loads on demand when a task matches a skill. Native example: the `customize-opencode` skill for editing OpenCode's own config.

## Installation

Added as the `opencode-agent-skills` plugin in `opencode.jsonc`.

## What it enables

- Load specific instructions/workflows (e.g., "how to configure opencode correctly")
- Split by context, avoiding wasted context on instructions that don't apply to the current task
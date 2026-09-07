# headroom

Comprime o contexto **antes** de mandar pro modelo, reduzindo o uso de tokens em ~20–57% sem perder linhas críticas. É **reversível** — busca o texto original quando necessário.

## Instalação

```bash
pip install "headroom-ai[all]"
```

## Execução

Um launcher `start-headroom.ps1` sobe o proxy na porta **8787** (logs em `~/.headroom/`).

## Status

⏳ **Em ajuste** — o proxy (health `http://127.0.0.1:8787/health`) teve timeouts. `headroom doctor` aponta 1 falha + 4 warnings (proxy not reachable). Ver [plano](plano.md).

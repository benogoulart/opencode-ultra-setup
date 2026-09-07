# opencode-supermemory

> **Projeto original:** https://github.com/supermemoryai/opencode-supermemory

Memória **persistente entre sessões**. O OpenCode lembra de convenções do projeto, decisões e contexto mesmo depois de fechar o terminal ou compactar o contexto.

## Instalação

```bash
bunx opencode-supermemory@latest install --no-tui
bunx opencode-supermemory@latest login   # abre browser para autenticar
```

Cria os comandos `/supermemory-init`, `/supermemory-login`, `/supermemory-logout`, `/supermemory-status` e um `supermemory.jsonc`.

## Status

✅ **Funcionando** — autenticado (conta Pampequeredbull), projeto container criado, recall per-turn + capture a cada 3 turnos e fim de sessão. Requer restart do OpenCode após o login.

> ⚠️ **Nota:** o dashboard do console (`console.supermemory.ai/auth/connect`) às vezes trava na etapa "Loading workspaces…". Não é problema de rede/CLI — tentar em janela anônima ou relançar o `login` costuma resolver.
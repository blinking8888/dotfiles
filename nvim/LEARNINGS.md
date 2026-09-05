# Learnings

## Neovim Configuration
- `mason.nvim` registers user commands like `:Mason`, `:MasonUpdate`, `:MasonInstall`, etc. when the plugin is loaded. If the plugin specification is commented out in `lua/s2r/lazy.lua` or not required, `:MasonUpdate` will not be present.
- In `lazy.nvim`, plugin initialization code that calls `require('plugin')` should be placed in `config = function()`, not `init = function()`. `init` runs unconditionally before plugins are added/loaded, whereas `config` runs after dependencies are loaded.
- In `mason-lspconfig` v2.0+ (targeting Neovim 0.11+), `setup_handlers` was removed. Configuration should use Neovim's native `vim.lsp.config` and `vim.lsp.enable()`.
- `tsserver` was deprecated in favor of `ts_ls` in `nvim-lspconfig` and `mason-lspconfig`.
- In Neovim 0.11+, configuring `ts_ls` in `servers` with `ensure_installed` in `mason-lspconfig` automatically manages `typescript-language-server` and attaches cleanly to TypeScript/JavaScript files via `vim.lsp.enable('ts_ls')`.
- Incomplete git clones in `~/.local/share/nvim/lazy/<plugin>` cause runtime `module '<plugin>' not found` errors when triggered (such as on `InsertEnter`). To cleanly disable plugins, comment them out in `lazy.lua`, set `enabled = false` in their spec files, and remove any partial clone directories.
- In `lazy.nvim`, when multiple plugin specs target the same plugin (e.g., `'neovim/nvim-lspconfig'`), duplicate `config = function()` blocks overwrite each other, causing earlier specs (like `autoformat.lua`) to never run. Use `init = function()` or separate modules to ensure secondary configurations execute reliably.
- For autoformatting on save with Neovim LSP (e.g., `ts_ls` for TS/TSX and `rust_analyzer` for RS), attach a `BufWritePre` autocmd on `LspAttach` that verifies `client:supports_method('textDocument/formatting')` and invokes `vim.lsp.buf.format { async = false, bufnr = bufnr }`.

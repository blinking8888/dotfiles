vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "txt", "markdown", "gitcommit" }, command = [[setlocal spell]] }
)

require('s2r.lazy')
require('s2r.core')

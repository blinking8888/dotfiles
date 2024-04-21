return {
  "rhysd/vim-clang-format",
  dependencies = {
  },
  config = function()
    vim.g.neoformat_enabled_c = { 'clangformat' }
    vim.g.neoformat_enabled_cpp = { 'clangformat' }
    -- vim.g.clang_format#detect_style_file
    vim.g.neoformat_cpp_clangformat = {
      exe = 'clang-format',
      args = { '--style="file"' }
    }
  end,
  --commit = 'b1ff0d6c',
}

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    require('s2r.plugins.git'),
    require('s2r.plugins.lsp'),
    require('s2r.plugins.nvim-cmp'),
    require('s2r.plugins.gitsigns'),
    require('s2r.plugins.which-key'),
    require('s2r.plugins.lualine'),
    require('s2r.plugins.indent-blankline'),
    require('s2r.plugins.telescope'),
    require('s2r.plugins.nvim-treesitter'),
    require('s2r.plugins.comment'),
    require('s2r.plugins.autoformat'),
    require('s2r.plugins.catpuccin'),
    require('s2r.plugins.gutentags'),
    require('s2r.plugins.clang-format'),
    require('s2r.plugins.dressing'),
    -- require 's2r.plugins.debug',
    -- require 's2r.plugins.copilot-cmp',
    -- require 's2r.plugins.copilot',
    -- require('s2r.plugins.theme'),
}, {})

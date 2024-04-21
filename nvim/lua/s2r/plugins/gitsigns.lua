return {
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = require('gitsigns')
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map('n', '<Leader>hp', gs.prev_hunk, '[H]unk [P]revious')
        map('n', '<Leader>hn', gs.next_hunk, '[H]unk [N]ext')
        map('n', '<Leader>hv', gs.preview_hunk, '[H]unk Pre[v]iew')
        map("v", "<leader>hs",
          function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          "[H]unk [s]tage")
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "[H]unk [r]eset")

        map("n", "<leader>hS", gs.stage_buffer, "[H]unk [S]tage buffer")
        map("n", "<leader>hR", gs.reset_buffer, "[H]unk [R]eset buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "[H]unk [U]ndo stage hunk")

        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "[H]unk [B]lame line")
        map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line [H]unk [B]lame")
        map("n", "<leader>hd", gs.diffthis, "[H]unk [d]iff this")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "[H]unk [D]iff this ~")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
      end,
    },
  },
}

--
-- misc.lua
--

-- Highlight yank selections.
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Registrations for which-key
require('which-key').register({
    ['<leader>t'] = { name = 'Tree (nvim-tree)', _ = 'which_key_ignore' },

    ['<leader>f'] = { name = 'Find (telescope)', _ = 'which_key_ignore' },
    ['<leader>fs'] = { name = 'Search (telescope)', _ = 'which_key_ignore' },
    ['<leader>fg'] = { name = 'Git (telescope)', _ = 'which_key_ignore' },

    ['<leader>l'] = { name = 'LSP (mason)', _ = 'which_key_ignore' },
    ['<leader>lr'] = { name = 'Refactor', _ = 'which_key_ignore' },
    ['<leader>lg'] = { name = 'Goto', _ = 'which_key_ignore' },
    ['<leader>ll'] = { name = 'List', _ = 'which_key_ignore' },
    ['<leader>ld'] = { name = 'Diagnostics', _ = 'which_key_ignore' },

    ['<leader>g'] = { name = 'Git (fugitive, gitsigns)', _ = 'which_key_ignore' },
    ['<leader>gs'] = { name = 'Gitsigns', _ = 'which_key_ignore' },

    ['<leader>c'] = { name = 'Clojure (paredit)', _ = 'which_key_ignore'},
    ['<leader>cs'] = { name = 'Surp (paredit)', _ = 'which_key_ignore'},
    ['<leader>cb'] = { name = 'Barf (paredit)', _ = 'which_key_ignore'},

    ['<leader>cd'] = { name = 'Drag (paredit)', _ = 'which_key_ignore'},
    ['<leader>cde'] = { name = 'Element (paredit)', _ = 'which_key_ignore'},
    ['<leader>cdf'] = { name = 'Form (paredit)', _ = 'which_key_ignore'},
})

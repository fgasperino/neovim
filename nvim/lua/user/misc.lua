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
    ['<leader>t'] = { name = '[T]ree (nvim-tree)', _ = 'which_key_ignore' },

    ['<leader>f'] = { name = '[F]ind (telescope)', _ = 'which_key_ignore' },
    ['<leader>fs'] = { name = '[S]earch (telescope)', _ = 'which_key_ignore' },
    ['<leader>fg'] = { name = '[G]it (telescope)', _ = 'which_key_ignore' },

    ['<leader>l'] = { name = '[L]SP (mason)', _ = 'which_key_ignore' },
    ['<leader>lr'] = { name = '[R]efactor', _ = 'which_key_ignore' },
    ['<leader>lg'] = { name = '[G]oto', _ = 'which_key_ignore' },
    ['<leader>ll'] = { name = '[L]ist', _ = 'which_key_ignore' },
    ['<leader>ld'] = { name = '[D]iagnostics', _ = 'which_key_ignore' },

    ['<leader>g'] = { name = '[G]it (fugitive, gitsigns)', _ = 'which_key_ignore' },
    ['<leader>gs'] = { name = 'Git[S]igns', _ = 'which_key_ignore' },

    ['<leader>c'] = { name = '[C]lojure (paredit)', _ = 'which_key_ignore'},
    ['<leader>cs'] = { name = '[S]urp (paredit)', _ = 'which_key_ignore'},
    ['<leader>cb'] = { name = '[B]arf (paredit)', _ = 'which_key_ignore'},

    ['<leader>cd'] = { name = '[D]rag (paredit)', _ = 'which_key_ignore'},
    ['<leader>cde'] = { name = '[E]lement (paredit)', _ = 'which_key_ignore'},
    ['<leader>cdf'] = { name = '[F]orm (paredit)', _ = 'which_key_ignore'},
})

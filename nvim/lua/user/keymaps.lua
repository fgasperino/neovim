--
-- keymap.lua
--

local keymap = vim.keymap

-- Keymaps for better default experience
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Join lines, trimming whitespace.
keymap.set('n', '<M-j>', vim.cmd.join, { desc = 'Join lines, trim whitespace' })
keymap.set('i', '<M-j>', vim.cmd.join, { desc = 'Join lines, trim whitespace' })

-- Keep cursor centered on scroll up/down
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })

-- Keep cursor centered for regex search
keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result' })

-- Additional yank for global / system clipboard
keymap.set({ 'n', 'v' }, '<leader>y', '\'+y', { desc = 'Yank to system clipboard' })
keymap.set({ 'n', 'v' }, '<leader>p', '\'+p', { desc = 'Paste to system clipboard' })

-- Keep copy buffer by sending paste buffer to diff register.
keymap.set('x', '<leader>p', '\'_dP')

-- Allow quick exit of insert, visual, operator modes.
keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })
keymap.set('o', 'kj', '<Esc>', { desc = 'Exit operator-pending mode' })

-- Buffers --
keymap.set('n', '<s-j>', ':bnext<cr>', { desc = 'Change to next open buffer' })
keymap.set('n', '<leader>bd', ':<c-u>bprevious <bar> bdelete #<cr>', { desc = 'Delete current buffer (preserve window)' })

-- Window panes --
keymap.set('n', '<Left>', ':vertical resize +1<cr>', { desc = 'Resize pane (vert, grow)' })
keymap.set('n', '<Right>', ':vertical resize -1<cr>', { desc = 'Resize pane (vert, shrink)' })
keymap.set('n', '<Up>', ':resize +1<cr>', { desc = 'Resize pane (horiz, grow)' })
keymap.set('n', '<Down>', ':resize -1<cr>', { desc = 'Resize pane (horiz, shrink)' })

--
-- PLUGINS
--

-- Nvim-Tree
keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { desc = '' })

-- Telescope
local builtin = require('telescope.builtin')

keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files (fuzzy)' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Grep in Files (fuzzy)' })
keymap.set('n', '<leader>fsw', builtin.grep_string, { desc = 'Search directory for current Word (fuzzy)' })
keymap.set('n', '<leader>fsi', ":lua require('telescope.builtin').grep_string({search=vim.fn.input('Grep for: ')})<cr>", { desc = 'Search directory for Input' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers (fuzzy)' })
keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find Recent Files (fuzzy)' })

keymap.set('n', '<leader>fgc', '<cmd>:Telescope git_commits<cr>', { desc = 'Commits (fuzzy)' })
keymap.set('n', '<leader>fgf', '<cmd>:Telescope git_files<cr>', { desc = 'Files (fuzzy)' })
keymap.set('n', '<leader>fgb', '<cmd>:Telescope git_branches<cr>', { desc = 'Branches (fuzzy)' })
keymap.set('n', '<leader>fgs', '<cmd>:Telescope git_status<cr>', { desc = 'Status (fuzzy)' })
keymap.set('n', '<leader>fgst', '<cmd>:Telescope git_stash<cr>', { desc = 'Stash (fuzzy)' })

keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })


-- LSP:
local buf = vim.lsp.buf

keymap.set('n', '<leader>lrf', buf.format, { desc = 'Format buffer' })
keymap.set('n', '<leader>lrr', buf.rename, { desc = 'Rename reference' })
keymap.set('n', '<leader>lrc', buf.code_action, { desc = 'Code Actions' })
keymap.set('n', '<leader>lrs', [[:%s/\s\+$//e<cr>]], { desc = 'Strip trailing whitespaces' })

keymap.set('n', '<leader>lgd', buf.definition, { desc = 'Goto Definition' })
keymap.set('n', '<leader>lgi', buf.implementation, { desc = 'Goto Implementation' })

keymap.set('n', '<leader>llc', buf.incoming_calls, { desc = 'List Incoming Calls' })
keymap.set('n', '<leader>llr', buf.references, { desc = 'List References' })

keymap.set('n', '<leader>lk', buf.hover, { desc = 'Hover Documentation' })

-- Neogit


-- Conjure


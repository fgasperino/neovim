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
keymap.set('v', '<leader>p', '\'+p', { desc = 'Paste to system clipboard' })

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

keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find [F]iles (fuzzy)' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[G]rep in Files (fuzzy)' })
keymap.set('n', '<leader>fsw', builtin.grep_string, { desc = 'Search directory for current [W]ord (fuzzy)' })
keymap.set('n', '<leader>fsi', ":lua require('telescope.builtin').grep_string({search=vim.fn.input('Grep for: ')})<cr>", { desc = 'Search directory for [I]nput' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find [B]uffers (fuzzy)' })
keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find [R]ecent Files (fuzzy)' })

keymap.set('n', '<leader>fgc', '<cmd>:Telescope git_commits<cr>', { desc = '[C]ommits (fuzzy)' })
keymap.set('n', '<leader>fgf', '<cmd>:Telescope git_files<cr>', { desc = '[F]iles (fuzzy)' })
keymap.set('n', '<leader>fgb', '<cmd>:Telescope git_branches<cr>', { desc = '[B]ranches (fuzzy)' })
keymap.set('n', '<leader>fgs', '<cmd>:Telescope git_status<cr>', { desc = '[S]tatus (fuzzy)' })
keymap.set('n', '<leader>fgst', '<cmd>:Telescope git_stash<cr>', { desc = '[St]ash (fuzzy)' })

keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })


-- LSP:
local buf = vim.lsp.buf

keymap.set('n', '<leader>lrf', buf.format, { desc = '[F]ormat buffer' })
keymap.set('n', '<leader>lrr', buf.rename, { desc = '[R]ename reference' })
keymap.set('n', '<leader>lrc', buf.code_action, { desc = '[C]ode Actions' })
keymap.set('n', '<leader>lrs', [[:%s/\s\+$//e<cr>]], { desc = '[S]trip trailing whitespaces' })

keymap.set('n', '<leader>lgd', buf.definition, { desc = 'Goto [D]efinition' })
keymap.set('n', '<leader>lgi', buf.implementation, { desc = 'Goto [I]mplementation' })

keymap.set('n', '<leader>llc', buf.incoming_calls, { desc = 'List Incoming [C]alls' })
keymap.set('n', '<leader>llr', buf.references, { desc = 'List [R]eferences' })

keymap.set('n', '<leader>lk', buf.hover, { desc = 'Hover Documentation' })

-- Fugitive-
keymap.set('n', '<leader>g', '<cmd>:Git<cr>', { desc = 'Git Summary' })
keymap.set('n', '<leader>gl', '<cmd>:Git log<cr>', { desc = "Git Log" })
keymap.set('n', '<leader>gd', '<cmd>:Git diff<cr>', { desc = "Git Diff" })
keymap.set('n', '<leader>ga', '<cmd>:Gwrite<cr>', { desc = "Git Add" })
keymap.set('n', '<leader>gr', '<cmd>:Gread<cr>', { desc = "Git Reset" })
keymap.set('n', '<leader>gc', '<cmd>:Git commit<cr>', { desc = "Git Commit" })

-- Gitsigns
keymap.set('n', '<leader>gshn', '<cmd>:Gitsigns next_hunk<cr>', { desc = 'Git(signs) Next Hunk' })
keymap.set('n', '<leader>gshp', '<cmd>:Gitsigns prev_hunk<cr>', { desc = 'Git(signs) Previous Hunk' })
keymap.set('n', '<leader>gshv', '<cmd>:Gitsigns preview_hunk_inline<cr>', { desc = 'Git(signs) Preview Hunk' })
keymap.set('n', '<leader>gshs', '<cmd>:Gitsigns stage_hunk<cr>', { desc = 'Git(signs) Stage Hunk' })
keymap.set('n', '<leader>gshus', '<cmd>:Gitsigns undo_stage_hunk<cr>', { desc = 'Git(signs) Undo Stage Hunk' })

-- Conjure


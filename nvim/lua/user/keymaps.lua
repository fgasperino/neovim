--
-- keymap.lua
--

local km = vim.keymap
local cmd = vim.cmd

-- kms for better default experience
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Join lines, trimming whitespace.
km.set('n', '<M-j>', cmd.join, { desc = 'Join lines, trim whitespace' })
km.set('i', '<M-j>', cmd.join, { desc = 'Join lines, trim whitespace' })

-- Keep cursor centered on scroll up/down
km.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down' })
km.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })

-- Keep cursor centered for regex search
km.set('n', 'n', 'nzzzv', { desc = 'Next search result' })
km.set('n', 'N', 'Nzzzv', { desc = 'Prev search result' })

-- Additional yank for global / system clipboard
km.set({ 'n', 'v' }, '<leader>y', '\'+y', { desc = 'Yank to system clipboard' })
km.set({ 'n', 'v' }, '<leader>p', '\'+p', { desc = 'Paste to system clipboard' })

-- Keep copy buffer by sending paste buffer to diff register.
km.set('x', '<leader>p', '\'_dP')

-- Allow quick exit of insert, visual, operator modes.
km.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })
km.set('o', 'kj', '<Esc>', { desc = 'Exit operator-pending mode' })

-- Buffers --
km.set('n', '<s-j>', ':bnext<cr>', { desc = 'Change to next open buffer' })
km.set('n', '<s-h>', ':bprev<cr>', { desc = 'Change to prev open buffer' })
km.set('n', '<leader>bd', ':<c-u>bprevious <bar> bdelete #<cr>', { desc = 'Delete current buffer (preserve window)' })

-- Window panes --
km.set('n', '<Left>', ':vertical resize +1<cr>', { desc = 'Resize pane (vert, grow)' })
km.set('n', '<Right>', ':vertical resize -1<cr>', { desc = 'Resize pane (vert, shrink)' })
km.set('n', '<Up>', ':resize +1<cr>', { desc = 'Resize pane (horiz, grow)' })
km.set('n', '<Down>', ':resize -1<cr>', { desc = 'Resize pane (horiz, shrink)' })

--
-- init.lua
--
-- Main entry point for Neovim LUA configuration.
--

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--
-- Lazy Package Manager
--

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
  { import = 'user.plugins' },
}, {})

-- 
-- globals
--

require('user.globals')

--
-- options
--

require('user.options')

-- 
-- window-options
--

require('user.window-options')

--
-- keymaps
--

require ('user.keymaps')

--
-- autocmds
--

require ('user.autocmds')

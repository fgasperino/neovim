 return {
     -- https://github.com/nvim-tree/nvim-tree.lua
     'nvim-tree/nvim-tree.lua',

     tag = 'v1.9.0',

     dependencies = {
         'nvim-tree/nvim-web-devicons',
     },

     config = function()
         local nt = require('nvim-tree')

         nt.setup({})

         local km = vim.keymap

         km.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle File Tree (Nvim Tree)' })
         km.set('n', '<leader>tff', '<cmd>NvimTreeFindFile<cr>', { desc = 'Toggle File Tree (at current buffer) (Nvim Tree)' })
     end
 }

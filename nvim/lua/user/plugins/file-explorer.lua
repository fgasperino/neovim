 return {
     -- https://github.com/nvim-tree/nvim-tree.lua
     'nvim-tree/nvim-tree.lua',
 
     tag = 'v0.99',
 
     dependencies = {
         'nvim-tree/nvim-web-devicons',
     },
 
     config = function()
         require('nvim-tree').setup({ })
     end
 }


return {
    -- https://github.com/NeogitOrg/neogit 
    'NeogitOrg/neogit',

    tag = 'v2.0.0',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
        'nvim-telescope/telescope.nvim',
    },

    config = function()
        local n = require('neogit')

        n.setup({})

        local km = vim.keymap

        km.set('n', '<leader>ng', n.open, { desc = 'Open Git (Neogit)'})
    end
}

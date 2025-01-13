return {
    -- https://github.com/debugloop/telescope-undo.nvim
    'debugloop/telescope-undo.nvim',

    dependencies = {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    opts = {
        extensions = {
            undo = {
                side_by_side = true,
                layout_strategy = 'vertical',
                layout_config = {
                    preview_height = 0.8
                },
            },
        },
    },

    config = function(_, opts)
        local t = require('telescope')

        t.setup(opts)
        t.load_extension('undo')

        local km = vim.keymap

        km.set('n', '<leader>u', '<cmd>Telescope undo<cr>', {desc = 'Undo Tree (Telescope)'})
    end
}

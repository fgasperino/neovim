return {
    {
        -- https://github.com/tpope/vim-sleuth
        'tpope/vim-sleuth',

        tag = 'v2.0',

        event = 'VeryLazy',
    },

    {
        --
        'nvim-lualine/lualine.nvim',

        config = function()
            require('lualine').setup({})
        end,

        opts = {
            options = {
                icons_enabled = true,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        }
    },
}

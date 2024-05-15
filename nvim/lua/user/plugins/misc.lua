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

    {
        -- https://github.com/christoomey/vim-tmux-navigator
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    }
}

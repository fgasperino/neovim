return {
    {
        -- https://github.com/nvim-tree/nvim-tree.lua
        'nvim-tree/nvim-tree.lua',

        tag = 'v1.14.0',

        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },

        config = function()
            local nt = require('nvim-tree')

            nt.setup({})

            local km = vim.keymap

            km.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle File Tree (Nvim Tree)' })
            km.set('n', '<leader>tff', '<cmd>NvimTreeFindFile<cr>',
                { desc = 'Toggle File Tree (at current buffer) (Nvim Tree)' })
        end
    },
    {
        --https://github.com/nvim-lualine/lualine.nvim
        'nvim-lualine/lualine.nvim',

        dependencies = { 'nvim-tree/nvim-web-devicons' },

        config = function()
            require('lualine').setup({})
        end
    },

    {
        -- https://github.com/folke/which-key.nvim
        "folke/which-key.nvim",

        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },

        tag = "v3.17.0",
        event = "VeryLazy",

        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },

        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        --  https://github.com/alexghergh/nvim-tmux-navigation
        'alexghergh/nvim-tmux-navigation',

        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }

            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    }
}

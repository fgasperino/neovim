return
{
    {
        -- https://github.com/nvim-telescope/telescope.nvim
        'nvim-telescope/telescope.nvim',

        tag = '0.1.5',

        dependencies = {
            'nvim-lua/plenary.nvim',
            'folke/which-key.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end
            }
        },

        config = function()
            local telescope = require('telescope')

            telescope.setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = 'smart_case'
                    }
                }
            })

            telescope.load_extension('fzf')
        end
    },

    {
        -- https://github.com/debugloop/telescope-undo.nvim
        "debugloop/telescope-undo.nvim",

        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            {
                "<leader>u",
                "<cmd>Telescope undo<cr>",
                desc = "[U]ndo History",
            },
        },

        opts = {
            extensions = {
                undo = {
                    diff_context_lines = 10,
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8
                    },
                },
            },
        },

        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },

    {
        -- https://github.com/Slotos/telescope-lsp-handlers.nvim
        "Slotos/telescope-lsp-handlers.nvim",

        dependencies = {
            "nvim-telescope/telescope.nvim",
        },

        config = function()
            require('telescope-lsp-handlers').setup({})
        end
    }
}

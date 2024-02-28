return {
    {
        -- https://github.com/L3MON4D3/LuaSnip
        'L3MON4D3/LuaSnip',

        event = 'VeryLazy',

        dependencies = {
            -- https://github.com/saadparwaiz1/cmp_luasnip
            'saadparwaiz1/cmp_luasnip',
            -- https://github.com/rafamadriz/friendly-snippets
            'rafamadriz/friendly-snippets'
        }
    },

    {
        -- https://github.com/hrsh7th/cmp-nvim-lsp
        'hrsh7th/cmp-nvim-lsp',

        event = 'VeryLazy',

        config = function()
            require('cmp_nvim_lsp')
        end
    },

    {
        -- https://github.com/hrsh7th/nvim-cmp
        'hrsh7th/nvim-cmp',

        event = { 'InsertEnter', 'CmdlineEnter' },

        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
        },

        config = function()
            local cmp = require('cmp')

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },

                mapping = {
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,
                    ['<S-Tab>'] = function (fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end,
                    ["<CR>"] = cmp.mapping.confirm({ select = true })
                },

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }
                })
            })
        end
    },

}

local function get_servers()
    return { 'lua_ls', 'clojure_lsp' }
end

return {
    {
        -- https://github.com/williamboman/mason.nvim
        'williamboman/mason.nvim',

        tag = 'v1.10.0',

        config = function()
            require('mason').setup({})
        end
    },

    {
        -- https://github.com/williamboman/mason-lspconfig.nvim
        'williamboman/mason-lspconfig.nvim',

        tag = 'v1.26.0',

        dependencies = {
            'williamboman/mason.nvim'
        },

        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'clojure_lsp' },
                auto_install = true
            })
        end,
    },

    {
        -- https://github.com/neovim/nvim-lspconfig
        'neovim/nvim-lspconfig',

        tag = 'v0.1.7',

        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp'
        },

        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            --local servers = { 'lua_ls', 'clojure_lsp' }
            local servers = get_servers()

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities
                })
            end

            --            lspconfig.lua_ls.setup({
            --                capabilities = capabilities
            --            })
        end
    },

    {
        -- https://github.com/folke/neodev.nvim
        'folke/neodev.nvim',

        tag = 'v2.5.2',

        config = function()
            require('neodev').setup({})
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        }
                    }

                }
            })
        end
    }
}

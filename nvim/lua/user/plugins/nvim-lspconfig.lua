return {
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',

    tag = 'v1.3.0',

    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp'
    },

    config = function()
        local lspconfig = require('lspconfig')
        local servers = require('user.functions').required_lsp_servers()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                capabilities = capabilities,
                init_options = {
                    preferences = {
                        disableSuggestions = false
                    }
                }
            })
        end
    end
}

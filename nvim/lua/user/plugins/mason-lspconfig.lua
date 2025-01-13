return {
    -- https://github.com/williamboman/mason-lspconfig.nvim
    'williamboman/mason-lspconfig.nvim',

    tag = 'v1.31.0',

    dependencies = {
        'williamboman/mason.nvim'
    },

    config = function()
        local servers = require('user.functions').required_lsp_servers()

        require('mason-lspconfig').setup({
            ensure_installed = servers,
            auto_install = true
        })
    end,
} 

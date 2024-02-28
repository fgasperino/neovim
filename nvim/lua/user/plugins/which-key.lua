return {
    -- https://github.com/folke/which-key.nvim
    'folke/which-key.nvim',

    tag = 'v1.6.0',
    event = 'VeryLazy',
    
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,

    config = function()
        require('which-key').setup({})
    end
}

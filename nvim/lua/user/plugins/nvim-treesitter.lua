return {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',

    tag = 'v0.9.3',

    build = ':TSUpdate',

    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {'lua', 'vim', 'vimdoc', 'bash', 'clojure', 'python', 'java', 'markdown', 'markdown_inline', 'sql'},
            auto_install = true,
            sync_install = false,

            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = true },
            textobjects = { enable = true },
        })
    end
}

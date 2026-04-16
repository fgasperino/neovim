return {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',

    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects'
    },

    tag = 'v0.10.0',

    build = ':TSUpdate',

    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'lua',
                'vim',
                'vimdoc',
                'bash',
                'clojure',
                'python',
                'java',
                'markdown',
                'markdown_inline',
                'sql',
                'html',
                'javascript',
                'dockerfile',
                'json',
            },
            auto_install = true,
            sync_install = false,

            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        })
    end
}

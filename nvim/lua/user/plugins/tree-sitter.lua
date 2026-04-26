return {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',

    branch = 'main',
    lazy = false,     -- REQUIRED: No lazy loading supported

    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects'
    },

    build = ':TSUpdate',

    config = function()
        -- Basic setup (minimal)
        require('nvim-treesitter').setup()

        -- Sync parser installation (waits for completion)
        require('nvim-treesitter').install({
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
            'json'
        }):wait(300000)  -- Wait max 5 minutes

        -- Textobjects configuration (new API)
        require('nvim-treesitter-textobjects').setup({
            select = {
                lookahead = true, -- Automatically jump forward to textobj
            },
        })

        -- Textobjects keymaps (explicitly defined)
        vim.keymap.set({ 'x', 'o' }, 'af', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
        end)
        vim.keymap.set({ 'x', 'o' }, 'if', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
        end)
        vim.keymap.set({ 'x', 'o' }, 'ac', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
        end)
        vim.keymap.set({ 'x', 'o' }, 'ic', function()
            require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
        end)
    end
}

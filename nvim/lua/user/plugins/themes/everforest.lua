return {
    'sainnhe/everforest',

    name = 'everforest',
    priority = 1000,
    lazy = false,

    opts = {
        colorscheme = "everforest",
    },

    config = function()
        -- 'hard' provides the most "green", 'soft' and 'medium' are more "grey/brown"
        vim.g.everforest_background = 'hard'

        -- High contrast for the UI helps the statusline pop
        vim.g.everforest_ui_contrast = 'high'

        vim.cmd([[colorscheme everforest]])
    end
}

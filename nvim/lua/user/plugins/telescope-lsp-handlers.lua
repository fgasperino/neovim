return {
    -- https://github.com/Slotos/telescope-lsp-handlers.nvim
    "Slotos/telescope-lsp-handlers.nvim",

    dependencies = {
        "nvim-telescope/telescope.nvim",
    },

    config = function()
        require('telescope-lsp-handlers').setup({})
    end
}

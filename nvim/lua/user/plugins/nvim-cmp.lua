return {
    {
    -- https://github.com/hrsh7th/nvim-cmp 
    'hrsh7th/nvim-cmp',

    tag = 'v0.0.2',

    event = {'InsertEnter', 'CmdlineEnter'},

    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
    },

    config = function()
        local cmp = require('cmp')

        local engines = require('user.functions').completion_engines()
        local completions = {}

        for _, e in pairs(engines) do
            table.insert(completions, {name = e})
        end

        cmp.setup({
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
            sources = cmp.config.sources(completions)
        })
    end
    }
}

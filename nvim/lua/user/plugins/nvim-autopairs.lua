return {
    -- https://github.com/windwp/nvim-autopairs 
    'windwp/nvim-autopairs',

    event = "InsertEnter",

    config = function()
        local npairs = require('nvim-autopairs')

        npairs.setup({
            enable_check_bracket_line = false
        })

        local rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        --
        -- clojure.
        --

        npairs.add_rules({
            rule('$', '$', { 'clojure' })
                :with_pair(cond.none())
                :with_move(cond.none())
                :with_del(cond.none())
                :with_cr(cond.none())
        })
        npairs.get_rules('\'')[1].not_filetypes = {'clojure'}
    end,

    opts = {}
}

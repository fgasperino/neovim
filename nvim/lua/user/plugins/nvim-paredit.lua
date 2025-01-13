return {
    -- https://github.com/julienvincent/nvim-paredit
    'julienvincent/nvim-paredit',

    tag = 'v1.1.1',

    config = function()
        local paredit = require('nvim-paredit')

        paredit.setup({
            use_default_keys = false,
            filetypes = { 'clojure' },
            cursor_behavior = 'auto',
            indent = {
                enabled = true
            },

            keys = {
                ['<leader>cu'] = { paredit.unwrap.unwrap_form_under_cursor, 'Splice sexp (Paredit)' },

                ['<leader>csf'] = { paredit.api.slurp_forwards, 'Slurp forwards (Paredit)' },
                ['<leader>cbf'] = { paredit.api.barf_forwards, 'Barf forwards (Paredit)' },

                ['<leader>csb'] = { paredit.api.slurp_backwards, 'Slurp backwards (Paredit)' },
                ['<leader>cbb'] = { paredit.api.barf_backwards, 'Barf backwards (Paredit)' },

                ['<leader>cdff'] = { paredit.api.drag_form_forwards, 'Drag form forwards (Paredit)' },
                ['<leader>cdfb'] = { paredit.api.drag_form_backwards, 'Drag form backwards (Paredit)' },
                ['<leader>cdef'] = { paredit.api.drag_element_forwards, 'Drag element forwards (Paredit)' },
                ['<leader>cdeb'] = { paredit.api.drag_element_backwards, 'Drag element backwards (Paredit)' }
            }
        })
    end
}

--
-- clojure.lua
--

local function find_shadow_builds(opts)
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local config_path = vim.fn.findfile("shadow-cljs.edn", ".;")

    if config_path == "" then
        vim.notify("shadow-cljs.edn not found", vim.log.levels.WARN)
        return
    end

    local script = string.format([[
                                 (require 'clojure.edn)
                                 (let [config (clojure.edn/read-string (slurp "%s"))]
                                   (doseq [build (keys (:builds config))]
                                     (println (name build))))
                                 ]], config_path)

    local command = {
        "bb",
        "-e",
        script
    }

    opts = opts or {}

    pickers.new(opts, {
        prompt_title = "ClojureScript Builds",
        finder = finders.new_async_job({
            command_generator = function() return command end,
            entry_maker = function(line)
                return { value = line, display = line, ordinal = line }
            end
        }),
        sorter = conf.generic_sorter(opts),
        previewer = false,
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd("ConjureShadowSelect " .. selection.value)
            end)
            return true
        end
    }):find()
end

return {
    {
        -- https://github.com/Olical/conjure
        'Olical/conjure',

        tag = 'v4.55.0',
        lazy = true,
        ft = { 'clojure' },

        init = function()
            vim.g["conjure#client#clojure#nrepl#tap#queue_size"] = 50
            vim.g["conjure#client#clojure#nrepl#refresh#backend"] = 'clj-reload'
            vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
            vim.g["conjure#filetypes"] = { "clojure", "clojurescript" }

            vim.g["conjure#mapping#log_toggle"] = false
        end,

        config = function()
            require('conjure.main').main()
            require('conjure.mapping')['on-filetype']()

            -- Disable LSP diagnostics in the conjure log buffer(s).
            vim.api.nvim_create_autocmd("BufNewFile", {
                group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
                pattern = { "conjure-log-*" },
                callback = function()
                    vim.diagnostic.enable(false)
                end,
                desc = "Conjure Log disable LSP diagnostics",
            })

            vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, { desc = "Go to definition (LSP})" })

            vim.keymap.set('n', '<leader>cvt', "<cmd>ConjureEval (do (require '[user]) (user/view-tap-queue!))<cr>",
                { desc = 'View conjure tap queue' })
            vim.keymap.set('n', '<leader>cssb', find_shadow_builds,
                { desc = 'Connect to clojurescript build (shadow-cljs)' })
            vim.keymap.set('n', '<leader>crn', "<cmd>ConjureCljRefreshChanged<cr>",
                { desc = 'Refresh changed namespaces (Clojure)' })
        end
    },
    {
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
            npairs.get_rules('\'')[1].not_filetypes = { 'clojure' }
        end,

        opts = {}
    },

    {
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
}

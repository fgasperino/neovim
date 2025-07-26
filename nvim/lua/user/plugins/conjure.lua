return {
    {
        -- https://github.com/PaterJason/cmp-conjure 
        'PaterJason/cmp-conjure',

		config = function()
			local cmp = require('cmp')
			local config = cmp.get_config()

			table.insert(config.sources, {
				name = 'buffer',
				option = {
					sources = {
						{ name = 'conjure' }
					}
				}
			})

			cmp.setup(config)
		end
    },

    {
        -- https://github.com/Olical/conjure
        'Olical/conjure',

        tag = 'v4.55.0',
        lazy = true,
        ft = {'clojure'},

        dependencies = {
            'PaterJason/cmp-conjure',
        },

        init = function()
            vim.g["conjure#client#clojure#nrepl#tap#queue_size"] = 50
            vim.g["conjure#client#clojure#nrepl#refresh#backend"] = 'clj-reload'
            vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
            vim.g["conjure#filetypes"] = {"clojure", "clojurescript"}
        end,

        config = function()
            require('conjure.main').main()
            require('conjure.mapping')['on-filetype']()
            local functions = require("user.functions.conjure")

            -- Disable LSP diagnostics in the conjure log buffer(s).
            vim.api.nvim_create_autocmd("BufNewFile", {
                group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
                pattern = { "conjure-log-*" },
                callback = function()
                    vim.diagnostic.enable(false)
                end,
                desc = "Conjure Log disable LSP diagnostics",
            })

            -- Load custom functions for conjure
            functions.setup()
        end
    }
}

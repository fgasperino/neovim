return {
	{
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

		tag = 'v4.50.0',

		dependencies = {
			'PaterJason/cmp-conjure',
		},

		config = function()
			require('conjure.main').main()
			-- require('conjure.mapping')["init"]()
			require('conjure.mapping')['on-filetype']()

			-- Disable LSP diagnostics in the conjure log buffer(s).
			vim.api.nvim_create_autocmd("BufNewFile", {
				group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
				pattern = { "conjure-log-*" },
				callback = function() vim.diagnostic.disable(0) end,
				desc = "Conjure Log disable LSP diagnostics",
			})
		end
	},

	{
		-- https://github.com/julienvincent/nvim-paredit
		'julienvincent/nvim-paredit',

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
	},

	{
		-- https://github.com/windwp/nvim-autopairs
		'windwp/nvim-autopairs',

		event = 'InsertEnter',

		config = function()
			local npairs = require('nvim-autopairs')

			npairs.setup({
				enable_check_bracket_line = false
			})

			local rule = require('nvim-autopairs.rule')
			local cond = require('nvim-autopairs.conds')

			--npairs.add_rules({
				-- Clojure filetypes always will pair.
			--	rule('$', '$', {'clojure'})
				  --:with_pair(cond.none())
				  --:with_move(cond.none())
				  --:with_del(cond.none())
				  --:with_cr(cond.none())
			--})

			-- single quote is a macro.
			npairs.remove_rule('\'')
		end,

		opts = {},
	}
}

return {
	{
		--
		'lewis6991/gitsigns.nvim',

		tag = 'v0.8.1',

		config = function()
			require('gitsigns').setup({
				signs = {
					add = { text = '+' },
					change = { text = '~' },
					delete = { text = '-' },
					topdelete = { text = '-' },
					changedelete = { text = '~' }
				},

				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map('n', '<leader>gnh', function()
						if vim.wo.diff then return '<leader>gnh' end
						vim.schedule(function() gs.next_hunk() end)
						return '<Ignore>'
					end, { expr = true, desc = 'Next hunk' })

					map('n', '<leader>gph', function()
						if vim.wo.diff then return '<leader>gph' end
						vim.schedule(function() gs.prev_hunk() end)
						return '<Ignore>'
					end, { expr = true, desc = 'Prev hunk' })

					-- Actions
					map('n', '<leader>gsh', gs.stage_hunk, { desc = 'Stage hunk' })
					map('n', '<leader>grh', gs.reset_hunk, { desc = 'Reset hunk' })
					map('v', '<leader>gsh', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
					map('v', '<leader>grh', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
					map('n', '<leader>gsb', gs.stage_buffer, { desc = 'Stage buffer' })
					map('n', '<leader>gush', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
					map('n', '<leader>grb', gs.reset_buffer, { desc = 'Reset buffer' })
					map('n', '<leader>gph', gs.preview_hunk, { desc = 'Preview hunk' })
					map('n', '<leader>gbl', function() gs.blame_line { full = true } end, { desc = 'Blame line' })
					map('n', '<leader>gb', gs.toggle_current_line_blame, { desc = 'Toggle blame line' })

					-- Text object
					map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
				end
			})
		end
	},

	{
		--
		'NeogitOrg/neogit',

		tag = 'v1.0.0',

		dependencies = {
			'lewis6991/gitsigns.nvim',
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
			'nvim-telescope/telescope.nvim'
		},

		config = true
	}
}

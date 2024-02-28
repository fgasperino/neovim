return {
	{
		--
		'lewis6991/gitsigns.nvim',

		tag = 'v0.7',

		config = function()
			require('gitsigns').setup({})
		end,

		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '-' },
				topdelete = { text = '-' },
				changedelete = { text = '~' }
			}
		}
	},

	{
		--
		'tpope/vim-fugitive',

		tag = 'v3.7',

		dependencies = {
			'lewis6991/gitsigns.nvim'
		}
	}
}

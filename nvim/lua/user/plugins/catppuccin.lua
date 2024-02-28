return {
	-- https://github.com/catppuccin/nvim
	'catppuccin/nvim',

	name = 'catppuccin',
	priority = 1000,

	config = function ()
		require('catppuccin').setup()

		-- Pick colorscheme
		vim.cmd.colorscheme 'catppuccin'
	end
}


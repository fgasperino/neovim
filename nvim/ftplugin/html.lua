-- Treesitter support for HTML files

-- Enable treesitter highlighting
vim.treesitter.start()

-- Enable treesitter indentation
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

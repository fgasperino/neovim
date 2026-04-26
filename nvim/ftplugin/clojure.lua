-- Treesitter support for Clojure files

-- Enable treesitter highlighting
vim.treesitter.start()

-- Enable treesitter indentation
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Treesitter folding
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Start with all folds open
vim.opt_local.foldenable = false

--
-- autocmds.lua
--

-- Highlight yank selections.
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = {'*'},
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- LSP format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {"*.edn", "*.clj", "*.cljc", "*.cljs"},
  group = vim.api.nvim_create_augroup('LSPFormat', {}),
  callback = function()
    vim.lsp.buf.format({ async = false})
  end
})

-- Strip all trailing whitespace on save.
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {"*"},
  group = vim.api.nvim_create_augroup('RemoveTrailingWhitespace', { clear = true}),
  command = [[:%s/\s\+$//e]]
})


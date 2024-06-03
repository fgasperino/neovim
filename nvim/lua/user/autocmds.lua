--
-- autocmds.lua
--

-- Highlight yank selections.
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = { '*' },
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

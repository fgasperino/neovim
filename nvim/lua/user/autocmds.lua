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

-- Relative line numbers. Often these get lost..
vim.api.nvim_create_autocmd('BufAdd', {
    callback = function(ev)
        vim.opt.nu = true
        vim.opt.relativenumber = true
    end
})

-- Absolute line numbers in Diffview buffers.
vim.api.nvim_create_autocmd({ "BufNew", "BufAdd", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("DiffviewLineNumberFix", { clear = true }),
  callback = function()
    -- Check if it's a diff buffer AND has 'nowrite' buftype
    if vim.opt_local.diff:get() and vim.opt_local.buftype:get() == "nowrite" then
      vim.opt_local.number = true
      vim.opt_local.relativenumber = false
    end
  end,
})

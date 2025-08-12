--
-- Settings for post-theme plugin overrides.
--

-- Ensure the current line number is visually distinct from
-- relative line number peers.
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'grey' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'grey' })

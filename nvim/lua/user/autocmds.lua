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

-- LSP attach to buffers 
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true})
        end
    end,
})

-- Relative line numbers. Often these get lost..
vim.api.nvim_create_autocmd('BufAdd', {
    callback = function(ev)
        vim.opt.nu = true
        vim.opt.relativenumber = true
    end
})


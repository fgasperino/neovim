vim.lsp.enable({
    "lua_ls",
    "clojure_ls",
    "html_ls",
    "ts_ls",
    "svelte_ls"
})

vim.diagnostic.config({
    --virtual_lines = { current_line = true },
    virtual_lines = false,
    virtual_text = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),

    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local km = vim.keymap
        local buf = vim.lsp.buf

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = args.buf,

                callback = function()
                    vim.lsp.buf.format({
                        async = false,
                        bufnr = args.buf,
                        id = client.id,
                        timeout_ms = 1000
                    })
                end,
            })
        end

        km.set('n', '<leader>lrf', buf.format, { desc = 'Format buffer (LSP)' })
        km.set('n', '<leader>lrr', buf.rename, { desc = 'Rename reference (LSP)' })
        km.set('n', '<leader>lrc', buf.code_action, { desc = 'Code Actions (LSP)' })
        km.set('n', '<leader>lrs', [[:%s/\s\+$//e<cr>]], { desc = 'Strip trailing whitespaces' })

        km.set('n', '<leader>lgd', buf.definition, { desc = 'Goto Definition (LSP)' })
        km.set('n', '<leader>lgi', buf.implementation, { desc = 'Goto Implementation (LSP)' })

        km.set('n', '<leader>lk', buf.hover, { desc = 'Hover Documentation (LSP)' })
    end,
})

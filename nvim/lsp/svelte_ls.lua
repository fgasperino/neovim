return {
    cmd = {
        vim.fn.stdpath('data') .. '/mason/bin/svelteserver',
        '--stdio'
    },

    filetypes = { 'svelte' },

    root_dir = vim.fs.dirname(vim.fs.find({ 'package.json', '.git' }, {
        upward = true,
        path = vim.api.nvim_buf_get_name(0),
    })[1]) or vim.fn.getcwd(),

    settings = {
        svelte = {
            enableTsPlugin = true
        },
    },

    -- keep the Svelte LSP in sync when .ts/.js files change
    on_attach = function(client, bufnr)
        -- Notify Svelte server when TypeScript/JS files change
        vim.api.nvim_create_autocmd('BufWritePost', {
            group = vim.api.nvim_create_augroup('SvelteTSNotify', { clear = true }),
            pattern = { '*.js', '*.ts', '*.mts', '*.cts' },
            callback = function(ctx)
                if client.server_capabilities.workspaceDidChangeWatchedFiles then
                    client.notify('$/onDidChangeTsOrJsFile', {
                        uri = vim.uri_from_bufnr(ctx.buf),
                    })
                end
            end,
        })
    end,
}

return {
    -- Mason installs this as 'vscode-html-language-server'
    cmd = {
        vim.fn.stdpath('data') .. '/mason/bin/vscode-html-language-server',
        '--stdio'
    },

    filetypes = {
        'html',
        -- Attaches to Svelte for <template> or plain HTML (non-<style>/<script>)
        'svelte',
    },

    root_dir = vim.fs.dirname(vim.fs.find({
        'package.json',
        '.git',
        'index.html', -- Fallback for static sites
    }, {
        upward = true,
        path = vim.api.nvim_buf_get_name(0),
    })[1]) or vim.fn.getcwd(),

    -- Enable linting (validation) and completions (including Emmet)
    settings = {
        html = {
            validate = {
                enable = true, -- Full linting: tags, attributes, scripts, accessibility
            },
            format = {
                enable = true, -- Auto-format on save (if you want it)
            },
            hover = {
                documentation = true, -- Hover docs for tags/attributes
            },
            completion = {
                attributeDefaultValue = 'on',
                autoClosingTags = true, -- Auto-close tags
            },
            -- Emmet integration (huge for completions: type 'ul>li' + Tab)
            emmet = {
                enable = true,
            },
        },
    },

    on_attach = function(client, bufnr)
        -- Disable if another LSP (e.g., Svelte) is already handling HTML in Svelte files
        if vim.bo[bufnr].filetype == 'svelte' then
            -- Let Svelte take priority for .svelte files
            client.stop()
        end
    end,
}

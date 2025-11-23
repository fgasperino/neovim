return {
    -- npx works great and will always pick the project-local version
    cmd = { 'npx', 'typescript-language-server', '--stdio' },

    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',

        -- optional but nice: also attach to .svelte files so TS works inside <script lang="ts">
        'svelte',
    },

    root_dir = vim.fs.dirname(vim.fs.find({
        'package.json',
        'jsconfig.json',
        'tsconfig.json',
        '.git',
    }, {
        upward = true,
        path = vim.api.nvim_buf_get_name(0),
    })[1]) or vim.fn.getcwd(),

    -- Optional but extremely useful for Svelte 5 projects
    init_options = {
        plugins = {
            {
                name = 'typescript-svelte-plugin',
                location = vim.fn.expand('~/.config/npm/global/node_modules/typescript-svelte-plugin'),
                -- If you installed it locally in the project (recommended), you can omit location:
                -- location = nil,
            },
        },
    },

    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
}

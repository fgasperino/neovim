return {
    cmd = {
        "clojure-lsp",
    },
    filetypes = {
        "clojure",
        "edn"
    },

    root_dir = vim.fs.dirname(vim.fs.find({
        'project.clj',
        'deps.edn',
        'build.boot',
        'shadow-cljs.edn',
        'bb.edn',
        '.git', -- fallback for git-based projects
    }, {
        upward = true,
        path = vim.api.nvim_buf_get_name(0),
    })[1]) or vim.fn.getcwd(),

    settings = {
        clojure_lsp = {
            diagnostics = {
                enabled = true,
            },
        },
    },

    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}

return {
    cmd = {
        "clojure-lsp",
    },
    filetypes = {
        "clojure",
        "edn"
    },

    root_markers = {
        'project.clj',
        'deps.edn',
        'build.boot',
        'shadow-cljs.edn',
        'bb.edn',
        '.git', -- fallback for git-based projects
    },

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

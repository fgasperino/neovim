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
        '.git',
        'bb.edn'
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

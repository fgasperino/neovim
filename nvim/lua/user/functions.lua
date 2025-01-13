
local M = {}

M.required_lsp_servers = function()
    return {'lua_ls', 'clojure_lsp'}
end

M.completion_engines = function()
    return {'nvim_lsp', 'buffer'}
end

return M


local function find_shadow_builds(opts)

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local config_path = vim.fn.findfile("shadow-cljs.edn", ".;")

    if config_path == "" then
        vim.notify("shadow-cljs.edn not found", vim.log.levels.WARN)
        return
    end

    local script = string.format([[
                                 (require 'clojure.edn)
                                 (let [config (clojure.edn/read-string (slurp "%s"))]
                                   (doseq [build (keys (:builds config))]
                                     (println (name build))))
                                 ]], config_path)

    local command = {
        "bb",
        "-e",
        script
    }

    opts = opts or {}

    pickers.new(opts, {
        prompt_title = "ClojureScript Builds",
        finder = finders.new_async_job({
            command_generator = function() return command end,
            entry_maker = function(line)
                return { value = line, display = line, ordinal = line }
            end
        }),
        sorter = conf.generic_sorter(opts),
        previewer = false,
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd("ConjureShadowSelect " .. selection.value)
            end)
            return true
        end
    }):find()
end

local M = {}

M.setup = function()
    vim.keymap.set('n', '<leader>cssb', find_shadow_builds, { desc = 'Connect to clojurescript build (shadow-cljs)'})
    vim.keymap.set('n', '<leader>crn', "", { desc = 'Refresh all namespaces (Clojure)'})
end

return M

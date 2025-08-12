--
-- telescope.lua 
--

-- Function to perform fuzzy find grep on working directory.
local live_grep_glob = function(opts)
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local make_entry = require "telescope.make_entry"
    local conf = require "telescope.config".values

    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local finder = finders.new_async_job {
        command_generator = function(prompt)
            if not prompt or prompt == "" then
                return nil
            end

            local pieces = vim.split(prompt, "  ")
            local args = {"rg"}

            if pieces[1] then
                table.insert(args, "-e")
                table.insert(args, pieces[1])
            end

            if pieces[2] then
                table.insert(args, "-g")
                table.insert(args, pieces[2])
            end

            return vim.tbl_flatten {
                args,
                {"--color=never",
                 "--no-heading",
                 "--with-filename",
                 "--line-number",
                 "--column",
                 "--smart-case"}
            }
        end,

        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    }

    pickers.new(opts, {
        debounce = 250,
        prompt_title = "Live Grep (*Glob*)",
        finder = finder,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty()
    }):find()
end

-- Function to perform fuzzy find on current buffer.
local buffer_fuzzy_find = function() 
    local tb = require('telescope.builtin')
    local tt = require('telescope.themes')

    tb.current_buffer_fuzzy_find(tt.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end

return {
    -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/which-key.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end
        },
        'debugloop/telescope-undo.nvim',
    },


    config = function()
        local t = require('telescope')
        local tb = require('telescope.builtin')

        t.setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case'
                },
                undo = {
                    side_by_side = true,
                    layout_strategy = 'vertical',
                    layout_config = {
                        preview_height = 0.8
                    }
                },
            }
        })

        t.load_extension('fzf')
        t.load_extension('undo')

        local km = vim.keymap

        km.set('n', '<leader>ff', tb.find_files, { desc = 'Find Files (Telescope)'})
        km.set('n', '<leader>fr', tb.oldfiles, { desc = 'Find Recent Files (Telescope)'})
        km.set('n', '<leader>fb', tb.buffers, { desc = 'Find Buffers (Telescope)'})
        km.set('n', '<leader>fh', tb.help_tags, { desc = 'Find Help (Telescope)'})
        km.set('n', '<leader>fs', tb.grep_string, { desc = 'Find - Grep String (Telescope)'})

        km.set('n', '<leader>u', '<cmd>Telescope undo<cr>', { desc = 'Toggle undo tree (Telescope)' })

        km.set('n', '<leader>/', buffer_fuzzy_find, { desc = 'Find in Buffer (Telescope)' })
        km.set('n', '<leader>f/', live_grep_glob, { desc = 'Find - Grep Live (*glob*) (Telescope Extension)'})
    end
}

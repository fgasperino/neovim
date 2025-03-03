return {
    -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',

    tag = '0.1.8',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/which-key.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end
        }
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
                }
            }
        })

        t.load_extension('fzf')

        local km = vim.keymap

        km.set('n', '<leader>ff', tb.find_files, { desc = 'Find Files (Telescope)'})
        km.set('n', '<leader>fr', tb.oldfiles, { desc = 'Find Recent Files (Telescope)'})
        km.set('n', '<leader>fb', tb.buffers, { desc = 'Find Buffers (Telescope)'})
        km.set('n', '<leader>fgs', tb.grep_string, { desc = 'Find - Grep String (Telescope)'})
        km.set('n', '<leader>fgl', tb.live_grep, { desc = 'Find - Grep Live (Telescope)'})

        km.set('n', '<leader>fgc', '<cmd>:Telescope git_commits<cr>', { desc = 'Commits (fuzzy)' })
        km.set('n', '<leader>fgf', '<cmd>:Telescope git_files<cr>', { desc = 'Files (fuzzy)' })
        km.set('n', '<leader>fgb', '<cmd>:Telescope git_branches<cr>', { desc = 'Branches (fuzzy)' })
        km.set('n', '<leader>fgs', '<cmd>:Telescope git_status<cr>', { desc = 'Status (fuzzy)' })

        km.set('n', '<leader>/', function()
            tb.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = 'Find in Buffer (Telescope)' })
    end
}

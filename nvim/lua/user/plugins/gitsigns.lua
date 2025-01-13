return {

    -- https://github.com/lewis6991/gitsigns.nvim 
    'lewis6991/gitsigns.nvim',

    tag = 'v0.9.0',

    config = function()
        require('gitsigns').setup({
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '-' },
                topdelete = { text = '-' },
                changedelete = { text = '~' }
            },

            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function km(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                km('n', '<C-]>', function()
                    if vim.wo.diff then
                        return '<leader>gnh'
                    end

                    vim.schedule(function() gs.next_hunk() end)

                    return '<Ignore>'
                end, { expr = true, desc = 'Go To Next Hunk (Git Signs)' })

                km('n', '<C-[>', function()
                    if vim.wo.diff then
                        return '<leader>gph'
                    end

                    vim.schedule(function() gs.prev_hunk() end)

                    return '<Ignore>'
                end, { expr = true, desc = 'Go To Prev Hunk (Git Signs)' })

                -- Actions
                km('n', '<leader>gsh', gs.stage_hunk, { desc = 'Stage Hunk (Git Signs)' })
                km('n', '<leader>grh', gs.reset_hunk, { desc = 'Reset Hunk (Git Signs)' })
                km('n', '<leader>gsb', gs.stage_buffer, { desc = 'Stage Buffer (Git Signs)' })
                km('n', '<leader>gush', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk (Git Signs)' })
                km('n', '<leader>grb', gs.reset_buffer, { desc = 'Reset Buffer (Git Signs)' })
                km('n', '<leader>gph', gs.preview_hunk, { desc = 'Preview Hunk (Git Signs)' })
                km('n', '<leader>gbl', function() gs.blame_line { full = true } end, { desc = 'Blame Line (Git Signs)' })
                km('n', '<leader>gb', gs.toggle_current_line_blame, { desc = 'Toggle Blame Line (Git Signs)' })

                -- Text object
                km('v', 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Hunk (Git Signs)'})
            end
        })
    end
}

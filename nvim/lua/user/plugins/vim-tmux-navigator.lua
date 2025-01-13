return {
    -- https://github.com/christoomey/vim-tmux-navigator
    'christoomey/vim-tmux-navigator',

    tag = 'v1.0',

    cmd = {
        'TmuxNavigateLeft',
        'TmuxNavigateDown',
        'TmuxNavigateUp',
        'TmuxNavigateRight',
        'TmuxNavigatePrevious',
    },
    keys = {
        { '<C-h>',  '<cmd><C-U>TmuxNavigateLeft<cr>' },
        { '<C-j>',  '<cmd><C-U>TmuxNavigateDown<cr>' },
        { '<C-k>',  '<cmd><C-U>TmuxNavigateUp<cr>' },
        { '<C-l>',  '<cmd><C-U>TmuxNavigateRight<cr>' },
        { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
}

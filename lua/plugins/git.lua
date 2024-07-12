return {
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = function()
            require('gitsigns').setup({
                signs                        = {
                    add          = { text = '┃' },
                    change       = { text = '┃' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir                 = {
                    interval = 1000,
                    follow_files = true
                },
                auto_attach                  = true,
                attach_to_untracked          = true,
                current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 500,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                },
                current_line_blame_formatter = '<author> (<author_time:%Y-%m-%d %H:%M>)',
                sign_priority                = 6,
                update_debounce              = 300,
                status_formatter             = nil, -- Use default
                max_file_length              = 40000,
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
            })
        end
    },
    {
        'sindrets/diffview.nvim',
        lazy = true,
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('diffview').setup({})
        end
    },
}

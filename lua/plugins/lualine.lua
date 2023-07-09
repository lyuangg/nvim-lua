local nvim_tree_shift = {
    function()
        len = vim.api.nvim_win_get_width(require('nvim-tree.view').get_winnr()) - 1
        title = "Nvim-Tree"
        left = (len - #title) / 2
        right = len - left - #title

        return string.rep(' ', left) .. title .. string.rep(' ', right)
    end,
    cond = require('nvim-tree.view').is_visible,
    color = 'Normal'
}

vim.api.nvim_create_autocmd({ "ChanOpen", "BufEnter" }, {
    callback = function()
        local bsize = vim.api.nvim_eval("len(getbufinfo({'buflisted':1}))")

        if bsize > 1 then
            vim.o.showtabline = 2
            return
        end
        vim.cmd("set showtabline=1")
    end
})

return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto', -- based on current vim colorscheme
                -- not a big fan of fancy triangle separators
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {},
                ignore_focus = { 'NvimTree', 'aerial', 'TelescopePrompt' },
                always_divide_middle = true,
            },
            sections = {
                -- left
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                    { 'b:gitsigns_blame_line', icon = '' } },
                -- right
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress'},
                lualine_z = { 'location', 'selectioncount', 'searchcount' }
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'filetype' },
                lualine_z = { 'location' }
            },
            tabline = {
                lualine_a = {
                    nvim_tree_shift,
                    {
                        'buffers',
                        show_filename_only = true,
                        hide_filename_extension = false,
                        show_modified_status = true,
                        mode = 2, -- 0: Shows buffer name
                        -- 1: Shows buffer index
                        -- 2: Shows buffer name + buffer index
                        -- 3: Shows buffer number
                        -- 4: Shows buffer name + buffer number
                        -- max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                                                -- it can also be a function that returns
                                                -- the value of `max_length` dynamically.
                        max_length = function() return vim.go.columns end,
                        filetype_names = {
                            TelescopePrompt = '[Telescope]',
                            dashboard = '[Dashboard]',
                            packer = '[Packer]',
                            fzf = '[FZF]',
                            aerial = '[OUTLINE]',
                            NvimTree = '[Files]',
                            qf = '[QuickFix]',
                        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
                        symbols = {
                            modified = ' ●',   -- Text to show when the buffer is modified
                            -- alternate_file = '#', -- Text to show to identify the alternate file
                            alternate_file = '', -- Text to show to identify the alternate file
                            directory = '',   -- Text to show when the buffer is a directory
                        },
                    },
                },
                lualine_b = { 'diagnostics' },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        'tabs',
                        component_separators = { left = "", right = "" },
                        section_separators = { left = "", right = "" },
                    }
                }
            },
            extensions = { 'aerial', 'nvim-tree', 'quickfix', 'nvim-dap-ui', 'man' }
        })
    end
}
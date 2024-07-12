return {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto', -- based on current vim colorscheme
                -- theme = 'gruvbox', -- based on current vim colorscheme
                -- not a big fan of fancy triangle separators
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {},
                -- ignore_focus = { 'NvimTree', 'aerial', 'TelescopePrompt' },
                ignore_focus = { 'aerial', 'TelescopePrompt' },
                always_divide_middle = true,
                globalstatus = true,
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
                    { 'b:gitsigns_blame_line', icon = '' },
                    function()
                        return vim.fn["codeium#GetStatusString"]()
                    end
                },
                -- right
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location', 'selectioncount', 'searchcount' },
                -- lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = { { 'filename', path = 3 } },
                -- lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            extensions = { 'aerial', 'nvim-tree', 'quickfix', 'nvim-dap-ui', 'man', 'trouble' }
        })
    end
}

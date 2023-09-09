return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup{
            options = {
                -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                numbers = "ordinal",
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    -- style = 'icon' | 'underline' | 'none',
                    style = 'icon',
                },
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align =  "center",
                        separator = true,
                    }
                },
                color_icons = true, -- whether or not to add the filetype icon highlights
                always_show_bufferline = false,
                max_name_length = 18,
                max_prefix_length = 10, -- prefix used when a buffer is de-duplicated
                truncate_names = true, -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = false,
                diagnostics_update_in_insert = false,
            },
        }
    end
}

return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        cmd = { 'ToggleTermToggleAll', 'ToggleTerm', 'ToggleTermSendCurrentLine', 'ToggleTermSendVisualLines', 'ToggleTermSendVisualSelection' },
        config = true,
        opts = {
            open_mapping = [[<c-\>]],
        },
        keys = function()
            local lazygit = require("toggleterm.terminal").Terminal:new({
                cmd = "lazygit",
                hidden = true,
                direction = "float",
                close_on_exit = true,
            })
            local ranger = require("toggleterm.terminal").Terminal:new({
                cmd = "ranger",
                hidden = true,
                direction = "float",
                close_on_exit = true,
            })
            return {
                { "<C-\\>", "<Cmd>ToggleTerm<CR>", mode = "n", desc = "Open Terminal" },
                {
                    "<leader>rg",
                    function()
                        ranger:toggle()
                    end,
                    desc = "Ranger",
                },
                {
                    "<leader>gg",
                    function()
                        lazygit:toggle()
                    end,
                    desc = "LazyGit",
                },
            }
        end
    },
    {
        "willothy/flatten.nvim",
        config = true,
        -- or pass configuration with
        opts = {
            nest_if_no_args = true,
            window = {
                open = "alternate",
            },
        },
    },
}

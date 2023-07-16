return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {'mhinz/vim-startify'},
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
          -- load the colorscheme here
          vim.cmd([[colorscheme gruvbox]])
        end,
    },

    -- comment
    {
        'terrortylor/nvim-comment',
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = function()
            require('nvim_comment').setup({
                marker_padding = true, -- 空格
                comment_empty = false, -- 空行
                -- line_mapping = "<leader>/",
                operator_mapping = "<leader>/",
            })
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        lazy = true,
        event = "BufReadPost",
        config = function ()
            require("indent_blankline").setup ({})
        end
    },
    {
        'tpope/vim-repeat',
    },
    {
        'folke/flash.nvim',
        event = "VeryLazy",
        config = function ()
            require('flash').setup({})
        end
    },
    {
        "folke/todo-comments.nvim",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "gbprod/substitute.nvim",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("substitute").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            })
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'numToStr/Navigator.nvim',
        cmd = { 'NavigatorUp', 'NavigatorDown', 'NavigatorLeft', 'NavigatorRight'},
        config = function()
            require('Navigator').setup()
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        cmd = 'ColorizerToggle',
        config = function()
            require("colorizer").setup({
                "css";
                "html";
                "vue";
                "php";
            })
        end
    },
    {
        'mg979/vim-visual-multi',
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        init = function()
            vim.cmd([[
            let g:VM_maps                       = {}
            let g:VM_maps["Select Cursor Down"] = '<M-j>'   
            let g:VM_maps["Select Cursor Up"]   = '<M-k>'     
            ]])
        end
    },
    {
        'j-hui/fidget.nvim',
        lazy = true,
        branch = "legacy",
        event = "LspAttach",
        config = function ()
            require("fidget").setup({
                window = { blend = 0 },
                sources = {
                    ["null-ls"] = { ignore = true },
                },
                fmt = {
                    max_messages = 3, -- The maximum number of messages stacked at any give time
                },
            })
        end
    }
}

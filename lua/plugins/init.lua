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
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "gbprod/substitute.nvim",
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
        init = function()
            vim.cmd([[
            let g:VM_maps                       = {}
            let g:VM_maps["Select Cursor Down"] = '<M-j>'   
            let g:VM_maps["Select Cursor Up"]   = '<M-k>'     
            ]])
        end
    }
}
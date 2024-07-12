return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { 'mhinz/vim-startify' },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme gruvbox]])
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme nightfox]])
            if vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
                vim.cmd([[colorscheme nightfox]])
            end
        end,
    }, -- lazy
    -- {
    --     'lukas-reineke/indent-blankline.nvim',
    --     lazy = true,
    --     event = "BufReadPost",
    --     main = "ibl",
    --     opts = {
    --         indent = { char = "┆" },
    --         scope = {
    --             show_start = false,
    --             highlight = { "Identifier" },
    --         },
    --     },
    -- },
    {
        'folke/flash.nvim',
        event = "VeryLazy",
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
        config = function()
            require('flash').setup({
                label = {
                    uppercase = false,
                },
                modes = {
                    search = {
                        enabled = false
                    },
                    char = {
                        enabled = false
                    }
                }
            })
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
        cmd = { 'NavigatorUp', 'NavigatorDown', 'NavigatorLeft', 'NavigatorRight' },
        config = function()
            require('Navigator').setup()
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        cmd = 'ColorizerToggle',
        config = function()
            require("colorizer").setup({
                "css",
                "html",
                "vue",
                "php",
            })
        end
    },
    {
        'j-hui/fidget.nvim',
        lazy = true,
        branch = "legacy",
        event = "LspAttach",
        config = function()
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
    },
    {
        'ethanholz/nvim-lastplace',
        config = function()
            require('nvim-lastplace').setup({})
        end
    },
    {
        'famiu/bufdelete.nvim',
    },
    {
        "numtostr/BufOnly.nvim",
        cmd = 'BufOnly',
    },
    {
        'michaeljsmith/vim-indent-object',
    },
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    go = { "goimports", "gofumpt" },
                    -- Use a sub-list to run only the first available formatter
                    javascript = { { "prettierd", "prettier" } },
                    -- php = { "phpcbf --standard=PSR12" },
                },
                -- If this is set, Conform will run the formatter on save.
                -- It will pass the table to conform.format().
                -- This can also be a function that returns the table.
                format_on_save = {
                    -- I recommend these options. See :help conform.format for details.
                    lsp_fallback = true,
                    timeout_ms = 500,
                },
                -- If this is set, Conform will run the formatter asynchronously after save.
                -- It will pass the table to conform.format().
                -- This can also be a function that returns the table.
                format_after_save = {
                    lsp_fallback = true,
                },
            })
        end
    },
    {
        "johmsalas/text-case.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("textcase").setup({})
            require("telescope").load_extension("textcase")
        end,
        keys = {
            "ga", -- Default invocation prefix
            { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
        },
        cmd = {
            -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
            "Subs",
            "TextCaseOpenTelescope",
            "TextCaseOpenTelescopeQuickChange",
            "TextCaseOpenTelescopeLSPChange",
            "TextCaseStartReplacingCommand",
        },
        -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
        -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
        -- available after the first executing of it or after a keymap of text-case.nvim has been used.
        lazy = false,
    },
}

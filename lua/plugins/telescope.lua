return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
	cmd = "Telescope",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim',
        'smartpde/telescope-recent-files',
    },
    config = function ()
        local lga_actions = require("telescope-live-grep-args.actions")
        require("telescope").setup({
            defaults = {
            },
            pickers = {
                find_files = {
                    layout_strategy = 'vertical',
                    previewer = false,
                }
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = { -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    }
                },
                recent_files = {
                    previewer = false,
                }
            },

        })
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("notify")
        require("telescope").load_extension("recent_files")
    end
}

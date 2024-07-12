return {
    'epwalsh/obsidian.nvim',
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "yuan",
                path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/yuan",
            },
        },
        ui = {
            enable = false,
        },
        -- see below for full list of options 👇
    },
}

return {
    'epwalsh/obsidian.nvim',
    config = function ()
        require("obsidian").setup({
            dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/yuan",
            open_app_foreground = true,
            completion = {
                nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
            },
            disable_frontmatter = true
        })
    end
}
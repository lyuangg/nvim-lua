return {
    'olexsmir/gopher.nvim',
    cmd = { 'GoTagAdd', 'GoTagRm', 'GoMod', 'GoImpl', 'GoCmt', 'GoGet'},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("gopher").setup {
            commands = {
                go = "go",
                gomodifytags = "gomodifytags",
                gotests = "gotests",
                impl = "impl",
                iferr = "iferr",
            },
        }
    end
}

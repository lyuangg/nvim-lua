return {
    'folke/trouble.nvim',
    lazy = true,
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xd",
            "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>oo",
            "<cmd>Trouble lsp_document_symbols toggle<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle focus=true<cr>",
            desc = "Quickfix List (Trouble)",
        },
        {
            "gR",
            "<cmd>Trouble lsp_references focus=true<cr>",
            desc = "lsp_references (Trouble)",
        },
        {
            "gI",
            "<cmd>Trouble lsp_implementations focus=true<cr>",
            desc = "lsp_implementations (Trouble)",
        },
    },
    opts = {
        modes = {
            lsp_document_symbols = {
                desc = "document symbols",
                mode = "lsp_document_symbols",
                focus = true,
                win = { position = "right", size = { width = 0.25 } },
                filter = {
                    -- remove Package since luals uses it for control flow structures
                    ["not"] = { ft = "lua", kind = "Package" },
                    any = {
                        -- all symbol kinds for help / markdown files
                        ft = { "help", "markdown" },
                        -- default set of symbol kinds
                        kind = {
                            "Class",
                            "Constructor",
                            "Enum",
                            "Function",
                            "Interface",
                            "Method",
                            "Module",
                            "Namespace",
                            "Package",
                            "Property",
                            "Struct",
                            "Trait",
                        },
                    },
                },
            },
        },
    },
}

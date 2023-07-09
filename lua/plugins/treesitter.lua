return {
    'nvim-treesitter/nvim-treesitter',
    config = function ()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {"lua", "vim", "c", "javascript", "go", "php", "html", "css", "python", "typescript", "vue", "yaml", "json", "markdown", "markdown_inline"}, -- for installing specific parsers
            sync_install = true, -- install synchronously
            auto_install = false,
            ignore_install = {}, -- parsers to not install
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = {"markdown"}, -- disable standard vim highlighting
            },
            -- matchup = {
            --     enable = true,              -- mandatory, false will disable the whole extension
            -- },
            indent = {
                enable = true,
                disable = {},
            },
            autotag = {
                enable = true,
            }
        }
    end
}
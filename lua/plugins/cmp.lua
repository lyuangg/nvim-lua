return {
    {
        'windwp/nvim-autopairs',
        lazy = true,
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup({})
        end
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-calc',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'windwp/nvim-autopairs',
            'quangnguyen30192/cmp-nvim-tags',
        },
        config = function()
            local lspkind = require('lspkind')
            local luasnip = require 'luasnip'

            -- 加载代码片段 friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp = require 'cmp'
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                preselect = cmp.PreselectMode.None,
                -- 默认选中第一个
                -- completion = {
                --     completeopt = 'menu,menuone,noinsert'
                -- },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            end
                            cmp.confirm()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                    { name = "buffer" },
                    { name = 'path' },
                    { name = 'calc' },
                    { name = 'vim-dadbod-completion' },
                    { name = 'tags' },
                }),

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',  -- show only symbol annotations
                        maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function(entry, vim_item)
                            -- fancy icons and a name of kind
                            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
                            -- set a name for each source
                            vim_item.menu =
                                ({
                                    buffer = "[Buffer]",
                                    nvim_lsp = "[LSP]",
                                    ultisnips = "[UltiSnips]",
                                    nvim_lua = "[Lua]",
                                    cmp_tabnine = "[TabNine]",
                                    look = "[Look]",
                                    path = "[Path]",
                                    spell = "[Spell]",
                                    calc = "[Calc]",
                                    emoji = "[Emoji]",
                                    ['vim-dadbod-completion'] = "[DB]",
                                })[entry.source.name]
                            return vim_item
                        end
                    })
                },
            })

            -- nvim-autopairs
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- nvim-cmp for commands
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    }
}

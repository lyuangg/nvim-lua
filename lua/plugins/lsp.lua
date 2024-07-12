return {
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        event = { "BufReadPre", "BufReadPost", "BufAdd", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            -- 语言服务
            -- 'sumneko_lua'
            -- intelephense
            -- gopls
            local servers = { 'lua_ls', 'pyright', 'tsserver', 'html', 'eslint', 'jsonls', 'cssls', 'lemminx',
                'yamlls', 'emmet_ls', 'marksman', 'intelephense', 'volar', 'bashls', }
            require("mason-lspconfig").setup({
                -- 确保安装，根据需要填写
                ensure_installed = {}
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')

            -- on_attach 高亮
            local on_attach = function(client, bufnr)
                if client.server_capabilities.documentHighlightProvider then
                    vim.cmd [[
                    hi! LspReferenceRead cterm=bold ctermbg=red guibg=Grey
                    hi! LspReferenceText cterm=bold ctermbg=red guibg=Grey
                    hi! LspReferenceWrite cterm=bold ctermbg=red guibg=Grey
                    augroup lsp_document_highlight
                    autocmd! * <buffer>
                    autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd! CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                    autocmd! CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
                    augroup END
                ]]
                end

                vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                    vim.lsp.handlers.hover,
                    { border = 'rounded' }
                )

                -- codelens
                if client.supports_method("textDocument/codeLens", { bufnr = bufnr }) then
                    vim.lsp.codelens.refresh({ bufnr = bufnr })
                    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.codelens.refresh({ bufnr = bufnr })
                        end,
                    })
                end

                -- icon
                local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = " ", Info = " " }
                for type, icon in pairs(signs) do
                    local hl = "DiagnosticSign" .. type
                    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                end

                -- vim.diagnostic.disable()
            end

            vim.lsp.inlay_hint.enable()

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end

            -- require('neodev').setup({})
            require('lspconfig').lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        completion = {
                            callSnippet = "Replace"
                        }
                    }
                }
            }

            -- gopls 配置
            require('lspconfig').gopls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { 'gopls' },
                filetypes = { "go", "gomod" },
                root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
                single_file_support = true,
                settings = {
                    gopls = {
                        -- analyses = {
                        --     -- nilness = true,
                        --     -- unusedparams = true,
                        --     -- unusedwrite = true,
                        --     -- useany = true,
                        -- },
                        -- experimentalPostfixCompletions = true, -- 自动完成
                        gofumpt = true, -- 格式化
                        staticcheck = true,
                        usePlaceholders = true,
                        -- codelenses = {
                        -- test = true,
                        -- generate = true,
                        -- gc_details = true,
                        -- regenerate_cgo = false,
                        -- tidy = true,
                        -- upgrade_dependency = true,
                        -- vendor = true,
                        -- },
                        hints = {
                            -- assignVariableTypes = true,
                            -- compositeLiteralFields = true,
                            -- compositeLiteralTypes = true,
                            constantValues = true,
                            -- functionTypeParameters = true,
                            -- parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
            }

            require('lspconfig').emmet_ls.setup {
                filetypes = { "javascript", "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue" },
            }
        end
    },
    {
        'williamboman/mason.nvim',
        cmd = "Mason",
        config = function()
            require("mason").setup({})
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({})
        end,
    },
    {
        "danymat/neogen",
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    },
}

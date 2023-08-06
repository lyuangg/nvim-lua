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
                'yamlls', 'emmet_ls', 'marksman', 'intelephense', 'volar', 'bashls' }
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

                -- Highlight line number
                -- vim.cmd [[
                -- highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
                -- highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
                -- highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
                -- highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

                -- sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
                -- sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
                -- sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
                -- sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
                -- ]]

                vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                    vim.lsp.handlers.hover,
                    { border = 'rounded' }
                )

                -- vim.diagnostic.disable()
            end

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end

            require('lspconfig').lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
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
                        -- gofumpt = true,                        -- 格式化
                        staticcheck = true,
                        usePlaceholders = true,
                    },
                },
            }


            -- go 文件保存时自动格式化
            -- imports
            -- vim.api.nvim_create_autocmd('BufWritePre', {
            --     pattern = '*.go',
            --     callback = function()
            --         vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
            --     end
            -- })

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
}

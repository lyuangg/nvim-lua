-- filetree
vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFile<cr>', { noremap=true, silent=true })

-- outline
vim.keymap.set('n', '<leader>o', ':AerialOpen<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>oo', ':AerialOpen<cr>', { noremap=true, silent=true })


-- telescope
vim.keymap.set('n', '<leader>ff', function() require'telescope.builtin'.find_files{} end, { noremap=true, silent=true })
vim.keymap.set('n', '<leader>fb', function() require'telescope.builtin'.buffers{previewer=false} end, { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>fg', function() require'telescope.builtin'.live_grep{} end, { noremap=true, silent=true })
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>ft", ":Telescope<CR>")
vim.keymap.set("n", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>")



-- comment
vim.keymap.set("n", '<leader>/', ":CommentToggle<cr>", { noremap = true, silent=true  })

-- git
vim.keymap.set("n", '<leader>gd', ":DiffviewOpen<cr>", {noremap= true, silent=true })
vim.keymap.set("n", '<leader>gh', ":DiffviewFileHistory %<cr>", {noremap= true, silent=true })
vim.keymap.set("n", '<leader>gq', ":DiffviewClose<cr>", {noremap= true, silent=true })
vim.keymap.set("n", '<leader>gH', ":DiffviewFileHistory<cr>", {noremap= true, silent=true })
vim.keymap.set("n", '<leader>gn', ":Gitsigns next_hunk<cr>", {noremap= true, silent=true })
vim.keymap.set("n", '<leader>gp', ":Gitsigns prev_hunk<cr>", {noremap= true, silent=true })
vim.keymap.set("n", '<leader>gg', ":Neogit<cr>", {noremap= true, silent=true })
vim.keymap.set("n", '<leader>gc', ":Neogit commit<cr>", {noremap= true, silent=true })

-- buffer
-- vim.keymap.set('n', '<leader>1', ':LualineBuffersJump! 1<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>2', ':LualineBuffersJump! 2<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>3', ':LualineBuffersJump! 3<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>4', ':LualineBuffersJump! 4<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>5', ':LualineBuffersJump! 5<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>6', ':LualineBuffersJump! 6<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>7', ':LualineBuffersJump! 7<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>8', ':LualineBuffersJump! 8<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>9', ':LualineBuffersJump! 9<cr>', { noremap=true, silent=true })

vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>$', ':BufferLineGoToBuffer -1<cr>', { noremap=true, silent=true })

vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>bl', ':BufferLineCloseLeft<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>bo', ':BufferLineCloseOthers<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>bp', ':BufferLinePick<cr>', { noremap=true, silent=true })

-- startify
vim.keymap.set('n', '<leader>n', ':Startify<cr>', { noremap=true, silent=true })

-- lsp 快捷键
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap=true, silent=true })
vim.keymap.set('n', 'gD', ':rightbelow vsplit | lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, { noremap=true, silent=true })
vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_next, { noremap=true, silent=true })
vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_prev, { noremap=true, silent=true })
vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })

-- obsidian
-- vim.keymap.set(
--   "n",
--   "gf",
--   function()
--     if require('obsidian').util.cursor_on_markdown_link() then
--       return "<cmd>ObsidianFollowLink<CR>"
--     else
--       return "<cmd>lua Open_file('n')<CR>"
--     end
--   end,
--   { noremap = false, expr = true}
-- )
vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<cr>", {noremap= true, silent=true })
vim.keymap.set("n", "<leader>ob", ":ObsidianOpen<cr>", {noremap= true, silent=true })


-- substitute
-- vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true, silent=true  })
-- vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true, silent=true  })
-- vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true, silent=true  })
-- vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true, silent=true  })


-- tmux 快捷键
vim.keymap.set("n", "<c-k>", "<cmd>lua require('Navigator').up()<cr>", { noremap = true, silent=true  })
vim.keymap.set("n", "<c-j>", "<cmd>lua require('Navigator').down()<cr>", { noremap = true, silent=true  })
vim.keymap.set("n", "<c-h>", "<cmd>lua require('Navigator').left()<cr>", { noremap = true, silent=true  })
vim.keymap.set("n", "<c-l>", "<cmd>lua require('Navigator').right()<cr>", { noremap = true, silent=true  })


-- 使用gx命令打开链接
vim.keymap.set("n", "gx", ":lua Open_url('n')<cr>", {noremap= true, silent=true })
vim.keymap.set("x", "gx", ":lua Open_url('v')<cr>", {noremap= true, silent=true })

-- openfile
vim.keymap.set("x", "gf", ":lua Open_file('v')<cr>", {noremap= true, silent=true })

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gI", "<cmd>TroubleToggle lsp_implementations<CR>", {silent = true, noremap = true})


-- toggole lsp
vim.keymap.set("n", "<leader>D", "<cmd>lua Toggle_lsp()<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>R", ":LspRestart<CR>", {silent = true, noremap = true})




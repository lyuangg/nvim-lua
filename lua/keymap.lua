-- filetree
vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFile<cr>', { noremap = true, silent = true })


-- telescope
vim.keymap.set('n', '<leader>ff', function() require 'telescope.builtin'.find_files {} end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', function() require 'telescope.builtin'.buffers { previewer = false } end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bf', function() require 'telescope.builtin'.buffers { previewer = false } end,
    { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>ft", ":Telescope<CR>")
vim.keymap.set('n', '<leader><leader>', function() require 'telescope.builtin'.buffers { previewer = false } end,
    { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bh", ":lua require('telescope').extensions.recent_files.pick()<CR>")


-- git
vim.keymap.set("n", '<leader>gd', ":DiffviewOpen<cr>", { noremap = true, silent = true })
vim.keymap.set("n", '<leader>gh', ":DiffviewFileHistory %<cr>", { noremap = true, silent = true })
vim.keymap.set("n", '<leader>gq', ":DiffviewClose<cr>", { noremap = true, silent = true })
vim.keymap.set("n", '<leader>gH', ":DiffviewFileHistory<cr>", { noremap = true, silent = true })
vim.keymap.set("n", '<leader>gn', ":Gitsigns next_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("n", '<leader>gp', ":Gitsigns prev_hunk<cr>", { noremap = true, silent = true })

-- buffer
vim.keymap.set('n', '<leader>1', ':lua require("bufferline").go_to(1, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', ':lua require("bufferline").go_to(2, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', ':lua require("bufferline").go_to(3, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', ':lua require("bufferline").go_to(4, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', ':lua require("bufferline").go_to(5, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>6', ':lua require("bufferline").go_to(6, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>7', ':lua require("bufferline").go_to(7, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>8', ':lua require("bufferline").go_to(8, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>9', ':lua require("bufferline").go_to(9, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>$', ':lua require("bufferline").go_to(-1, true)<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<cr>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>bl', ':BufferLineCloseLeft<cr>', { noremap=true, silent=true })
-- vim.keymap.set('n', '<leader>bo', ':BufferLineCloseOthers<cr>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>bo', ':BufOnly<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':BufferLinePick<cr>', { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>bx", ":Bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bX", ":lua require('bufdelete').bufdelete(0, true)<CR>", { noremap = true, silent = true })

-- startify
vim.keymap.set('n', '<leader>n', ':Startify<cr>', { noremap = true, silent = true })

-- lsp 快捷键
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gD', ':rightbelow vsplit | lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>I', ":lua GoFormat2()<CR>", { noremap = true, silent = true })

vim.cmd([[
  augroup go_format_mappings
    autocmd!
    autocmd FileType go nnoremap <buffer> <silent> <leader>F :lua GoFormat()<CR>
  augroup END
]])
vim.cmd([[
  augroup php_format_mappings
    autocmd!
    autocmd FileType php nnoremap <buffer> <silent> <leader>F :% !phpcbf --standard=PSR12 -<CR>
  augroup END
]])

vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ob", ":ObsidianOpen<cr>", { noremap = true, silent = true })


-- tmux 快捷键
vim.keymap.set("n", "<c-k>", "<cmd>lua require('Navigator').up()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-j>", "<cmd>lua require('Navigator').down()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-h>", "<cmd>lua require('Navigator').left()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-l>", "<cmd>lua require('Navigator').right()<cr>", { noremap = true, silent = true })


-- 使用gx命令打开链接
vim.keymap.set("n", "gx", ":lua Open_url('n')<cr>", { noremap = true, silent = true })
vim.keymap.set("x", "gx", ":lua Open_url('v')<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "gx", ":sil !open '<c-r><c-a>'<cr>", { noremap = true, silent = true })
-- vim.keymap.set("x", "gx", "\"zy:sil !open '<c-r>z'<cr>", { noremap = true, silent = true })

-- openfile
vim.keymap.set("x", "gf", ":lua Open_file('v')<cr>", { noremap = true, silent = true })


-- toggole lsp
vim.keymap.set("n", "<leader>D", "<cmd>lua Toggle_lsp()<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>R", ":LspRestart<CR>", { silent = true, noremap = true })

-- vim.keymap.set("n", "<leader>y", ":!echo <c-r>% | pbcopy<CR>", { silent = true, noremap = true })
-- vim.keymap.set("n", "<leader>y",
--     ":!/usr/local/bin/php /Users/yuan/code/php/yuan-make-code/gozero/artisan merchant:user <c-r>% <CR>",
--     { silent = true, noremap = true })
vim.keymap.set("n", "<leader>y",
    ":!/usr/local/bin/php /Users/yuan/code/php/yuan-make-code/gozero/artisan merchant:user %:p <CR>",
    { silent = true, noremap = true })

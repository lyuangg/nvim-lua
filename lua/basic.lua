-- 基础
vim.opt.number = true -- 显示行号
vim.opt.relativenumber = true -- 显示相对行号
vim.opt.cursorline = true -- 高亮当前行
vim.opt.wrap = false -- 自动换行
vim.opt.linebreak = true -- 不在单词内换行
vim.opt.wrapmargin = 2 -- 指定折行处与编辑窗口的右边缘之间空出的字符数。
vim.opt.scrolloff = 7 -- 保持在光标上下最少行数
vim.opt.sidescrolloff = 15 -- 水平滚动
vim.opt.laststatus = 2 -- 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
vim.opt.ruler = true -- 在状态栏显示光标的当前位置（位于哪一行哪一列）。

vim.opt.encoding = "utf-8" -- 设置编码为utf-8
vim.opt.syntax = "on" -- 开启语法高亮
vim.cmd("filetype plugin indent on") -- 开启文件类型检查
vim.opt.showmode = true -- 在底部显示当前模式
vim.opt.showcmd = false -- 在底部不显示当前命令
vim.opt.cmdheight = 0 -- 设置命令行高度为0

vim.opt.mouse = "a" -- 启用鼠标
vim.api.nvim_set_keymap("n", "<ScrollWheelUp>", "<C-Y><C-Y>", { noremap = true }) -- 将滚轮向上映射为<C-Y><C-Y>
vim.api.nvim_set_keymap("n", "<ScrollWheelDown>", "<C-E><C-E>", { noremap = true }) -- 将滚轮向下映射为<C-E><C-E>
vim.api.nvim_set_keymap("n", "<C-ScrollWheelDown>", "2zl", { noremap = true }) -- 将Ctrl+滚轮向下映射为zl
vim.api.nvim_set_keymap("n", "<C-ScrollWheelUp>", "2zh", { noremap = true }) -- 将Ctrl+滚轮向上映射为zh
vim.opt.updatetime = 100 -- 设置更新时间为100ms
vim.opt.hidden = true -- 取消未保存打开新buffer的限制
vim.opt.clipboard = "unnamedplus,unnamed" -- 设置剪切板

vim.opt.list = true -- 显示不可见字符
vim.opt.listchars = {
  tab = ">~", -- Tab字符
  trail = ".", -- 行尾空格
} -- 设置不可见字符的显示方式

-- 真彩色支持
if vim.fn.has("termguicolors") == 1 then
  if vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
    vim.opt.termguicolors = true
  end
end

-- 缩进
vim.opt.shiftwidth = 4 -- 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数。
vim.opt.tabstop = 4 -- 按下 Tab 键时，Vim 显示的空格数
vim.opt.softtabstop = 4 -- Tab 转为多少个空格。
vim.opt.expandtab = true -- tab 转换为空格
vim.opt.autoindent = true -- 自动缩进
vim.opt.smartindent = true -- 智能缩进
vim.opt.shiftround = true -- 复制缩进空格问题

-- 搜索
vim.opt.hlsearch = true -- 搜索高亮
vim.opt.incsearch = true -- 搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
vim.opt.ignorecase = true -- 搜索时忽略大小写。
vim.opt.smartcase = true -- 只有一个大写字母的搜索词，将大小写敏感
vim.opt.grepprg = "grep -rn $* --exclude-dir=.git" -- grep 设置
vim.opt.path:append("**") -- 设置文件搜索路径
vim.opt.suffixesadd:append(".php", ".js", ".vue", ".css", ".go") -- 设置文件搜索后缀

vim.api.nvim_set_keymap("x", "*", [[:<C-u>call VSetSearch('/')<CR>/<C-R>=@/<CR><CR>]], { noremap = true, silent = true }) -- 映射*为Visual模式下的搜索/
vim.api.nvim_set_keymap("x", "#", [[:<C-u>call VSetSearch('?')<CR>?<C-R>=@/<CR><CR>]], { noremap = true, silent = true }) -- 映射#为Visual模式下的搜索?
 
function VSetSearch(cmdtype)
  local temp = vim.fn.getreg("s")
  vim.cmd("normal! gv\"sy")
  local search_str = '\\V' .. vim.fn.substitute(vim.fn.escape(vim.fn.getreg("s"), cmdtype..'\\'), '\n', '\\n', 'g')
  vim.fn.setreg('/', search_str)
  vim.fn.setreg("s", temp)
end

-- 编辑
vim.opt.writebackup = false -- 不备份
vim.opt.swapfile = false -- 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp。
vim.opt.undofile = true -- 保留撤销历史。
vim.opt.backupdir = "/Users/yuan/.vim/.backup//" -- 设置备份文件的保存位置
vim.opt.directory = "/Users/yuan/.vim/.swp//" -- 设置交换文件的保存位置
vim.opt.undodir = "/users/yuan/.vim/.undo//" -- 设置操作历史文件的保存位置
vim.opt.errorbells = false -- 出错时，不要发出响声
vim.opt.visualbell = true -- 出错时，发出视觉提示，通常是屏幕闪烁。
vim.opt.history = 1000 -- 记住多少次历史操作
vim.opt.autoread = true -- 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。

-- 取消自动添加注释行
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")


-- 快捷键
vim.g.mapleader = " " -- 设置mapleader为空格
vim.api.nvim_set_keymap("n", "<Leader>,", "$a,<ESC>", { noremap = true, silent = true }) -- 映射<Leader>,为$a,<ESC>
vim.api.nvim_set_keymap("n", "<Leader>;", "$a;<ESC>", { noremap = true, silent = true }) -- 映射<Leader>;为$a;<ESC>
vim.api.nvim_set_keymap("n", "<Leader>h", ":noh<CR>", { noremap = true, silent = true }) -- 映射<Leader>h为:noh<CR>

-- 移动
vim.api.nvim_set_keymap("i", "<C-f>", "<Right>", { noremap = true, silent = true }) -- 映射<C-f>为<Right>
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true }) -- 映射j为gj
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true }) -- 映射k为gk
vim.api.nvim_set_keymap("n", "0", "g0", { noremap = true, silent = true }) -- 映射0为g0
vim.api.nvim_set_keymap("n", "$", "g$", { noremap = true, silent = true }) -- 映射$为g$
vim.api.nvim_set_keymap("n", "^", "g^", { noremap = true, silent = true }) -- 映射^为g^
vim.api.nvim_set_keymap("n", "H", "^", { noremap = true, silent = true }) -- 映射H为^
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true, silent = true }) -- 映射L为$
 
-- 命令行
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", { noremap = true, silent = true }) -- 映射<C-a>为<Home>
 
-- terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true }) -- 映射<Esc>为<C-\><C-n>
vim.api.nvim_set_keymap("n", "<Leader>T", ":belowright split term://zsh<CR>", { noremap = true, silent = true }) -- 映射<Leader>T为:belowright split term://zsh<CR>
 
-- quit
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true }) -- 映射<Leader>q为:q<CR>
vim.api.nvim_set_keymap("n", "<Leader>Q", ":qall!<CR>", { noremap = true, silent = true }) -- 映射<Leader>Q为:qall!<CR>
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true }) -- 映射<Leader>w为:w<CR>
 
-- esc
vim.api.nvim_set_keymap("i", "jj", "<esc>", { noremap = true, silent = true }) -- 映射jj为<esc>

-- buffers
vim.api.nvim_set_keymap("n", "<Leader>x", ":bp<CR>:bd #<CR>", { noremap = true, silent = true }) -- 映射<Leader>x为:bp<CR>:bd #<CR>
vim.api.nvim_set_keymap("n", "<Leader>X", ":bd!<CR>", { noremap = true, silent = true }) -- 映射<Leader>X为:bd!<CR>
vim.api.nvim_set_keymap("n", "<Leader>bb", "<C-6>", { noremap = true, silent = true }) -- 映射<Leader>bb为<C-6>
vim.api.nvim_set_keymap("n", "<Leader>bo", ":%bd<CR>:e#<CR>:bd#<CR>", { noremap = true, silent = true }) -- 映射<Leader>bo为:%bd<CR>:e#<CR>:bd#<CR>
vim.api.nvim_set_keymap("n", "<Leader>bn", ":ene<CR>", { noremap = true, silent = true }) -- 映射<Leader>bn为:ene<CR>
vim.api.nvim_set_keymap("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true }) -- 映射<Tab>为:bn<CR>
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true }) -- 映射<S-Tab>为:bp<CR>



-- startify
local ascii = {
    '  __   ___   _   _    _   _ ',
    '  \\ \\ / / | | | / \\  | \\ | |',
    '   \\ V /| | | |/ _ \\ |  \\| |',
    '    | | | |_| / ___ \\| |\\  |',
    '    |_|  \\___/_/   \\_\\_| \\_|',
    '    ',
}
vim.g.startify_custom_header = ascii -- 设置Startify的自定义标题
vim.g.startify_lists = {
    { type = 'files',     header = {'   MRU'}          },
    { type = 'sessions',  header = {'   Sessions'}     },
    { type = 'bookmarks', header = {'   Bookmarks'}    },
    { type = 'commands',  header = {'   Commands'}     },
} -- 设置Startify的列表类型和标题
vim.g.startify_bookmarks = { {o = '~/tmpfiles/t.md'}, '~/.zshrc', '~/.tmux.conf' } -- 设置Startify的书签
vim.g.startify_files_number = 5 -- 设置Startify的文件数量
vim.g.startify_session_autoload = 1 -- 设置Startify的自动加载会话
vim.g.startify_session_persistence = 1 -- 设置Startify的会话持久化
vim.g.startify_session_before_save = { 'silent! LspStop' } -- 设置Startify在保存会话之前执行的命令
vim.g.startify_commands = {
    {r = {'Refresh Startify', 'Startify'}},
    {S = {'Session Save', 'SSave ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~:t')}},
    {d = {'Session Delete', 'SDelete'}},
    {c = {'Session Close', 'SClose'}},
} -- 设置Startify的命令
vim.cmd('autocmd User Startified setlocal cursorline') -- 设置Startify的自动命令

-- preview markdown
vim.g.mkdp_browser = 'min'
vim.g.mkdp_theme = 'light'


-- 插入模式下关闭相对行号
vim.cmd('autocmd InsertEnter * :set nornu')
vim.cmd('autocmd InsertLeave * :set rnu')

-- vim-visual-multi
vim.g.VM_maps = {}
vim.g.VM_maps["Select Cursor Down"] = '<M-j>'
vim.g.VM_maps["Select Cursor Up"]   = '<M-k>'

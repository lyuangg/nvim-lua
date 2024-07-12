require('basic')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require('my.my')
require('my.snip')
require('my.run')
require('keymap')

vim.cmd("highlight Normal guibg=NONE ctermbg=None") -- 背景透明
vim.cmd([[hi WinSeparator guifg=#BA926A]])


-- diff color
vim.cmd('highlight DiffAdd    ctermfg=0 ctermbg=10 guifg=NvimLightGrey1 guibg=NvimDarkGreen')
vim.cmd('highlight DiffChange guifg=NvimLightGrey1 guibg=NvimDarkGrey4')
vim.cmd('highlight DiffDelete cterm=bold ctermfg=9 gui=bold guifg=NvimLightRed')
vim.cmd('highlight DiffText   ctermfg=0 ctermbg=203 guifg=#ff5252 guibg=NvimDarkCyan')

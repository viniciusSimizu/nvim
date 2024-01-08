vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.cmd(":set number relativenumber")

vim.cmd(":hi LineNrAbove guifg=red")
vim.cmd(":hi LineNrBelow guifg=#22FF22")
vim.cmd(":hi LineNr guifg=#31C0DC")

vim.opt.guicursor='i:block'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.opt.updatetime = 50

vim.diagnostic.config({
	virtual_text = false
})

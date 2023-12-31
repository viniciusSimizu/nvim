-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd(":hi LineNrAbove guifg=red")
vim.cmd(":hi LineNrBelow guifg=#22FF22")
vim.cmd(":hi LineNr guifg=#31C0DC")

local opt = vim.opt

opt.scrolloff = 8
opt.colorcolumn = "80"

opt.winbar = "%=%m %f"

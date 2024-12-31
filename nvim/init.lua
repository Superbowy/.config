vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

--Lazy installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd([[
augroup TransparentBackground
autocmd!
autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
augroup END
]])

vim.cmd("colorscheme carbonfox")

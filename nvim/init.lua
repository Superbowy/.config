vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>")

vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-j>', '<C-w>j', {})
vim.keymap.set('n', '<C-k>', '<C-w>k', {})
vim.keymap.set('n', '<C-l>', '<C-w>l', {})

vim.keymap.set('n', '<Leader>t', ':split<CR>:wincmd j<CR>:resize 10<CR>:terminal<CR>', {})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:wincmd k<CR>', {})

vim.keymap.set({"n", "i"}, '<leader>a', '<esc>o```{python}<cr>```<esc>O', {})

vim.api.nvim_create_autocmd('TextYankPost',{
    desc = "Highlight when yanking",
    callback = function()
        vim.highlight.on_yank()
    end,
})

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


-- Color Scheme
vim.cmd([[
augroup TransparentBackground
autocmd!
autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
autocmd ColorScheme * highlight NormalNC ctermbg=none guibg=none
autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
autocmd ColorScheme * highlight NeoTreeNormal ctermbg=none guibg=none
autocmd ColorScheme * highlight NeoTreeNormalNC ctermbg=none guibg=none
augroup END
]])

vim.cmd("colorscheme carbonfox")

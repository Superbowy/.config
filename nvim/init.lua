vim.wo.number = true
vim.wo.relativenumber = true
--vim.o.showtabline = 0

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")

vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

-- Terminal (normal)
vim.keymap.set("n", "<Leader>t", ":split<CR>:wincmd j<CR>:resize 20<CR>:terminal<CR>", {})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:wincmd k<CR>", {})

-- Quarto
vim.keymap.set("n", "<leader>a", "o<cr><cr>```{python}<cr>```<esc>O", {})

-- Line on cursor in normal mode, but not in insert mode
vim.o.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
vim.api.nvim_create_augroup("CursorLineControl", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	group = "CursorLineControl",
	pattern = "*",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = "CursorLineControl",
	pattern = "*",
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Disable python loader - not sure why I would need it
vim.g.loaded_python3_provider = 1
vim.keymap.set("n", "<leader>qp", ":QuartoPreview<CR>", {})
vim.filetype.add({
	extension = {
		qmd = "quarto",
	},
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

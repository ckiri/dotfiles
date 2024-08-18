-- [[ Basic Options ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.opt.colorcolumn = "80"
vim.opt.laststatus = 0
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.termguicolors = false
vim.opt.cursorline = false
vim.opt.scrolloff = 10
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = false
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.formatoptions = "tcqrn1"
vim.opt.hlsearch = true
vim.opt.syntax = "off"

vim.cmd("set path+=**")
vim.cmd("colorscheme vim")
vim.cmd("highlight TabLine guibg=#4F5258 guifg=#E0E2EA")
vim.cmd("highlight ColorColumn ctermbg=black guibg=#5E5C64")
vim.cmd("set guicursor=")

-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", ":tabnext<CR>")
vim.keymap.set("n", "<C-h>", ":tabprev<CR>")
vim.keymap.set("n", "<C-j>", ":bnext<CR>")
vim.keymap.set("n", "<C-k>", ":bprev<CR>")

-- [[ `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	-- Own personal wiki
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{
					path = "~/documents/vimwiki",
				},
			}
		end,
	},
}, {})

-- [[ Basic Options ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
vim.g.nwtrw_liststyle = 3
vim.g.netrw_banner = 0
vim.opt.colorcolumn = "80,100"
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.clipboard = "unnamedplus"
--vim.opt.clipboard:append("unnamedplus")
vim.opt.termguicolors = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "no"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
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
vim.opt.showtabline = 2
vim.opt.background = "dark"
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", ":tabnext<CR>", { noremap = true, silent = true, desc = "Move to next tab" })
vim.keymap.set("n", "<C-h>", ":tabprev<CR>", { noremap = true, silent = true, desc = "Move to previous tab" })
vim.keymap.set("n", "<C-j>", ":bnext<CR>", { noremap = true, silent = true, desc = "Move to next buffer" })
vim.keymap.set("n", "<C-k>", ":bprev<CR>", { noremap = true, silent = true, desc = "Move to previous buffer" })

require('lsp_config')

-- [[ Colorscheme  ]]
vim.cmd("hi TabLineSel ctermbg=black ctermfg=white")
vim.cmd("hi TabLine ctermbg=darkgrey ctermfg=black")
vim.cmd("hi ColorColumn ctermbg=black ctermfg=grey")
vim.cmd("hi LineNr ctermfg=darkgrey")
vim.cmd("hi PmenuSel ctermfg=darkgrey ctermbg=yellow")
vim.cmd("hi CursorLine term=none cterm=none")
vim.cmd("hi CursorLineNr ctermfg=yellow")
vim.cmd("hi ModeMsg ctermfg=lightblue")
vim.cmd("hi MsgArea ctermfg=lightmagenta")
vim.cmd("set path+=**")
vim.cmd("set guicursor=")
vim.cmd("syntax off")
--vim.cmd("filetype off")

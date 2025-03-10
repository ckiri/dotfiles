-- [[ Basic Options ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
vim.g.nwtrw_liststyle = 3
vim.g.netrw_banner = 0
vim.opt.laststatus = 0
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
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
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = false
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.formatoptions = "tcqrn1"
vim.opt.hlsearch = true
vim.opt.showtabline = 2
vim.opt.background = "light"
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.autoindent = true
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
vim.cmd("autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4")
vim.cmd("autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4")
vim.cmd("autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4")
vim.cmd("autocmd Filetype h setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4")
vim.cmd("autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4")
vim.cmd("autocmd Filetype ms setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2")
vim.cmd("autocmd Filetype mom setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2")
vim.cmd("autocmd Filetype xml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2")
vim.cmd("set path+=**")
vim.cmd("set guicursor=")
-- [[ Plugin Manager ]]
require('lazy-config')
-- [[ Colorscheme ]]
-- vim.cmd("hi TabLineSel ctermbg=white ctermfg=black cterm=bold")
-- vim.cmd("hi TabLine ctermbg=grey ctermfg=black")
-- vim.cmd("hi ColorColumn ctermbg=white ctermfg=darkgrey")
-- vim.cmd("hi LineNr ctermfg=darkgrey")
-- vim.cmd("hi PmenuSel ctermfg=darkgrey ctermbg=yellow")
-- vim.cmd("hi CursorLine term=none cterm=none")
-- vim.cmd("hi CursorLineNr ctermfg=yellow")
-- vim.cmd("hi ModeMsg ctermfg=black cterm=bold")
-- vim.cmd("hi MsgArea ctermfg=black")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("syntax off")
-- vim.cmd("filetype off")

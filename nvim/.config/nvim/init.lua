vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)
vim.cmd("let g:vimwiki_list = [{'path': '~/docs/vimwiki/'}]")
require('lazy').setup({

  'tpope/vim-fugitive',
  'vimwiki/vimwiki',
  'mhinz/vim-signify',

{ 'numToStr/Comment.nvim', opts = {
  },
},

}, {})

-- Basic Options
vim.g.vimwiki_list = {nested_syntaxes={python = 'python', gcc = 'c', bash = 'bash', gpp = 'cpp'}}
vim.o.showmode = true
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.title = true
vim.o.shell = 'zsh'
vim.o.laststatus = 2
vim.o.cmdheight = 1
vim.o.hlsearch = false          -- Set highlight on search
vim.o.mouse = 'a'               -- Enable mouse mode
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true        -- Enable break indent
vim.o.undofile = true           -- Save undo history
vim.o.ignorecase = true         -- Case insensitive searching
vim.o.smartcase = true
vim.o.updatetime = 250          -- Decrease update time
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect' -- Set completeopt for better completion
vim.o.termguicolors = false
vim.tabstop = 2                 -- Make tabstop 2
vim.wo.number = true            -- Make line numbers default
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'       -- Keep signcolumn on by default
vim.o.background = 'dark'
vim.wo.cursorline = true

vim.cmd("highlight LineNr ctermbg=darkgrey guibg=darkgrey ctermfg=black guifg=black")

vim.api.nvim_set_option('statusline', '%{v:lua.MyStatusLine()}')
vim.api.nvim_command('highlight StatusLine cterm=underline,bold ctermfg=black guifg=black guibg=white ctermbg=white gui=underline,bold')
vim.api.nvim_command('highlight CursorLineNr cterm=bold gui=bold ctermfg=yellow guifg=yellow ctermbg=black guibg=black')

function MyStatusLine()
    local encoding = vim.bo.fileencoding
    local filepath = vim.fn.expand('%:p')
    local linecount = vim.fn.line('$')
    local percentage = math.floor((vim.fn.line('.') / linecount) * 100)

    return string.format('%s | %s | %d/%d (%d%%)', filepath, encoding, vim.fn.line('.'), linecount, percentage)
end

-- Keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


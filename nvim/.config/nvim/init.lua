vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('vimwiki/vimwiki')
-- Git signs on signcolumn
Plug('airblade/vim-gitgutter')
-- LSP
Plug('neovim/nvim-lspconfig')
-- Colorschemes
Plug('seandewar/paragon.vim')
Plug('nvim-treesitter/nvim-treesitter')

vim.call('plug#end')

-- Basic options
vim.opt.showmode = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.title = true
vim.opt.shell = 'zsh'
vim.opt.laststatus = 2
vim.opt.cmdheight = 1
vim.opt.hlsearch = true          -- Set highlight on search
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.opt.breakindent = true        -- Enable break indent
vim.opt.undofile = true           -- Save undo history
vim.opt.ignorecase = true         -- Case insensitive searching
vim.opt.smartcase = true
vim.opt.updatetime = 250          -- Decrease update time
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.completeopt = 'menuone,noselect' -- Set completeopt for better completion
vim.opt.termguicolors = true
vim.tabstop = 2                 -- Make tabstop 2
vim.wo.number = true            -- Make line numbers default
vim.wo.relativenumber = true
vim.opt.cursorline = true

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

vim.cmd.colorscheme "paragon"

-- Stuff from old vimrc
vim.cmd("highlight Signcolumn      guifg=#ffffff guibg=none ctermfg=white ctermbg=none")
vim.cmd("highlight GitGutterAdd    guifg=#ffffff guibg=none ctermfg=green ctermbg=none")
vim.cmd("highlight GitGutterChange guifg=#ffffff guibg=none ctermfg=magenta ctermbg=none")
vim.cmd("highlight GitGutterDelete guifg=#ffffff guibg=none ctermfg=red ctermbg=none")
--vim.cmd("highlight Pmenu           guifg=#ffffff guibg=#38373C ctermfg=White ctermbg=Darkgrey")
--vim.cmd("highlight PmenuSel        guifg=#000000 guibg=#F8E45C ctermfg=Black ctermbg=Yellow")
--vim.cmd("highlight TabLine cterm=NONE gui=NONE ctermfg=white ctermbg=darkgrey guifg=white guibg=#414046")
vim.cmd("highlight LineNr guifg=#5E5C64 ctermfg=darkgrey")

vim.cmd("set path+=**")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set showcmd")

vim.cmd("let g:netrw_banner=0")
vim.cmd("let g:netrw_liststyle=3")

-- Encoding
vim.cmd("set encoding=utf-8")

-- Whitespace
vim.cmd("set formatoptions=tcqrn1")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set expandtab")
vim.cmd("set noshiftround")

-- Allow hidden buffers
vim.cmd("set hidden")

-- Rendering
vim.cmd("set ttyfast")

-- Setup language servers.
local lspconfig = require('lspconfig')
-- lspconfig.tsserver.setup {} -- Typescript
lspconfig.lua_ls.setup {} -- Lua
lspconfig.clangd.setup {} -- C/C++
-- lspconfig.jdtls.setup {} -- Java (eclipse)

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,  -- Disable virtual text
    signs = true,
    update_in_insert = false,
  }
)
-- Trigger lsp completion
vim.api.nvim_set_keymap('i', '<C-n>', '<C-x><C-o>', { noremap = true, silent = true })

-- Map Ctrl-l to switch to the next tab
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })

-- Map Ctrl-h to switch to the previous tab
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprev<CR>', { noremap = true, silent = true })

-- Map Ctrl-j to switch to the next buffer
vim.api.nvim_set_keymap('n', '<C-j>', ':bnext<CR>', { noremap = true, silent = true })

-- Map Ctrl-k to switch to the previous buffer
vim.api.nvim_set_keymap('n', '<C-k>', ':bprev<CR>', { noremap = true, silent = true })

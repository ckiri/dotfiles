" A "minimalist" vimrc :)

"██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"██║   ██║██║██╔████╔██║██████╔╝██║     
"╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
" ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
                                       
" Don't try to be vi compatible
set nocompatible
" Set leader key to space
let mapleader = " "

" Plugins using `Plug` and Plugin configuration
" Helps force plugins to load correctly when it is turned back on below
filetype off
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'vimwiki/vimwiki'

call plug#end()

" Plugin configuration
let g:vimwiki_list = [{'path': '~/documents/vimwiki/'}] " Set path for vimwiki
" For plugins to load correctly
filetype plugin indent on
filetype plugin on

" Security
set modelines=0

set number
set relativenumber
set background=dark
set colorcolumn=80,100

"set termguicolors
filetype off 
syntax off

" Colorscheme
hi TabLine guibg=#4F5258 guifg=#1a1a1a
hi ColorColumn ctermbg=darkgrey ctermfg=white guibg=#1a1a1a
hi LineNr ctermfg=darkgrey guibg=#222222 guifg=#666666
hi PmenuSel ctermfg=darkgrey ctermbg=yellow guibg=#222222 guifg=#666666"
hi CursorLine term=none cterm=none

set path+=**
set clipboard=unnamed
set clipboard=unnamedplus

set undodir=~/.cache/vim/undo
set undofile

set showcmd
set showtabline=2 " Always show tabline

" Tweaks for file browsing
let g:netrw_banner=0    " Disable banner that takes up half the screen
let g:netrw_liststyle=3 " Tree view
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
"set nowrap " Do not wrap, looks terrible without line numbers

" Cursor motion
set scrolloff=10
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
nnoremap <C-c> :call system("wl-copy", @")<CR>

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
" set laststatus=2

" Last line
"set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

tnoremap <Esc><Esc> <C-\\><C-n>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>

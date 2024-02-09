" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'jaredgorski/spacecamp'

call plug#end()

" Plugin configuration

let g:vimwiki_list = [{'path': '~/documents/vimwiki/'}]

" Turn on syntax highlighting
syntax off

" For plugins to load correctly
filetype plugin indent on

let mapleader = " "

" Security
set modelines=0

" Show line numbers
"set number
"set relativenumber

"set termguicolors
"colorscheme spacecamp
set nowrap

highlight Signcolumn      ctermfg=white ctermbg=none
highlight GitGutterAdd    guifg=#009900 ctermfg=white ctermbg=none
highlight GitGutterChange guifg=#bbbb00 ctermfg=white ctermbg=none
highlight GitGutterDelete guifg=#ff2222 ctermfg=white ctermbg=none

" Change the background color of the menu entries
highlight Pmenu ctermfg=White ctermbg=none
highlight PmenuSel ctermfg=Black ctermbg=Yellow

filetype plugin on
set nocompatible
set path+=**
set clipboard=unnamedplus

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

set guifont=DejaVu\ Sans\ Mono\ 16

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
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

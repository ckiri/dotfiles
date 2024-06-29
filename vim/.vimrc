" A "minimal" vimrc :)

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

"========================
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
" Git signs on signcolumn
Plug 'airblade/vim-gitgutter'

call plug#end()

" Plugin configuration
let g:vimwiki_list = [{'path': '~/documents/vimwiki/'}] " Set path for vimwiki

" For plugins to load correctly
filetype plugin indent on

filetype plugin on
"========================

" Security
set modelines=0

" Show line numbers, disabled. Because not really needed
set number
set relativenumber
"set cursorline

"========================

" Set a font when using gvim
set guifont=Monospace\ 16

" Set this to use GUI colors inside your terminal
"set termguicolors

highlight Normal guibg=none ctermbg=none

" Style the signcolumn(git signs), made it mono
highlight Signcolumn      guifg=#ffffff guibg=none ctermfg=white ctermbg=none
highlight GitGutterAdd    guifg=#ffffff guibg=none ctermfg=green ctermbg=none
highlight GitGutterChange guifg=#ffffff guibg=none ctermfg=magenta ctermbg=none
highlight GitGutterDelete guifg=#ffffff guibg=none ctermfg=red ctermbg=none

" Change the background color of menu entries to make them actually readable!
highlight Pmenu           guifg=#ffffff guibg=#5E5C64 ctermfg=White ctermbg=Darkgrey
highlight PmenuSel        guifg=none guibg=#FCE094 guifg=#222222 ctermfg=Black ctermbg=Yellow

" Style the tabline
"highlight TabLine cterm=NONE ctermfg=white ctermbg=darkgrey guibg=NONE

" Style line number
highlight LineNr ctermfg=darkgrey

" Set a fancy colorscheme. Disabled for now. Will override the colors above.

" Turn on/off syntax highlighting
syntax on
"========================

set path+=**
set clipboard=unnamedplus

set undodir=~/.cache/vim/undo
set undofile

set showcmd

" Tweaks for file browsing
let g:netrw_banner=0    " Disable banner that takes up half the screen
let g:netrw_liststyle=3 " Tree view

" Show file stats
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

" Do not wrap, looks terrible without line numbers
set nowrap

" Cursor motion
set scrolloff=10
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

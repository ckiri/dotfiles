" A "minimalist" vimrc :)

"██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"██║   ██║██║██╔████╔██║██████╔╝██║     
"╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
" ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
                                       
let mapleader = " "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'vimwiki/vimwiki'
call plug#end()
let g:vimwiki_list = [{'path': '~/documents/vimwiki/'}] " Set path for vimwiki

set nocompatible
set modelines=0
set number
set relativenumber
set background=dark
set colorcolumn=80,100
set path+=**
set clipboard=unnamed
set clipboard=unnamedplus
set undodir=~/.cache/vim/undo
set undofile
set showcmd
set showtabline=2 " Always show tabline
let g:netrw_banner=0    " Disable banner that takes up half the screen
let g:netrw_liststyle=3 " Tree view
set ruler
set visualbell
set encoding=utf-8
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set scrolloff=10
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
set hidden
set ttyfast
set laststatus=2
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

map <leader><space> :let @/=''<cr> " clear search
nnoremap j gj
nnoremap k gk
nnoremap <C-c> :call system("wl-copy", @")<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap / /\v
nnoremap <F1> :set invfullscreen<CR>
vnoremap / /\v
vnoremap <F1> :set invfullscreen<CR>
map <leader>q gqip
tnoremap <Esc><Esc> <C-\\><C-n>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>

hi TabLine guibg=#4F5258 guifg=#1a1a1a
hi ColorColumn ctermbg=darkgrey ctermfg=white guibg=#1a1a1a
hi LineNr ctermfg=darkgrey guibg=#222222 guifg=#666666
hi PmenuSel ctermfg=darkgrey ctermbg=yellow guibg=#222222 guifg=#666666"
hi CursorLine term=none cterm=none

filetype off 
syntax off

runtime! macros/matchit.vim

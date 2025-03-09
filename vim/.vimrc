"           A "minimalist" vimrc :)
"
"   ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"   ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"   ██║   ██║██║██╔████╔██║██████╔╝██║     
"   ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"    ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

set nocompatible
let mapleader = " "
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vimwiki/vimwiki'
call plug#end()

"let g:vimwiki_list = [{'path': '~/docs/vimwiki/', 'path_html': '~/docs/vimwiki-html/'}, {'path': '~/docs/homewiki/', 'path_html': '~/docs/homewiki-html/'}] 
" vimwiki 
let vimwiki = {}
let vimwiki.path = '~/docs/vimwiki/'
let vimwiki.path_html = '~/docs/vimwiki-html/'

let homewiki = {}
let homewiki.path = '~/docs/homewiki/'
let homewiki.path_html = '~/docs/homewiki-html/'

let g:vimwiki_list = [vimwiki, homewiki]

filetype plugin indent on
filetype plugin on
set modelines=0
set nowrap

filetype on 
syntax off

set path+=**
set clipboard=unnamed
"set clipboard=unnamedplus
set undodir=~/.cache/vim/undo
set undofile
set showcmd
let g:netrw_banner=0
let g:netrw_liststyle=3
set ruler
set visualbell
set encoding=utf-8
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set scrolloff=10
set backspace=indent,eol,start
set matchpairs+=<:>

runtime! macros/matchit.vim
nnoremap j gj
nnoremap k gk
set hidden
set ttyfast
set showmode
set showcmd
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
map <leader>q gqip
map <leader>l :set list!<CR> " Toggle tabs and EOL
tnoremap <Esc><Esc> <C-\\><C-n>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
hi TabLineSel ctermbg=black ctermfg=white cterm=bold
hi TabLine ctermbg=grey ctermfg=black cterm=none
hi TabLineFill ctermbg=grey ctermfg=black cterm=none
hi Search ctermbg=yellow ctermfg=black
set laststatus=0

" Vundles {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vectorstorm/vim-sensible'
Bundle 'tpope/vim-tbone'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'Townk/vim-autoclose'
Bundle 'leafo/moonscript-vim'
Bundle 'tpope/vim-haml'
Bundle 'kien/ctrlp.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "garbas/vim-snipmate"
Bundle 'LustyExplorer'
Bundle 'Align'
Bundle 'embear/vim-localvimrc'
Bundle 'airblade/vim-gitgutter'

filetype plugin indent on
" }}} 

" Misc settings {{{

set relativenumber
colorscheme jellybeans

" Set <leader> to something more reachable
let mapleader=','
let localleader=','

" Stop vim-sensible from remapping keys.
let g:sensible_suppress_maps=1

" Set the tabs to something more preferable
set expandtab
set shiftwidth=4
set softtabstop=4

" This is much nicer
set ignorecase
set smartcase

" Hide all the error messages
set hidden

" I hate it beeping at me
set visualbell
set noerrorbells

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    set guioptions-=h
    set guifont=Inconsolata\ 11
else
    " Tell vim to use 256 colours
    set t_Co=256
endif
" Status line
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
" }}}

" Control + something commands {{{
" Type control-u in either insert or normal mode to change a word to uppercase
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Allow Control-movement to move between splits
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
" }}}

" Leader Commands {{{
" Execute Lua
vnoremap <leader>el :! lua<cr>

" Execute Moonscript
vnoremap <leader>em :! moonc -- \| lua<cr>

" Edit my Vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source my Vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Split Window
nnoremap <leader>sw :vsplit<cr>
" }}}

" Abbreviations {{{
iabbrev @@ kuiper.gwilym@gmail.com
" }}}

" Random other remaps {{{
noremap L $
noremap H 0
noremap j gj
noremap k gk
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>

" Remap space to :
noremap <space> :
noremap : <nop>

" Tab toggles NERDTree
nnoremap <tab> :NERDTreeToggle<cr>

" Save with sudo
ca w!! w !sudo tee % > /dev/null
" }}}

" Filetype Specific commands {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}

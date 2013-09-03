" Vundles {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vectorstorm/vim-sensible'
Bundle 'flazz/vim-colorschemes'
Bundle 'leafo/moonscript-vim'
Bundle 'tpope/vim-haml'
Bundle 'kien/ctrlp.vim'
Bundle 'embear/vim-localvimrc'
Bundle 'airblade/vim-gitgutter'
Bundle 'a.vim'
Bundle 'tikhomirov/vim-glsl'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

filetype plugin indent on
filetype on
" }}}

" Misc settings {{{

set relativenumber
colorscheme jellybeans

" Set <leader> to something more reachable
let mapleader=','
let localleader=','

" Stop vim-sensible from remapping keys.
let g:sensible_suppress_maps=1

" Allow any commands to be in .lvimrc
let g:localvimrc_sandbox=0

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
    set guifont=Inconsolata\ for\ Powerline\ 11

    set mouse-=a
else
    " Tell vim to use 256 colours
    set t_Co=256
endif
" Status line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
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
" Alternate
nnoremap <leader>a :A<cr>

" Execute Lua
vnoremap <leader>el :! lua<cr>

" Execute Moonscript
vnoremap <leader>em :! moonc -- \| lua<cr>

" Edit my Vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source my Vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Split Window
nnoremap <leader>vs :vsplit<cr>

" ControlPTags
nnoremap <leader><leader> :CtrlPTag<cr>
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

" I killed off comma, so lets bring that back. It makes sense to have these on
" the same key anyway.
noremap : ,

" F8 toggles tagbar
nnoremap <f8> :TagbarToggle<cr>

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

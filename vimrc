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
Bundle 'othree/html5.vim'
" Bundle 'Rip-Rip/clang_complete'
Bundle 'ervandew/supertab'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'gerw/vim-latex-suite'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on
filetype on
" }}}

" Misc settings {{{

set relativenumber
set number

" Set <leader> to something more reachable
let mapleader=','
let localleader=','

" Stop vim-sensible from remapping keys.
let g:sensible_suppress_maps=1

" Allow any commands to be in .lvimrc
let g:localvimrc_sandbox=0

" Set the note directory to something better
let g:notes_directories = ['~/documents/Copy/notes']

" Set the tabs to something more preferable
set expandtab
set shiftwidth=4
set softtabstop=4

" Actually set the shell
set shell=bash

" This is much nicer
set ignorecase
set smartcase

" Hide all buffers rather then close them
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

let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Status line
let g:airline_powerline_fonts = 1

" Completion stuff
let g:clang_library_path = '/home/gwilym/install/usr/lib/'
let g:clang_close_preview = 1
let g:clang_complete_macros = 1
set completeopt=menu,longest

" and make the defaults nice
let g:clang_complete_auto = 0
let g:SuperTabDefaultCompletionType = "context"
let g:clang_complete_copen = 1

" disable visual bell
set t_vb=
" }}}

" Control + something commands {{{
" Type control-u in either insert to change a word to uppercase
inoremap <c-u> <esc>viwUea

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
noremap j gj
noremap k gk

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

augroup filetype_ls
    autocmd!
    au BufNewFile,BufReadPost *.ls setl foldmethod=indent nofoldenable
    au BufNewFile,BufReadPost *.ls setl shiftwidth=2 expandtab
augroup END

augroup filetype_styl
    autocmd!
    au BufNewFile,BufReadPost *.styl setl foldmethod=indent nofoldenable
    au BufNewFile,BufReadPost *.styl setl shiftwidth=2 expandtab
augroup END

augroup filetype_red
    autocmd!
    au BufNewFile,BufReadPost *.red setl ft=redcode
augroup END

" }}}

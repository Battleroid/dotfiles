set shell=/bin/bash

" Required
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-bufferline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-markdown'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'

" Colorschemes
Plugin 'w0ng/vim-hybrid'

" Requires extra packages
" Plugin 'Valloric/YouCompleteMe' " relies on jedi for python completion
Plugin 'davidhalter/jedi-vim'

" Webdev
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color' 
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'

" End
call vundle#end()

" Basics
filetype plugin indent on
syntax on
set nu
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set smarttab
set ai
set backspace=indent,eol,start
set listchars=tab:\|\ 
set list
set scrolloff=4
set wildmenu
set wildmode=longest,list

" Colorscheme related
set t_Co=256
let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid

" Miscellaneous {

" Line and column highlight, helps to keep track of cursor
hi CursorLine cterm=NONE ctermbg=black
let &colorcolumn=join(range(81,999),",") " highlight past 80 col
set cursorline
set cursorcolumn

" Change gvim font and toolbar options
if has("gui_running")
	set guifont=Inconsolata\ 13
	set guioptions=-T
	set guioptions=-M
endif

" Emmet
let g:user_emmet_leader_key = '\'

" Lightline
set laststatus=2

" Python
autocmd Filetype python setlocal expandtab

" }

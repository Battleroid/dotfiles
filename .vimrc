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

" Colorschemes
" Plugin 'ChrisKempson/Vim-Tomorrow-Theme'
" Plugin 'w0ng/vim-hybrid'
" Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'

" Requires extra packages
" Plugin 'Valloric/YouCompleteMe'
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

" base16 related
let base16colorspace=256
let g:base16_shell_path="~/.config/base16-shell"

" Colorscheme related
set t_Co=256
set background=dark
colorscheme base16-tomorrow

" Miscellaneous {

" Lightline
set laststatus=2

" Python
autocmd Filetype python setlocal expandtab

" }

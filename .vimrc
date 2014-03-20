" Required
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'w0ng/vim-hybrid'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-markdown'

" Webdev
" Bundle 'mattn/emmet-vim'
" Bundle 'ap/vim-css-color' 
" Bundle 'shawncplus/phpcomplete.vim'

syntax on
filetype plugin indent on
set t_Co=256
set nu
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set smarttab
set ai
set backspace=indent,eol,start
set listchars=tab:\|\ 
set list
colorscheme hybrid

" filetype
au BufRead,BufNewFile *.cnf setfiletype cnf

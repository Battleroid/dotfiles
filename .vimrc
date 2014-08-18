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

" Colorschemes
Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'

" Requires extra packages
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'davidhalter/jedi-vim'

" Webdev
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color' 
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'

" End
call vundle#end()

filetype plugin indent on
syntax on
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
colorscheme gruvbox

if has("gui_running")
	if has("gui_win32")
		set guifont=Consolas:h11
	else
		set guifont=Consolas\ 11
	endif
	set guioptions-=T
endif

" Lightline
set laststatus=2

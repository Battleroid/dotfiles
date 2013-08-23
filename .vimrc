" Vundle related material
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'xuhdev/SingleCompile'
Bundle 'Valloric/YouCompleteMe'
Bundle 'benmills/vimux'
"Bundle 'Lokaltog/powerline'

" YCM requires vim 7.3.5xx+! Compile Vim 7.4 instead with options:
" --enable-pythoninterp --enable-rubyinterp --enable-perlinterp --with-features=huge

let g:syntastic_python_checkers = ['flake8']
" nmap <F9> :SCCompile<cr> " doesn't really work because of GUI
" nmap <F10> :SCCompileRun<cr>

set nu
filetype plugin on
filetype indent on
set autoread
set ruler
set ignorecase
syntax enable
set encoding=utf8
set smarttab
set shiftwidth=2
set tabstop=2
set backspace=indent,eol,start " prevent annoying issues with backspace/insert

set ai
set si
set wrap

set cursorline
set more
set title
set showcmd
set lazyredraw
set history=500
set wildmenu

set backupdir=~/.vim/backup,/tmp
set undofile
set undodir=~/.vim/undo,/tmp

set foldenable
set foldmethod=marker
set foldlevel=100
set foldopen=block,hor,mark,percent,quickfix,tag


if has("gui_running")
	" GVIM specific settings
	set guioptions-=T " no toolbar
	let g:solarized_termcolors=256
	set guifont=Terminus\ 11
	cabbrev run SCCompileRun
	cabbrev cmp SCCompile
endif

if has("gui_running") || &t_Co >= 256
	" Works if using GVIM or have 256 or more colors
	colorscheme jellybeans " only works if in gvim or 256 color support
endif

if !has("gui_running")
	" Works if NOT using GVIM
	set t_Co = 256
	colorscheme jellybeans
endif

set shell=/bin/bash

" Required
set nocompatible

" Plug start
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}
Plug 'ervandew/supertab'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'w0ng/vim-hybrid'
Plug 'davidhalter/jedi-vim', {'for': 'python'} " requires jedi
call plug#end()

" Basics
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0
filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set list
set listchars=tab:\|\ ,eol:←,trail:·
set mouse=
set nu
set scrolloff=4
set shiftwidth=4
set smarttab
set tabstop=4
set wildmenu
set wildmode=longest,list
set showmode
set undofile
set undodir=~/.vim/undos
set laststatus=2

" Colorscheme related
set t_Co=256
let g:hybrid_use_Xresources=1
set background=dark
colorscheme hybrid
hi CursorLine cterm=NONE ctermbg=black
set cursorline
set cursorcolumn

" Other
set foldmethod=indent
set foldnestmax=5
set nofoldenable

let g:vim_markdown_frontmatter=1
let g:markdown_fenced_languages = ['python', 'java']

autocmd FileType python map <buffer> <F9> :call Flake8()<CR>
autocmd FileType markdown,text setlocal spell
			\ spl=en_us
			\ linebreak

nn <space>ga :Git add %:p<CR><CR>
nn <space>gs :Gstatus<CR>
nn <space>gc :Gcommit -v -q<CR><CR>
nn <space>gw :Gwrite<CR><CR>

let g:syntastic_check_on_wq = 1

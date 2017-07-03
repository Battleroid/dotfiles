" Avoid issues with using zsh
set shell=/bin/bash

" Required
set nocompatible

" Plugins start
call plug#begin('~/.vim/plugged')

" Status
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Linting
Plug 'nvie/vim-flake8', {'for': 'python'}
" Plug 'scrooloose/syntastic'

" Completion
Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim'
" Plug 'fatih/vim-go'

" Color
Plug 'w0ng/vim-hybrid'
call plug#end()

" Basics
filetype plugin indent on
syntax on
set backspace=indent,eol,start
set encoding=utf-8
set list
set listchars=tab:\|\ ,eol:←,trail:·
set mouse=a
set nu
set scrolloff=4
set shiftwidth=4
set smarttab
set smartindent
set autoindent
set tabstop=4
set wildmenu
set wildmode=longest,list
set showmode
set undofile
set undodir=~/.vim/undo
set laststatus=2
set expandtab
set autoread
set splitbelow
set splitright
set shortmess+=I
set autoread
set modeline
set modelines=5
set foldmethod=indent
set foldnestmax=5
set nofoldenable
" set termguicolors

" Colorscheme related
" set t_Co=256
set t_Co=16
set background=dark
colorscheme hybrid
hi CursorLine cterm=NONE ctermbg=black
set cursorline
set cursorcolumn

" Misc autocmds
autocmd FileType markdown,text setlocal spell spl=en_us linebreak
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile Dockerfile,Dockerfile.tmpl setlocal ft=Dockerfile expandtab
autocmd BufRead,BufNewFile notes setlocal ft=markdown

" Fugitive
nn <space>ga :Git add %:p<CR><CR>
nn <space>gs :Gstatus<CR>
nn <space>gc :Gcommit -v -q<CR><CR>

" Completion
set completeopt+=longest,menuone,noinsert,noselect
set shortmess+=c
" set shortmess-=preview
let g:mucomplete#enable_auto_at_startup = 1
let g:jedi#popup_on_dot = 0

" Go
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" let g:go_fmt_command = "goimports"
" let g:go_fmt_fail_silently = 1
" let g:go_play_open_browser = 0

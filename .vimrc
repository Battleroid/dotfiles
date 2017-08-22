" Avoid issues with using zsh
set shell=/bin/bash

" Required
set nocompatible

" Plugins start
call plug#begin('~/.vim/plugged')

" Status
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'

" Completion, lint, etc
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'plasticboy/vim-markdown'
Plug 'rodjek/vim-puppet'
Plug 'junegunn/goyo.vim'
Plug 'roxma/nvim-completion-manager'

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
set incsearch
set nohlsearch

" Colorscheme related
colorscheme hybrid
set background=dark
set cursorline
set cursorcolumn
hi CursorLine cterm=NONE ctermbg=black

" Misc autocmds
autocmd FileType markdown,text setlocal spell linebreak
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile Dockerfile,Dockerfile.tmpl setlocal ft=Dockerfile expandtab
autocmd BufRead,BufNewFile notes setlocal ft=markdown

" Completion
set completeopt+=menuone,noinsert,noselect
set shortmess+=c
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_play_open_browser = 0

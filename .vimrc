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

" Linting
Plug 'nvie/vim-flake8', {'for': 'python'}

" Completion
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
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
set termguicolors

" Colorscheme related
" set t_Co=16
set background=dark
colorscheme hybrid
hi CursorLine cterm=NONE ctermbg=black
set cursorline
set cursorcolumn

" Misc autocmds
autocmd FileType markdown,text setlocal spell linebreak
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile Dockerfile,Dockerfile.tmpl setlocal ft=Dockerfile expandtab
autocmd BufRead,BufNewFile notes setlocal ft=markdown

" Completion
" set completeopt+=longest,menuone,noinsert,noselect
set shortmess+=c
set conceallevel=0
let g:vim_markdown_frontmatter=1
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

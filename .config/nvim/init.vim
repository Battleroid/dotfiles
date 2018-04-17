" Avoid issues with using zsh
" set shell=/bin/bash

" Plugins start
call plug#begin('~/.local/share/nvim/plugged')

" Status
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'

" Misc
Plug 'tpope/vim-fugitive'

" Completion, lint, etc
Plug 'roxma/nvim-completion-manager'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'junegunn/goyo.vim', {' for': ['markdown', 'text'] }
Plug 'davidhalter/jedi-vim'
Plug 'roxma/ncm-rct-complete'
Plug 'plasticboy/vim-markdown'
Plug 'rodjek/vim-puppet'
Plug 'lepture/vim-jinja'

" Color
Plug 'fenetikm/falcon'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
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
" set smartindent
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
set conceallevel=2
set termguicolors
set updatetime=100

" Colorscheme related
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=dark
set cursorline
set cursorcolumn
hi CursorLine cterm=NONE ctermbg=black

" Lightline
let g:lightline = {
    \ 'active': {
    \   'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ],
    \   'left':  [ ['mode', 'paste'], ['readonly', 'relativepath', 'modified', 'branch'] ],
    \ },
    \ 'component_function': {
    \   'branch': 'fugitive#head'
    \ },
    \ 'colorscheme': 'PaperColor_light',
    \ }

" Misc autocmds
autocmd FileType markdown,text setlocal spell linebreak
autocmd FileType ruby setlocal sw=2 ts=2 expandtab
autocmd FileType json,yaml setlocal sw=2 ts=2
autocmd BufRead,BufNewFile,BufWritePre *.conf setlocal sw=2 ts=2 expandtab syntax=conf smartindent
autocmd BufRead,BufNewFile,BufWritePre Dockerfile,Dockerfile.tmpl setlocal ft=Dockerfile expandtab
autocmd BufRead,BufNewFile,BufWritePre notes setlocal ft=markdown

" Completion
set shortmess+=c
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" use current env python 2/3 interpreter, fix later
let g:python_support_python2_venv = 0
let g:python_support_python3_venv = 0

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

" fugitive / gitgutter
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>ga :Gcommit --amend<CR>

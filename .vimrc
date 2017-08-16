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
Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim'
" Plug 'fatih/vim-go'
Plug 'junegunn/goyo.vim'

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
set scrolloff=10
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
set cursorline
set cursorcolumn
color hybrid
hi CursorLine cterm=NONE ctermbg=black
set background=dark
if has("gui_running")
    set guifont=Hack:h16
endif

" Misc autocmds
autocmd BufRead,BufNewFile *.conf setlocal expandtab sw=2 ts=2 ft=conf
autocmd FileType python map <buffer> <F9> :call Flake8()<CR>
autocmd FileType markdown,text setlocal spell spl=en_us linebreak
autocmd FileType yaml,ruby,json setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile Jenkinsfile setlocal expandtab sw=2 ts=2
autocmd BufRead,BufNewFile Dockerfile,Dockerfile.tmpl setlocal ft=Dockerfile expandtab
autocmd BufRead,BufNewFile notes setlocal ft=markdown
autocmd FileType python setlocal equalprg=yapf
" autocmd BufWinEnter,FileType markdown,text colorscheme nofrils-light

" Completion
" set completeopt+=longest,menuone,noinsert,noselect
set completeopt+=menuone,noselect
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1
let g:jedi#popup_on_dot = 0
let g:mucomplete#chains= { 'markdown': ['file', 'uspl'] }

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

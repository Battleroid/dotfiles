set shell=/bin/bash

" Required
set nocompatible

" Plugins start
call plug#begin('~/.vim/plugged')

" Status
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax, checking, etc
Plug 'nvie/vim-flake8', {'for': 'python'}
" Plug 'scrooloose/syntastic'

" Autocomplete
Plug 'davidhalter/jedi-vim', {'for': 'python'} " requires jedi
Plug 'ervandew/supertab'
" Plug 'fatih/vim-go'

" Color
Plug 'robertmeta/nofrils', {'for': ['markdown', 'text'] }
Plug 'morhetz/gruvbox'
call plug#end()

" Basics
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
set expandtab
set autoread
set splitbelow
set splitright
set shortmess+=I
set autoread
set modeline
set modelines=5

" Colorscheme related
colorscheme gruvbox
set background=dark
set t_Co=256
hi CursorLine cterm=NONE ctermbg=black
set cursorline
set cursorcolumn

" Other
set foldmethod=indent
set foldnestmax=5
set nofoldenable
" TODO: set keys for folding easier

" Misc autocmds
autocmd FileType python map <buffer> <F9> :call Flake8()<CR>
autocmd FileType markdown,text setlocal spell
			\ spl=en_us
			\ linebreak
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" TODO: is expandtab necessary?
autocmd BufRead,BufNewFile Dockerfile,Dockerfile.tmpl setlocal ft=Dockerfile expandtab

" Fugitive
nn <space>ga :Git add %:p<CR><CR>
nn <space>gs :Gstatus<CR>
nn <space>gc :Gcommit -v -q<CR><CR>

" Supertab
" TODO: Chain with c-o, context doesn't always work, needs to be
" context, c-o, then c-p or c-n
let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabDefaultCompletionType = "<C-n>"
" let g:SuperTabLongestEnhanced = 1
" let g:SuperTabLongestHighlight = 0
" autocmd FileType *
"   \ if &omnifunc != '' |
"   \   call SuperTabChain(&omnifunc, "<c-p>") |
"   \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"   \ endif

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

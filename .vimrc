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
Plug 'scrooloose/syntastic'

" Autocomplete
Plug 'mattn/emmet-vim'
Plug 'davidhalter/jedi-vim', {'for': 'python'} " requires jedi
Plug 'ervandew/supertab'
" Plug 'fatih/vim-go'

" Misc
Plug 'othree/html5.vim'
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}
Plug 'junegunn/goyo.vim'

" Color
Plug 'w0ng/vim-hybrid'
Plug 'robertmeta/nofrils'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
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

" Colorscheme related
colorscheme hybrid
let g:hybrid_use_Xresources=1
set background=dark
set t_Co=256
hi CursorLine cterm=NONE ctermbg=black
set cursorline
set cursorcolumn

" Other
set foldmethod=indent
set foldnestmax=5
set nofoldenable

" Markdown
let g:vim_markdown_frontmatter=1
let g:markdown_fenced_languages = ['python', 'java']

" Misc autocmds
autocmd FileType python map <buffer> <F9> :call Flake8()<CR>
autocmd FileType markdown,text setlocal spell
			\ spl=en_us
			\ linebreak

" Fugitive
nn <space>ga :Git add %:p<CR><CR>
nn <space>gs :Gstatus<CR>
nn <space>gc :Gcommit -v -q<CR><CR>
nn <space>gw :Gwrite<CR><CR>

" Syntastic
let g:syntastic_check_on_wq = 1

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 0
" autocmd FileType *
"   \ if &omnifunc != '' |
"   \   call SuperTabChain(&omnifunc, "<c-p>") |
"   \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"   \ endif

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

" Avoid issues with using zsh
" set shell=/bin/bash

" Plugins start
syntax on
call plug#begin('~/.local/share/nvim/plugged')

" Status
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'

" Misc
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'

" Completion, lint, etc
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'davidhalter/jedi-vim', {'for': ['python']}
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'vim-python/python-syntax', {'for': ['python']}
" Plug 'rodjek/vim-puppet'
" Plug 'lepture/vim-jinja'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'junegunn/goyo.vim', {'for': ['markdown', 'text']}

" Color
Plug 'morhetz/gruvbox'
call plug#end()

" Basics
filetype plugin indent on
set backspace=indent,eol,start
set encoding=utf-8
set list
set listchars=tab:\|\ ,eol:←,trail:·
set mouse=a
set nu
set scrolloff=4
set shiftwidth=4
set smarttab
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
set foldmethod=syntax
set foldnestmax=5
set nofoldenable
set incsearch
set nohlsearch
set conceallevel=2
set updatetime=100

if $TERMTERM == 'truecolor'
    set termguicolors
endif

" Colorscheme related
let &t_ut='' " fixes weird issue in kitty with background erasing, see their readme
set cursorline
set cursorcolumn
hi CursorLine cterm=NONE ctermbg=black
set background=dark
colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_improved_strings=1
" let g:gruvbox_italic = 1

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
autocmd FileType markdown,text setlocal spell linebreak nocursorcolumn expandtab
autocmd FileType *.json,json,yaml setlocal sw=2 ts=2 conceallevel=0
autocmd FileType ruby setlocal sw=2 ts=2 expandtab
autocmd FileType python setlocal cc=120
autocmd BufRead,BufNewFile,BufWritePre *.conf setlocal sw=2 ts=2 expandtab syntax=conf smartindent
autocmd BufRead,BufNewFile,BufWritePre Dockerfile,Dockerfile.tmpl setlocal ft=Dockerfile expandtab
autocmd BufRead,BufNewFile,BufWritePre notes setlocal ft=markdown
autocmd BufRead,BufNewFile,BufWritePre Jenkinsfile setlocal ft=groovy

" Completion / Syntax
let g:indentLine_setConceal = 0
let g:python_highlight_all = 1
let g:vim_markdown_frontmatter = 1
let g:python_highlight_all = 1
" let g:jedi#completions_enabled = 1
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_completion_start_length = 0
" call deoplete#custom#option('sources', {
" \ '_': ['omni', 'buffer', 'member', 'tag', 'file']
" \ })
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" 
" function! s:goyo_enter()
"     set number
"     set scrolloff=10
"     set showbreak=..,
" endfunction
" 
" autocmd! User GoyoEnter nested call <SID>goyo_enter()

" let g:vim_markdown_conceal = 0
" let g:python3_host_prog = system('which python3')
" let g:python3_host_prog = '/usr/local/opt/asdf/shims/python3'
" let g:python3_host_prog = '/Users/cweed/.pyenv/versions/3.7.3-neovim/bin/python3'
let g:python3_host_prog = '/Users/cweed1/.pyenv/shims/python3'

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
Plug 'Yggdroot/indentLine'

" Completion, lint, etc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'plasticboy/vim-markdown'
Plug 'rodjek/vim-puppet'
Plug 'lepture/vim-jinja'
Plug 'vim-python/python-syntax'
Plug 'junegunn/goyo.vim', {' for': ['markdown', 'text'] }
Plug 'godlygeek/tabular'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'zchee/deoplete-go'
" Plug 'sebastianmarkow/deoplete-rust'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'rust-lang/rust.vim'

" Color
"Plug 'fenetikm/falcon'
"Plug 'w0ng/vim-hybrid'
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
set updatetime=100

if $TERMTERM == 'truecolor'
    set termguicolors
endif

" Colorscheme related
"let g:gruvbox_italic = 1
let &t_ut='' " fixes weird issue in kitty with background erasing, see their readme
set cursorline
set cursorcolumn
hi CursorLine cterm=NONE ctermbg=black
set background=dark
colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_improved_strings=1

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
autocmd FileType ruby setlocal sw=2 ts=2 expandtab
autocmd FileType *.json,json,yaml setlocal sw=2 ts=2
autocmd FileType *.json,json setlocal sw=2 ts=2 conceallevel=0
autocmd FileType python setlocal cc=80
autocmd BufRead,BufNewFile,BufWritePre *.conf setlocal sw=2 ts=2 expandtab syntax=conf smartindent
autocmd BufRead,BufNewFile,BufWritePre Dockerfile,Dockerfile.tmpl setlocal ft=Dockerfile expandtab
autocmd BufRead,BufNewFile,BufWritePre notes setlocal ft=markdown
autocmd BufRead,BufNewFile,BufWritePre Jenkinsfile setlocal ft=groovy

" Completion / Syntax
let g:indentLine_setConceal = 0
let g:python_highlight_all = 1
let g:vim_markdown_frontmatter = 1
let g:python_highlight_all = 1
let g:jedi#completions_enabled = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 0
" call deoplete#custom#option('sources', {
" \ '_': ['omni', 'buffer', 'member', 'tag', 'file']
" \ })
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

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
" let g:go_auto_sameids = 1
" let g:go_auto_type_info = 1
" let g:go_addtags_transform = "snakecase"

" fugitive / gitgutter
" nmap <Leader>gc :Gcommit<CR>
" nmap <Leader>ga :Gcommit --amend<CR>

let g:python3_host_prog = '/Users/cweed/.pyenv/versions/3.7-neovim/bin/python3'
" let g:python3_host_prog = system('pyenv which python3')

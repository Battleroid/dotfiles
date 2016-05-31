set shell=/bin/bash

" Required
set nocompatible

" Plug start
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'klen/python-mode'
Plug 'nvie/vim-flake8', {'for': 'python'}
" Plug 'tweekmonster/braceless.vim', {'for': 'python'}

" Writing
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}

" Colorschemes
Plug 'w0ng/vim-hybrid'
" Plug 'marlun/vim-starwars'
" Plug 'endel/vim-github-colorscheme'

" Requires extra packages
Plug 'davidhalter/jedi-vim', {'for': 'python'}
" Plug 'Valloric/YouCompleteMe'

" Enable only if YCM is not installed
Plug 'ervandew/supertab'

" Go
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go', {'for': 'go'}

" Webdev
Plug 'ap/vim-css-color' , {'for': 'css'}
Plug 'hail2u/vim-css3-syntax', {'for': 'css'}
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'tpope/vim-liquid'
Plug 'Glench/Vim-Jinja2-Syntax'

" End
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

" Colorscheme related
set t_Co=256
let g:hybrid_use_Xresources=1
set background=dark
colorscheme hybrid

" Line and column highlight, helps to keep track of cursor
hi CursorLine cterm=NONE ctermbg=black
set cursorline
set cursorcolumn

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0
" Enable if using syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Tabs & Buffers, replaced by wintabs
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Change gvim font and toolbar options
if has("gui_running")
	set guioptions=-T
	set guioptions=-M
endif

" Folding
set foldmethod=indent
set foldnestmax=5
set nofoldenable

" Markdown
let g:vim_markdown_frontmatter=1
let g:markdown_fenced_languages = ['python', 'java']

" Ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Autoclose
let delimitMate_expand_cr = 1

" Lightline
set laststatus=2

" Autocompletion
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>"]
let g:jedi#popup_on_dot = 0

" Writing
augroup writing
	autocmd!
	autocmd FileType markdown,text setlocal spell
				\ spl=en_us
				\ linebreak
	" autocmd FileType markdown,text spl=en_us
	" autocmd FileType markdown,text linebreak
augroup END

" Python
let g:indentLine_leaderSpaceEnabled = 1
let g:indentLine_leaderSpaceChar = '.'
let g:indentLine_char = '|'
let g:indentLine_fileType = ['python', 'py']
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_virtualenv = 1
autocmd FileType python map <buffer> <F9> :call Flake8()<CR>

" Git
nn <space>ga :Git add %:p<CR><CR>
nn <space>gs :Gstatus<CR>
nn <space>gc :Gcommit -v -q<CR><CR>
nn <space>gw :Gwrite<CR><CR>

" Tagbar
let g:tagbar_open_on_key = 1
if g:tagbar_open_on_key == 1
	nmap <F10> :TagbarToggle<CR>
else
	autocmd VimEnter * nested :call tagbar#autoopen(1)
endif

" Syntastic
let g:syntastic_check_on_wq = 1

" Misc
function! StripWhitespace()
	:%s/\s\+$//e
endfunction
command! -nargs=0 Strip call StripWhitespace()

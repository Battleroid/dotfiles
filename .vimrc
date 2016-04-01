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
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvie/vim-flake8'
Plug 'Raimondi/delimitMate'
Plug 'tweekmonster/braceless.vim', {'for': 'python'}
Plug 'Yggdroot/indentLine'
" Plug 'scrooloose/syntastic'

" Writing
" Plug 'junegunn/goyo.vim'
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
" Plug 'reedes/vim-pencil', {'for': ['text', 'markdown', 'latex']}
Plug 'reedes/vim-litecorrect', {'for': ['text', 'markdown']}
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}

" Colorschemes
Plug 'w0ng/vim-hybrid'
" Plug 'marlun/vim-starwars'
" Plug 'endel/vim-github-colorscheme'

" Requires extra packages
" Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim', {'for': 'python'}

" Enable only if YCM is not installed
Plug 'ervandew/supertab'

" Go
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go', {'for': 'go'}

" Webdev
Plug 'ap/vim-css-color' , {'for': 'css'}
Plug 'hail2u/vim-css3-syntax', {'for': 'css'}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
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
set listchars=tab:\|\ ,eol:↩,trail:·
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
let &colorcolumn=join(range(79,999),",") " highlight past 80 col
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

" Tabs & Buffers, replaced by wintabs
nn tf :tabfirst<CR>
nn tn :tabn<CR>
nn tp :tabp<CR>
nn <C-t> :tabnew<CR>
nn <Leader>cc :tabclose<CR>
nn <Leader>j :res -5<CR>
nn <Leader>k :res +5<CR>
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

" Abbreviations
iab <expr> currdate strftime("%Y-%m-%d")

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

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Atuocompletion
let g:SuperTabDefaultCompletionType = 'context'
let g:jedi#popup_on_dot = 0

" Pencil
" let g:pencil#wrapModeDefault = 'hard'
" function! Pencil()
" 	setl linebreak wrap spell spl=en_us tw=74
" 	call pencil#init({'wrap': 'hard'})
" 	call litecorrect#init()
" endfunction
" autocmd FileType markdown,text,mkd,md call Pencil()

" Writing
augroup writing
	autocmd!
	autocmd FileType markdown,text setl
				\ spell
				\ spl=en_us
				\ linebreak
	autocmd FileType text setl
				\ tw=79
				\ wrap
	autocmd FileType markdown,text :call litecorrect#init()
augroup END

" Python
let g:indentLine_leaderSpaceEnabled = 1
let g:indentLine_leaderSpaceChar = '.'
let g:indentLine_char = '|'
let g:indentLine_fileType = ['python', 'py']
function! Python()
	setl expandtab smartindent tw=79
	let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
	autocmd! FileType python BracelessEnable +indent +fold +highlight
	autocmd! BufWritePost <buffer> call StripWhitespace()
endfunction
autocmd FileType python call Python()

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
let g:tagbar_autofocus = 0
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_left = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" Syntastic
let g:syntastic_check_on_wq = 1

" Misc
autocmd Filetype sourcepawn setlocal makeprg=$HOME/sm/scripting/spcomp\ %

function! StripWhitespace()
	:%s/\s\+$//e
endfunction
command! -nargs=0 Strip call StripWhitespace()

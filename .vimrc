set shell=/bin/bash

" Required
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-bufferline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-fugitive'
Plugin 'nvie/vim-flake8'
Plugin 'Raimondi/delimitMate'
Plugin 'tweekmonster/braceless.vim'

" Markdown writing
" Plugin 'junegunn/goyo.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-pencil'

" Colorschemes
Plugin 'w0ng/vim-hybrid'

" Requires extra packages
" Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

" Enable only if YCM is not installed
Plugin 'ervandew/supertab'

" Go
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" Webdev
" Plugin 'ap/vim-css-color' 
" Plugin 'hail2u/vim-css3-syntax'
" Plugin 'othree/html5.vim'
" Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'mattn/emmet-vim'

" End
call vundle#end()

" Basics
filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set list
set listchars=tab:\|\ ,eol:¬,trail:·
set mouse=
set nu
set scrolloff=4
set shiftwidth=4
set smarttab
set tabstop=4
set wildmenu
set wildmode=longest,list

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

" Tabs & Buffers
nn <C-tab> :tabnext<CR>
nn <C-S-tab> :tabprevious<CR>
nn <C-t> :tabnew<CR>
nn <Leader>cc :tabclose<CR>

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

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Atuocompletion
let g:SuperTabDefaultCompletionType = 'context'
let g:jedi#popup_on_dot = 0

" Pencil
function! Pencil()
	setl linebreak wrap spell spl=en_us tw=80
	call pencil#init({'wrap': 'hard'})
	call litecorrect#init()
endfunction
autocmd FileType markdown,text,mkd,md call Pencil()

" Python
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

" Misc
autocmd Filetype sourcepawn setlocal makeprg=$HOME/sm/scripting/spcomp\ %

function! StripWhitespace()
	:%s/\s\+$//ge
endfunction

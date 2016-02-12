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
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'nvie/vim-flake8'
Plugin 'Raimondi/delimitMate'

" Markdown writing
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-pencil'
" Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-markdown'

" Enable only if YCM is not installed
Plugin 'ervandew/supertab'

" Colorschemes
Plugin 'w0ng/vim-hybrid'

" Requires extra packages
" Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

" Webdev
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color' 
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Glench/Vim-Jinja2-Syntax'

" End
call vundle#end()

" Basics
filetype plugin indent on
syntax on
set nu
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set backspace=indent,eol,start
set listchars=tab:\|\ 
set list
set scrolloff=4
set wildmenu
set wildmode=longest,list

" Colorscheme related
set t_Co=256
let g:hybrid_use_Xresources=1
set background=dark
colorscheme hybrid

" Line and column highlight, helps to keep track of cursor
hi CursorLine cterm=NONE ctermbg=black
let &colorcolumn=join(range(80,999),",") " highlight past 80 col
set cursorline
set cursorcolumn

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
" let g:vim_markdown_frontmatter=1
autocmd Filetype markdown,mkd,md setlocal linebreak tw=80
let g:markdown_fenced_languages = ['python', 'java']

" Ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Autoclose
let delimitMate_expand_cr = 1

" Lightline
set laststatus=2

" stuff
autocmd Filetype python let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
autocmd Filetype python setlocal expandtab
autocmd Filetype sourcepawn setlocal makeprg=$HOME/sm/scripting/spcomp\ %

" Eclim
" let g:EclimJavaValidate = 1
" let g:EclimValidateSortresults = 'severity'
" autocmd Filetype java let g:EclimCompletionMethod = 'omnifunc'
" autocmd Filetype java let g:SuperTabDefaultCompletionType = 'context'

" Pencil
augroup pencil
	autocmd!
	autocmd FileType markdown,mkd,md call pencil#init()
		\ | call litecorrect#init()
		\ | setlocal spell
		\ | setlocal spl=en_us
		\ | setlocal tw=80
	    \ | let g:pencil#wrapModeDefault = 'soft'
	    \ | let g:airline_section_x = '%{PencilMode()}'
	autocmd FileType text call pencil#init({'wrap': 'hard'})
		\ | call litecorrect#init()
		\ | setlocal spell
		\ | setlocal spl=en_us
		\ | setlocal tw=80
	    \ | let g:pencil#wrapModeDefault = 'soft'
	    \ | let g:airline_section_x = '%{PencilMode()}'
augroup END

" YCM
" let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

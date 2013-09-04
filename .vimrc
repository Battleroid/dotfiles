" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'xuhdev/SingleCompile'
Bundle 'Valloric/YouCompleteMe'
Bundle 'benmills/vimux'
Bundle 'othree/html5.vim'
Bundle 'dhruvasagar/vim-table-mode'
Bundle 'Townk/vim-autoclose'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline' 
Bundle 'bling/vim-bufferline'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'chrisbra/SudoEdit.vim'
" Bundle 'davidhalter/jedi-vim'
" Bundle 'Rip-Rip/clang_complete'
" Bundle 'majutsushi/tagbar'
" Bundle 'ervandew/supertab'
" Bundle 'ap/vim-css-color'
" Bundle 'vim-scripts/Align'

" GUI
if has("gui_running")
	set background=dark
	colorscheme jellybeans
	set guifont=Terminus\ 11
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	let g:solarized_termcolors=256
endif

" Interface
syntax on
filetype plugin indent on
if !has("gui_running")
	set t_Co=256
	set background=dark
	colorscheme jellybeans
endif
au BufRead,BufNewFile *.txt set ft=sh
hi TabLineFill ctermfg=NONE ctermbg=233
hi TabLine ctermfg=241 ctermbg=233
hi TabLineSel ctermfg=250 ctermbg=233
set cursorline
set more
set number
set title
set showcmd
set wildmenu
set wildmode=longest,list
set wildignore=.bak,.pyc,.o,.a,.avi,.mkv,.jpg,.jpeg,.png,.so,.gif
set scrolloff=3

" General
set hidden
set history=1000
set laststatus=2
set iskeyword+=_,$,#,@,%
set linebreak
set nostartofline
set shortmess+=I
set splitbelow
set splitright
set ttyfast
set lazyredraw
set nowrap
set noshowmode

" Files
set autochdir
set autoread
set confirm
set noautowrite
set updatecount=50
set backupdir=~/.vim/backup,/tmp
set undofile
set undodir=~/.vim/undo,/tmp

" Formatting
set backspace=indent,eol,start
set ignorecase
set autoindent
set nrformats+=alpha
set shiftround
set shiftwidth=2
set tabstop=2
set smarttab
set smartcase
set cinkeys-=0#

" Keys
let mapleader=","
noremap <leader>ve :edit $HOME/.vimrc<CR>
noremap <leader>vs :source $HOME/.vimrc<CR>
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
nnoremap gn :bn<CR>
nnoremap gN :bn<CR>
nnoremap gd :bn<CR>

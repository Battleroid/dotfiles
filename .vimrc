" Vundle related material
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

" YCM requires vim 7.3.5xx+! Compile Vim 7.4 instead with options:
" --enable-pythoninterp --enable-rubyinterp --enable-perlinterp --with-features=huge

" Interface
filetype plugin indent on
syntax on
if !has("gui_running")
        set t_Co=256
        set background=dark
        colors jellybeans
endif
if has("gui_running")
        set guifont=Terminus\ 11
        set guioptions-=T
        set guioptions-=m
        set guioptions-=r
endif
au BufRead,BufNewFile *.txt set ft=sh
hi TabLineFill ctermfg=NONE ctermbg=233
hi TabLine ctermfg=241 ctermbg=233
hi TabLineSel ctermfg=250 ctermbg=233
set cursorline
set more
set number
set scrolloff=3
set showcmd
set title
set wildignore=.bak,.pyc,.a,.o,.avi,.mkv,.png,.jpg,.jpeg,.gif,.so
set wildmenu
set wildmode=longest,list

" General
set hidden
set encoding=utf-8
set history=1000
set iskeyword+=_,$,@,%,#
set laststatus=2
set linebreak
set noshowmode
set noexrc
set nowrap
set numberwidth=5
set shortmess+=I
set splitbelow
set splitright
set ttyfast
set foldcolumn=0
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=99
set gdefault
set incsearch
set matchtime=2
set matchpairs+=<:>
set showmatch

" Files
set autochdir
set autoread
set confirm
set backspace=indent,eol,start
set noautowrite
set updatecount=50
if has("persistent_undo") && exists("&undodir")
        set undodir=$HOME/.vim/undo/
        set undofile
        set undolevels=500
        set undoreload=10000
endif
set autoindent
set cinkeys-=0#
set ignorecase
set shiftwidth=2
set tabstop=2
set smartcase
set smarttab
set nrformats+=alpha
set shiftround
au FileType c,cpp setlocal comments -=:// comments +=f://

" Keybinds
let mapleader=","
noremap <leader>ve :edit $HOME/.vimrc<CR>
noremap <leader>vs :source $HOME/.vimrc<CR>
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" Buffers
nnoremap gn :bn<CR>
nnoremap gN :bn<CR>
nnoremap gd :bn<CR>

" Plugins
let g:NERDTreeWinPos = "left"

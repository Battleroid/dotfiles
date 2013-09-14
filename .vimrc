" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Required
Bundle 'gmarik/vundle'

" Bundles
" Bundle 'dhruvasagar/vim-table-mode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Rip-Rip/clang_complete'
Bundle 'Townk/vim-autoclose'
Bundle 'ap/vim-css-color'
Bundle 'benmills/vimux'
Bundle 'bling/vim-airline' 
Bundle 'bling/vim-bufferline'
Bundle 'chrisbra/SudoEdit.vim'
Bundle 'ervandew/supertab'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/Align'
Bundle 'xuhdev/SingleCompile'

" YouCompleteMe needs 7.3.5xx+, compile with --enable-pythoninterp
" Bundle 'Valloric/YouCompleteMe'

" jedi-vim requires Python be installed with jedi package installed
" Bundle 'davidhalter/jedi-vim'

" GUI
if has("gui_running")
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
set smartindent
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

" 80 column highlight
let g:overlength_enabled = 0
highlight OverLength ctermbg=DarkRed ctermfg=white guibg=#212121
function! ToggleOverLengthHighlight()
	if g:overlength_enabled == 0
		match OverLength /\%80v.*/
		let g:overlength_enabled = 1
		echo 'Overlength On'
	else
		match
		let g:overlength_enabled = 0
		echo 'Overlength Off'
	endif
endfunction
nnoremap <leader>h :call ToggleOverLengthHighlight()<CR>

" Relative numbering toggle
nnoremap <leader>r :call NumberToggle()<CR>
function! NumberToggle()
	if (&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunction

" Remove empty lines
function! DeleteEmptyLines()
	g/^\_$\n\_^$/d
endfunction
nnoremap <leader>ld :call DeleteEmptyLines()<CR>

" Misc
map <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
set cc=80 " experimental
set textwidth=80 " experimental 
let NERDTreeShowHidden = 1

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'Solarized'
Bundle 'ctrlp.vim'
Bundle 'opencl.vim'

filetype plugin indent on
syntax on

set shm=atI
set enc=utf-8
set ts=4 sw=4 et
set incsearch
set ruler
set smartindent smarttab
set nobackup noswapfile
set laststatus=2

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_enable_branch=0
let g:airline_enable_syntastic=0
let g:airline_section_b="%f"
let g:airline_section_c=''
let g:airline_section_x=''
let g:airline_section_y="%Y"

let mapleader = " "
no j gj
no k gk
no <c-j> 6j
no <c-k> 6k
no <c-a> ^
no <c-e> $
no <leader>h <c-w>h
no <leader>j <c-w>j
no <leader>k <c-w>k
no <leader>l <c-w>l
no <c-p> :CtrlP<CR>

if has("gui_running")
  set go-=T
  set go-=r
  set nu
  set noeb vb t_vb=
  set showtabline=1
  set lines=35
  set columns=85
  set guifont=Consolas:h11
  set bg=light
  colorscheme solarized
endif

au BufNewFile,BufRead * setlocal formatoptions-=cro
au BufNewFile,BufRead *.cl setlocal ft=opencl
au FileType c setlocal ts=8 sw=8 noet fo+=tcqlron com-=:// com+=f:// cino=:0,l1,t0,g0
au FileType cpp setlocal ts=4 sw=4 et matchpairs+=<:>
au FileType lua setlocal ts=2 sw=2 et
au FileType ruby setlocal sw=2 ts=2
au FileType vim setlocal sw=2 ts=2

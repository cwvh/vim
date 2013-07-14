set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'bling/vim-airline'

Bundle 'kien/rainbow_parentheses.vim.git'
Bundle 'tpope/vim-fugitive'
Bundle 'juvenn/mustache.vim'
Bundle 'Solarized'
Bundle 'jnwhiteh/vim-golang'
Bundle 'haskell.vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'ujihisa/neco-ghc'
Bundle 'pbrisbin/html-template-syntax'
Bundle 'adimit/prolog.vim'

filetype plugin indent on
syntax on

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_enable_fugitive=0
let g:airline_enable_syntastic=0
let g:airline_section_b="%f"
let g:airline_section_c=''
let g:airline_section_x=''
let g:airline_section_y="%Y"

call unite#filters#matcher_default#use(['matcher_fuzzy'])
noremap <leader>f :<C-u>Unite -start-insert file_rec/async:!<CR>
noremap <leader>m :<C-u>Unite file_mru<CR>
"noremap <space>/ :Unite grep:.<cr>
"noremap <space>s :Unite -quick-match buffer<cr>

set shm=atI
set enc=utf-8
set ts=4 sw=4 sts=4 et
set incsearch
set ruler
set smartindent smarttab
set nobackup noswapfile
set laststatus=2

set t_Co=256
set bg=light
colorscheme default

au BufNewFile,BufRead * setlocal formatoptions-=cro
au VimEnter * RainbowParenthesesToggle

au BufNewFile,BufRead *.pl :set ft=prolog

" Correct some spelling mistakes
ia teh the
ia htis this
ia tihs this
ia funciton function
ia funtion function
ia fucntion function
ia functino function
ia retunr return
ia reutrn return
ia forach foreach
ia foreahc foreach
ia wheil while
ia whiel while
ia incldue include

no j gj
no k gk
no <c-j> 6j
no <c-k> 6k
no <c-a> ^
no <c-e> $

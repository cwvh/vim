set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/,$GOROOT/misc/vim/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/rainbow_parentheses.vim.git'
Bundle 'tpope/vim-fugitive'
Bundle 'derekwyatt/vim-scala'
Bundle 'juvenn/mustache.vim'
Bundle 'Command-T'
Bundle 'Solarized'
Bundle 'jnwhiteh/vim-golang'
Bundle 'haskell.vim'
Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'ujihisa/neco-ghc'
Bundle 'pbrisbin/html-template-syntax'

filetype plugin indent on
syntax on

set shm=atI
set enc=utf-8
set ts=4 sw=4 sts=4 et
set incsearch
set ruler
set smartindent smarttab
set nobackup noswapfile

set t_Co=256
set bg=light
colorscheme default

au BufNewFile,BufRead * setlocal formatoptions-=cro
au VimEnter * RainbowParenthesesToggle

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

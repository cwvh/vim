set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/,$GOROOT/misc/vim/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/rainbow_parentheses.vim.git'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'derekwyatt/vim-scala'
Bundle 'juvenn/mustache.vim'
Bundle 'Command-T'
Bundle 'Solarized'
Bundle 'jnwhiteh/vim-golang'
Bundle 'haskell.vim'
Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'ujihisa/neco-ghc'

filetype plugin indent on
syntax on

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

au VimEnter * RainbowParenthesesToggle
let g:Powerline_symbols = 'fancy'
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

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

no <c-j> 6j
no <c-k> 6k
no <c-a> ^
no <c-e> $
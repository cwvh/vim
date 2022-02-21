let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/Align'
call plug#end()

set ts=4 sw=4 sts=4 et
set nobackup noswapfile
set nu
set incsearch nohlsearch
set mouse=nic
set t_BE=   " prevent bracketed paste in terminal on vim exit
set ttymouse=xterm2

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_b="%f %{airline#util#wrap(airline#extensions#branch#get_head(),20)}"
let g:airline_section_c=''
let g:airline_section_x=''
let g:airline_section_y="%Y"
let g:airline#extensions#fugitiveline#enabled=1

" Navigation
no <c-p> :Files<CR>
no <c-b> :Buffers<CR>
no <c-h> :History<CR>
no <c-f> :Rg<CR>
no <leader>d :exe ':Rg ' . expand('<cword>')<CR>
" toggle between buffers
noremap <leader><leader> <c-^>
noremap <c-j> :cnext<cr>
noremap <c-k> :cprev<cr>

if has("gui_running")
  set go-=m
  set go-=T
  set go-=r
  set go-=L
  set noeb vb t_vb=
  set showtabline=1
  set lines=45
  set columns=85
  colorscheme solarized
  set bg=light
else
  colorscheme default
  set bg=dark
endif

au InsertLeave * set nopaste    "Leave paste mode when leaving insert mdoe
au BufNewFile,BufRead * setlocal formatoptions-=ro
au BufNewFile,BufRead *.md setlocal ft=markdown
au FileType c setlocal ts=4 sw=4 et fo+=tcqlron com-=:// com+=f:// cino=:0,l1,t0,g0
au FileType cpp setlocal ts=4 sw=4 et matchpairs+=<:> cinoptions=g1
au FileType lua setlocal ts=2 sw=2 et
au FileType vim setlocal sw=2 ts=2
au FileType go setlocal ts=4 sw=4 noet
au FileType html,xml setlocal ts=2 sw=2 ts=2 et
au FileType python setlocal nosmartindent

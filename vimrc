set nocompatible
filetype off

execute pathogen#infect()

set shm=atI
set ts=4 sw=4 et
set nobackup noswapfile
set mouse=a

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

set bg=light
if has("gui_running")
  set go-=T
  set go-=r
  set go-=L
  set noeb vb t_vb=
  set showtabline=1
  set lines=45
  set columns=85
  if has("win32")
    set guifont=Consolas:h11
  elseif has("macunix")
    set guifont=Anonymous\ Pro:h13
  endif
  colorscheme solarized
else
  colorscheme default
endif

if has("win32")
  au BufWritePost _vimrc source ~/vimfiles/vimrc
else
  au BufWritePost .vimrc source ~/.vimrc
endif

au BufNewFile,BufRead * setlocal formatoptions-=cro
au BufNewFile,BufRead *.cl setlocal ft=opencl
au BufNewFile,BufRead *.md setlocal ft=markdown
au FileType c setlocal ts=4 sw=4 et fo+=tcqlron com-=:// com+=f:// cino=:0,l1,t0,g0
au FileType cpp setlocal ts=2 sw=2 et matchpairs+=<:> cinoptions=g1
au FileType lua setlocal ts=2 sw=2 et
au FileType ruby setlocal sw=2 ts=2
au FileType vim setlocal sw=2 ts=2
au FileType haskell,cabal setlocal sw=2 ts=2
"au FileType go autocmd BufWritePre <buffer> Fmt
au FileType go setlocal ts=4 sw=4 noet
au FileType html,xml setlocal ts=2 sw=2 ts=2 et
au FileType python setlocal nosmartindent

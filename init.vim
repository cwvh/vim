let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'

" Navigation and search
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-racer'
Plug 'racer-rust/vim-racer'

" Language
Plug 'w0rp/ale'
Plug 'rust-lang/rust'

" Runtime
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/Align'

" Themes and colors
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
call plug#end()

" Lint
let g:ale_rust_cargo_use_check = 1

set shm=atI
set ts=4 sw=4 et
set nobackup noswapfile
set nu
set nohlsearch
"set mouse=a
set t_BE=   " needed to prevent bracketed paste in terminal on vim exit

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_enable_branch=0
let g:airline_enable_syntastic=0
let g:airline_section_b="%f"
let g:airline_section_c=''
let g:airline_section_x=''
let g:airline_section_y="%Y"

" Navigation
map <c-p> :Files<CR>
"no j gj
"no k gk
no <leader>h <c-w>h
no <leader>j <c-w>j
no <leader>k <c-w>k
no <leader>l <c-w>l
" toggle between buffers
noremap <leader><leader> <c-^>
noremap <c-j> :cnext<cr>
noremap <c-k> :cprev<cr>
" toggle between all number modes (none, nu, rnu, and rnu+nu)
nmap <silent> <F3> :exe 'set nu!' &nu ? 'rnu!' : ''<CR>

" Autocommands
" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Rust stuff
set hidden  " don't attempt to save the buffer when doing rust/racer go-to-def
"let g:racer_experimental_completer = 1  " show complete function definition when completing
let g:rustfmt_command = 'rustfmt +nightly'
let g:rust_clip_command = 'xclip -selection clipboard'
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Completion
" Tab to move forward. Shift-Tab to move backwards. Don't let <Enter> turn into a '\n' in the buffer.
inoremap <expr> <Tab> (pumvisible() ? (empty(v:completed_item) ? "\<C-n>" : "\<C-y>"): "\<Tab>")
inoremap <expr> <CR> (pumvisible() ? (empty(v:completed_item) ? "\<CR><CR>" : "\<C-y>"): "\<CR>")
inoremap <expr> <S-Tab> (pumvisible() ? (empty(v:completed_item) ? "\<C-p>" : "\<C-y>"): "\<S-Tab>")
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Copy and paste
" <leader>p pastes clipboard into buffer
" <leader>c copies entire buffer into clipboard (TODO detect selected and only copy that)
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

if has("gui_running")
  set go-=m
  set go-=T
  set go-=r
  set go-=L
  set noeb vb t_vb=
  set showtabline=1
  set lines=45
  set columns=85
  set bg=light
  if has("win32")
    set guifont=Consolas:h11
  elseif has("macunix")
    set guifont=Anonymous\ Pro:h13
  endif
  colorscheme solarized
else
  set bg=dark
  colorscheme gruvbox
endif

if has("win32")
  au BufWritePost _vimrc source ~/vimfiles/vimrc
else
  au BufWritePost .vimrc source ~/.vimrc
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " See also http://snk.tuxfamily.org/lov/vim-256color-bce.html
  set t_ut=
endif

au BufNewFile,BufRead * setlocal formatoptions-=cro
au BufNewFile,BufRead *.cl setlocal ft=opencl
au BufNewFile,BufRead *.md setlocal ft=markdown
au FileType c setlocal ts=4 sw=4 et fo+=tcqlron com-=:// com+=f:// cino=:0,l1,t0,g0
au FileType cpp setlocal ts=4 sw=4 et matchpairs+=<:> cinoptions=g1
au FileType lua setlocal ts=2 sw=2 et
au FileType ruby setlocal sw=2 ts=2
au FileType vim setlocal sw=2 ts=2
au FileType haskell,cabal setlocal sw=2 ts=2
au FileType go setlocal ts=4 sw=4 noet
au FileType html,xml setlocal ts=2 sw=2 ts=2 et
au FileType python setlocal nosmartindent

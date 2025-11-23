let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
call plug#end()

set ts=4 sw=4 sts=4 et
set nobackup noswapfile
set nu
set incsearch nohlsearch
set mouse=nic
set t_BE=   " prevent bracketed paste in terminal on vim exit
if !has('nvim')
  set ttymouse=xterm2
endif
set cc=80
set autochdir

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_b="%f %{airline#util#wrap(airline#extensions#branch#get_head(),20)}"
let g:airline_section_c=''
let g:airline_section_x=''
let g:airline_section_y="%Y"
let g:airline#extensions#fugitiveline#enabled=1

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Navigation
for [key, cmd] in [
      \ ['t', 'Files'],
      \ ['p', 'GitFiles'],
      \ ['b', 'Buffers'],
      \ ['h', 'History'],
      \ ['f', 'Rg'],
      \ ]
  execute printf('nnoremap <c-%s> :%s<CR>', key, cmd)
  execute printf('nnoremap <leader>%s :%s<CR>', key, cmd)
endfor

no <leader>gb :Git blame<CR>
no <leader>d :exe ':Rg ' . expand('<cword>')<CR>

noremap <c-j> :cnext<cr>
noremap <c-k> :cprev<cr>
noremap <c-u> <c-u>zz
noremap <c-d> <c-d>zz
noremap n nzz
noremap N Nzz
" copy-paste with tmux
no <leader>c :w !tmux load-buffer -<CR>
no <leader>v :r !tmux save-buffer -<CR>
" random shortcuts
no <leader>r :RustFmtRange<CR>
no <leader>R :RustFmt<CR>

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
au FileType rust setlocal cc=80 textwidth=80

function! TmuxYank()
  let buffer=system('base64 -w0', @0)
  let buffer=substitute(buffer, "\n$", "", "")
  let buffer='\e]52;c;'.buffer.'\x07'
  silent exe "!echo -ne ".shellescape(buffer)." > ".system("tmux display -p '#{pane_tty}'")
endfunction

" Autoforward yank events.
set clipboard+=unnamedplus
augroup TmuxYankAuto
  autocmd!
  autocmd TextYankPost * if v:event.operator ==# 'y' | call TmuxYank() | endif
augroup END

inoremap <expr> <c-j> ("\<C-n">)
inoremap <expr> <c-k> ("\<C-p">)

nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

inoremap jk <Esc>
inoremap kj <Esc>

inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

nnoremap <C-s> :w<CR>
nnoremap <C-Q> :wq!<CR>
nnoremap <C-c> <Esc>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
vnoremap < <gv
vnoremap > >gv

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

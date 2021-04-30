let mapleader = "\<Space>"

inoremap jk <esc>
inoremap kj <esc>

nmap <leader>sv :source $MYVIMRC<cr>
nmap <leader>ev :split ~/dotfiles/vim/.vimrc<cr>
nmap <leader>- :split<cr>
nmap <leader>\ :vsplit<cr>
nmap <leader>q <C-w>q
nmap <leader><Up> :exe "resize " . (winheight(0) + 5)<cr>
nmap <leader><Down> :exe "resize " . (winheight(0) -5)<cr>
nmap <leader><Left> :exe "vertical resize " . (winwidth(0) + -5)<cr>
nmap <leader><Right> :exe "vertical resize " . (winwidth(0) + 5)<cr>

noremap <leader>rw :e .<cr>

nnoremap a A
nnoremap A a
nnoremap <leader>z :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
nnoremap <C-p> :All<cr>

nnoremap <leader>p :Prettier<cr>


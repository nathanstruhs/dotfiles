" Set location of .viminfo
set viminfo+=n~/dotfiles/vim/viminfo

" Colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme alduin
highlight LineNr ctermfg=green
highlight CursorLineNr ctermfg=LightBlue

" Tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Indententation
set autoindent
set smartindent

" Line Numbers
set number
set nuw=3

" Highlight the line that the cursor is on
set cursorline

" A split will default to being created under or to the right of the current
set splitbelow splitright

" Always show diffs vertically
set diffopt=vertical

" Show a statusline always
set laststatus=2

" netrw 
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20

" Syntax highlighting
syntax on

" search
set ignorecase
set smartcase

" Highlight searched term, bind \ to clear highlighting but search terms and 'n' works
set hlsearch
noremap <silent> \ :silent nohlsearch<cr>

" --- Remove duplicated INSERT status
set noshowmode

" --- Set colorscheme
let g:lightline = {
\   'colorscheme': 'Tomorrow_Night_Eighties',
\   'active': {
\        'left': [ [ 'mode', 'paste' ], 
\                  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\   },
\   'component_function': {
\       'gitbranch': 'FugitiveHead',
\       'filename': 'FilenameForLightline'
\   }
\ }
 
" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

" Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Ale - Error linting and autocompletion
let g:ale_completion_enabled = 1

" FZF - setup ctrl-p command
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))



" Set location of .viminfo
set viminfo+=n~/dotfiles/vim/viminfo

" Colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" colorscheme alduin
highlight LineNr ctermfg=green
highlight CursorLineNr ctermfg=LightBlue
let g:better_whitespace_guicolor='deepskyblue'

" Tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Encoding
set encoding=UTF-8

" Indententation
set autoindent
set smartindent

" Line Numbers
set number relativenumber
set nuw=3

" Scrolls when 8 lines from top or bottom
set scrolloff=8

" Highlight the line that the cursor is on
set cursorline

" Copy to clipboard
set clipboard^=unnamed,unnamedplus

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
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" FZF - setup ctrl-p command
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Close tag
let g:closetag_filenames = '*.html,*.vue'
let g:closetag_filetypes = 'html,vue'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Vue
let g:vue_pre_processors = ['scss']

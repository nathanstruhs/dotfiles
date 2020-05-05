set nocompatible
filetype off
set rtp+=~/dotfiles/vim/bundle/Vundle.vim
call vundle#begin('~/dotfiles/vim/bundle')
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'AlessandroYorba/Alduin'
  Plugin 'junegunn/fzf.vim'
  Plugin 'jremmen/vim-ripgrep'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'christoomey/vim-tmux-runner'
  Plugin 'itchyny/lightline.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'vim-scripts/camelcasemotion'
  Plugin 'tpope/vim-endwise'
  Plugin 'preservim/nerdcommenter'
  Plugin 'mhinz/vim-startify'
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on

set rtp+=/usr/local/opt/fzf


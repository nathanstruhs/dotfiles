fpath+=$HOME/dotfiles/zsh/themes/pure
autoload -U promptinit; promptinit
prompt pure

export PATH=$PATH:/$HOME/dotfiles/bin

tmux source $HOME/dotfiles/tmux/.tmux.conf

source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/aliases-work.zsh
source $HOME/dotfiles/zsh/functions.zsh

HISTFILE=$HOME/dotfiles/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000

MYVIMRC=$HOME/.config/nvim/.init.vim
VIMINIT=$HOME/.config/nvim/.init.vim

# Git autocomplete
autoload -Uz compinit && compinit

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'


export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

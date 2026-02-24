# Theme
fpath+=$HOME/dotfiles/zsh/pure
autoload -U promptinit; promptinit
prompt pure

export PATH="/opt/homebrew/Cellar/mysql@5.7/5.7.43/bin:$PATH"

export PATH=$PATH:/$HOME/dotfiles/bin
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
export PATH="$HOME/.local/bin:$PATH"

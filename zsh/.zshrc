fpath+=$HOME/dotfiles/zsh/themes/pure
autoload -U promptinit; promptinit
prompt pure

export PATH=$PATH:/$HOME/dotfiles/bin

tmux source $HOME/dotfiles/tmux/.tmux.conf

source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/functions.zsh

HISTFILE=$HOME/dotfiles/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000

MYVIMRC=$HOME/.config/nvim/.init.vim
VIMINIT=$HOME/.config/nvim/.init.vim

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.6.5


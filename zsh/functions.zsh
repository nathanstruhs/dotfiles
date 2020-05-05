# Git
gcm() { git commit -m "$1" }
gcam() { git commit -am "$1" }
gco() { git checkout "$1" }

# Mkdir and cd into directory
mcd() { mkdir -p "$1" && cd "$1" }

# Always run tmux on startup
_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}
ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}
ensure_tmux_is_running

server() {
  workdir="$HOME/work/"

  case $(pwd) in
    "${workdir}g5-call-tracking" ) rs 3001;;
    *                            ) echo "Invalid directory. To update: \"v ~/dotfiles/zsh/functions.zsh\"";;
  esac
}

rs() { rails s -p "$1" }


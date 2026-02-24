alias vector='cd ~/vector/'
alias vsm='cd ~/vector/vector-sequelize-model'
alias vaa='cd ~/vector/vector-application-api'
alias vbw='cd ~/vector/vector-backend-worker'
alias voh='cd ~/vector/vector-order-handler'
alias vwa='cd ~/vector/vector-web-app'
alias vin='cd ~/vector/vector-internal'

tunnel() {
  local profile="${1:-dev}"
  local flags="${@:2}"
  aws sso login --profile "$profile" &&
  cd $HOME/vector/vector-infrastructure/scripts &&
  ./tunnel-mysql.sh -p "$profile" $flags
}

_tunnel-loop() {
  local env="$1" port="$2"
  shift 2
  local failures=0
  while true; do
    $HOME/vector/vector-infrastructure/scripts/tunnel-mysql.sh -p "$env" -P "$port" $@
    ((failures++))
    if [ $failures -ge 3 ]; then
      echo "[$env] tunnel failed 3 times, giving up"
      return 1
    fi
    echo "[$env] tunnel dropped (attempt $failures/3), restarting in 5s..."
    sleep 5
  done
}

tunnel-all() {
  setopt local_options NO_MONITOR
  local -A ports=(dev 33060 staging 33061 prod 33062 qa 33063 demo 33064)
  local logdir="$HOME/.tunnel-logs"
  local db_type=""
  local extra_args=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -d|--db-type) db_type="$2"; shift 2 ;;
      *) extra_args+=("$1"); shift ;;
    esac
  done

  mkdir -p "$logdir"
  pkill -f tunnel-mysql.sh 2>/dev/null
  pkill -f "ssh.*ec2-user.*-NL.*:3306" 2>/dev/null
  sleep 2

  local running=true
  trap 'kill $(jobs -p) 2>/dev/null; echo "\nAll tunnels stopped."; running=false' INT TERM

  aws sso login --sso-session vectorremote || { echo "SSO login failed"; return 1; }

  local db_args=()
  [[ -n "$db_type" ]] && db_args=(-d "$db_type")

  export AWS_NONINTERACTIVE=1
  for env in dev staging prod qa demo; do
    _tunnel-loop "$env" "${ports[$env]}" "${db_args[@]}" "${extra_args[@]}" < /dev/null > "$logdir/$env.log" 2>&1 &
  done
  unset AWS_NONINTERACTIVE

  local mode="READ-ONLY"
  local mode_color="\e[32m"
  if [[ -n "$db_type" ]]; then
    mode="READ-WRITE ($db_type)"
    mode_color="\e[31m"
  fi

  local -A colors=(dev "\e[32m" staging "\e[33m" prod "\e[31m" qa "\e[36m" demo "\e[35m")
  echo ""
  echo "\e[36m  ╔════════════════════════════════════════════╗"
  echo "  ║  _____ _   _ _  _ _  _ ___ _               ║"
  echo "  ║ |_   _| | | | \\| | \\| | __| |              ║"
  echo "  ║   | | | |_| | .  | .  | _|| |__            ║"
  echo "  ║   |_|  \\___/|_|\\_|_|\\_|___|____|           ║"
  echo "  ║  _____ _____      ___  _                   ║"
  echo "  ║ |_   _/ _ \\ \\    / / \\| |                  ║"
  echo "  ║   | || (_) \\ \\/\\/ /| .  |                  ║"
  echo "  ║   |_| \\___/ \\_/\\_/ |_|\\_|                  ║"
  echo "  ╠════════════════════════════════════════════╣\e[0m"
  printf "  \e[36m║\e[0m  ${mode_color}Mode: %-36s\e[0m\e[36m║\e[0m\n" "$mode"
  echo "  \e[36m╠════════════════════════════════════════════╣\e[0m"
  for env in dev staging prod qa demo; do
    printf "  \e[36m║\e[0m  ${colors[$env]}%-42s\e[0m\e[36m║\e[0m\n" "$env -> localhost:${ports[$env]}"
  done
  echo "  \e[36m╠════════════════════════════════════════════╣"
  printf "  \e[36m║\e[0m  Logs: %-36s\e[36m║\e[0m\n" "$logdir/"
  echo "  \e[36m║\e[0m  Press Ctrl+C to stop all tunnels.         \e[36m║\e[0m"
  echo "  \e[36m╚════════════════════════════════════════════╝\e[0m"
  echo ""
  while $running; do sleep 1; done
}
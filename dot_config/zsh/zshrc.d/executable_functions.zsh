#!/bin/zsh
ghce() {
  unset -f ghce
  eval "$(gh copilot alias -- zsh)"
  ghce "$@"
}
ghcs() {
  unset -f ghcs
  eval "$(gh copilot alias -- zsh)"
  ghcs "$@"
}

mkcd() {
  mkdir -p "$1" && cd "$1" || return
}

yy() {
  local tmp
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd" || exit
  fi
  rm -f -- "$tmp"
}
br() {
  local cmd cmd_file code
  cmd_file=$(mktemp)
  if broot --outcmd "$cmd_file" "$@"; then
    cmd=$(<"$cmd_file")
    command rm -f "$cmd_file"
    eval "$cmd"
  else
    code=$?
    command rm -f "$cmd_file"
    return "$code"
  fi
}

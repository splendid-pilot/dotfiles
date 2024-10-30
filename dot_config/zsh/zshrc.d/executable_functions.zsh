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

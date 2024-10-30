#!/bin/zsh

_fzf_compgen_path() {
  fd --hidden --exclude ".git" --exclude ".github" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" --exclude ".github" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd) fzf --preview 'tree -C {} | head -200' "$@" ;;
    export | unset) fzf --preview "eval 'echo \$'{}" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    nvim) fzf --preview 'bat -n --color=always {}' "$@" ;;
    *) fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

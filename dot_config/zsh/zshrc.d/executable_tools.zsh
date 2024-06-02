#!/bin/zsh
if command -v jump >/dev/null; then
  eval "$(jump shell zsh)"
fi

if command -v thefuck >/dev/null; then
  eval "$(thefuck --alias)"
fi

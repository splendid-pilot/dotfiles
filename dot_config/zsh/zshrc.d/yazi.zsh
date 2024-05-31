#!/usr/bin/env zsh

plugins=(
  'DreamMaoMao/fg.yazi'
  'Reledia/miller.yazi'
  'Reledia/glow.yazi'
  'Reledia/hexyl.yazi'
  'ndtoan96/ouch.yazi'
  # 'DreamMaoMao/mime.yazi'
  'DreamMaoMao/fg.yazi'
)

update_yazi() {
  root="$HOME/.config/yazi/plugins"

  for plugin in "${plugins[@]}"; do
    IFS='/' read -r name dir <<<"$plugin"
    echo "$dir"
    if [[ -d "$root/$dir" ]]; then
      cd "$root/$dir"
      git pull
    else
      git clone "https://github.com/$plugin" "$root/$dir"
    fi
  done
}

#!/bin/bash

plugins=(
	'DreamMaoMao/fg.yazi'
	'Reledia/miller.yazi'
	'Reledia/glow.yazi'
	'Reledia/hexyl.yazi'
	'ndtoan96/ouch.yazi'
	'DreamMaoMao/mime.yazi'
	'DreamMaoMao/fg.yazi'
)

root="$HOME/.config/yazi/plugins/"

for plugin in "${plugins[@]}"; do
	name=(${plugin//\// })
	dir="${name[1]}"
	repo="$plugin"

	if [ ! -d "$root/$dir" ]; then
		echo "plugin $dir not installed"
		git clone "https://github.com/$repo" "$root/$dir"
	fi
done

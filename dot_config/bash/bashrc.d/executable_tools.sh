#!/bin/bash
if [ -f "$HOME/.local/bin/oh-my-posh" ]; then
	eval "$(oh-my-posh init bash --config ~/.local/share/omp/1_shell.json)"
fi

if [ -x /usr/bin/jump ]; then
	eval "$(jump shell bash)"
fi

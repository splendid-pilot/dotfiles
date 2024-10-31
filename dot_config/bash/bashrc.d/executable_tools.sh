#!/bin/bash
if command -v jump >/dev/null; then
	eval "$(jump shell bash)"
fi

if command -v thefuck >/dev/null; then
	eval "$(thefuck --alias)"
fi

if command -v direnv >/dev/null; then
	eval "$(direnv hook bash)"
fi

if command -v zoxide >/dev/null; then
	eval "$(zoxide init bash)"
fi

if command -v fzf >/dev/null; then
	eval "$(fzf --bash)"
fi

if command -v oh-my-posh >/dev/null; then
	eval "$(oh-my-posh init bash --config "$XDG_CONFIG_HOME"/oh-my-posh/1_shell.toml)"
fi

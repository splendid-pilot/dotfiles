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
vg() {
	local config
	config=$(fd --max-depth 1 --glob 'nvim*' ~/.config | gum choose --header="Choose which neovim distribution to run." --header.foreground="150" --limit=1)

	if [ $config = "user aborted" ]  && echo "No config selected" && return
	NVIM_APPNAME=$(basename "$config") nvim "$@"
}


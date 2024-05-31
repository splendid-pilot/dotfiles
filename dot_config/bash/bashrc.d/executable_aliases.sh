#!/bin/bash

alias ls='lsd --hyperlink always'
alias ll='lsd -lh --hyperlink always'
alias la='lsd -A --hyperlink always'
alias rm='trash-put'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias lvim="NVIM_APPNAME=nvim-lazy nvim"
help() {
	"$@" --help 2>&1 | bat -plhelp
}

#!/bin/bash
alias ls='lsd --hyperlink always'
alias ll='lsd -lh --hyperlink always'
alias la='lsd -A --hyperlink always'
alias rm='trash-put'
alias cst="chezmoi status"
alias cadd="chezmoi add"
alias ccd="chezmoi cd"
alias can="chezmoi apply -nv"
alias capply="chezmoi apply -v"
alias cdiff="chezmoi diff"
alias creadd="chezmoi status | cut -f2 -d ' ' | chezmoi re-add"
alias cforget='chezmoi forget'
alias cgp='chezmoi git push'
alias cgl='chezmoi git pull'
alias cfind='chezmoi find'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias cgf='chezmoi git fetch'
alias cgst='chezmoi git status'
alias cedit='chezmoi edit'
alias v='nvim'
help() {
	"$@" --help 2>&1 | bat -plhelp
}

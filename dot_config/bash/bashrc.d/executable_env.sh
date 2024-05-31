#!/bin/bash
export HTTP_PROXY="http://127.0.0.1:7899"
export HTTPS_PROXY="http://127.0.0.1:7899"
export ALL_PROXY="socks5://127.0.0.1:7898"
export NO_PROXY="127.0.0.1,::1,localhost"
export EDITOR=nvim
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LD_LIBRARY_PATH="/usr/local/cuda-12.3/lib64:/usr/local/"
export SBCL_HOME="/home/theo/programs/sbcl/lib/sbcl"
export HISTORY_IGNORE="ls *:ll *:cd *:pwd:exit:history"
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S "
export HISTCONTROL=ignoreboth
export GOBIN="/home/theo/.local/go/bin"
export GOPATH="/home/theo/.local/go"
export MANPATH="${MANPATH-$(manpath)}:/home/theo/.local/npm/share/man:/home/theo/programs/texlive/2024/texmf-dist/doc/man"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export WINEPREFIX="$XDG_DATA_HOME"/wine
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export W3M_DIR="$XDG_DATA_HOME"/w3m
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible

# . /home/theo/.cargo/env
envs=(
	"/home/theo/.cargo/env"
	"$CARGO_HOME/env"
)
for env in "${envs[@]}"; do
	[ -f "$env" ] && . "$env"
done

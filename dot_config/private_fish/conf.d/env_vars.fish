set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"
#set -gx GTK_IM_MODULE fcitx5
set -gx QT_IM_MODULE fcitx5
set -gx XMODIFIERS "@im=fcitx5"

set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx BUN_INSTALL "$XDG_DATA_HOME/bun"
set -gx DENO_INSTALL "$XDG_DATA_HOME/deno"
set -gx WINEPREFIX "$XDG_DATA_HOME/wine"
set -gx WGETRC "$XDG_CONFIG_HOME/wgetrc"
set -gx W3M_DIR "$XDG_DATA_HOME/w3m"
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -gx LD_LIBRARY_PATH /usr/local/cuda/lib64:$LD_LIBRARY_PATH
set -gx DOTNET_CLI_HOME "$XDG_DATA_HOME/dotnet"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME/bundle"
set -gx BUNDLE_USER_CACHE "$XDG_CACHE_HOME/bundle"
set -gx INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -gx IPYTHONDIR "$XDG_CONFIG_HOME/ipython"
set -gx BUNDLE_USER_PLUGIN "$XDG_DATA_HOME/bundle"
set -gx ANSIBLE_HOME "$XDG_DATA_HOME/ansible"
# set -gx CLICOLOR_FORCE 1

if uname -a | string match -q '*WSL*'
    set machine wsl
else if test -f /etc/fedora-release
    set machine fedora
else
    set machine unknown
end

set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
set -gx HOMEBREW_NO_ANALYTICS 1

switch $machine
    case wsl
        set -gx UNISON "$XDG_CONFIG_HOME/unison"
        set -gx skip_global_compinit 1
        set -gx EDITOR "$HOMEBREW_PREFIX/bin/nvim"
        set -gx VISUAL "$HOMEBREW_PREFIX/bin/nvim"
        set -gx DISPLAY "localhost:0"
        set -gx WAYLAND_DISPLAY "$DISPLAY"
        set -gx LIBGL_ALWAYS_INDIRECT 1
        set -gx XDG_SESSION_TYPE x11
        if test -n "$SSH_TTY"
            set -gx HTTP_PROXY "http://127.0.0.1:7897"
            set -gx HTTPS_PROXY "http://127.0.0.1:7897"
            set -gx ALL_PROXY "socks5://127.0.0.1:7897"
            set -gx NO_PROXY "127.0.0.1,::1,localhost"
        end

    case fedora
        set -gx HTTP_PROXY "http://127.0.0.1:7897"
        set -gx HTTPS_PROXY "http://127.0.0.1:7897"
        set -gx ALL_PROXY "socks5://127.0.0.1:7897"
        set -gx NO_PROXY "127.0.0.1,::1,localhost"
        set -gx EDITOR nvim
        set -gx VISUAL nvim
end

set -gx MANROFFOPT -c
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANPATH "$MANPATH:/home/theo/.local/share/npm/share/man:/home/theo/programs/texlive/2024/texmf-dist/doc/man"

set -gx HISTORY_IGNORE "ls *:ll *:cd *:pwd:exit:history"
set -gx HISTSIZE 50000
set -gx SAVEHIST 10000
set -gx HISTTIMEFORMAT "%Y/%m/%d %H:%M:%S "
set -gx HISTCONTROL ignoreboth
set -gx HISTDUP erase

set paths \
    "$XDG_DATA_HOME/bin" \
    "$XDG_DATA_HOME/go/bin" \
    "$XDG_CONFIG_HOME/emacs/bin" \
    "$XDG_CONFIG_HOME/miktex/bin" \
    "$XDG_DATA_HOME/npm/bin" \
    "$XDG_DATA_HOME/JetBrains/Toolbox/scripts" \
    "$XDG_DATA_HOME/bun/bin" \
    "$XDG_DATA_HOME/deno/bin" \
    "$XDG_DATA_HOME/juliaup/bin" \
    "$XDG_DATA_HOME/flutter/bin" \
    "$XDG_DATA_HOME/jdk-19.0.1/bin" \
    "$HOMEBREW_PREFIX/bin" \
    "$HOMEBREW_PREFIX/sbin" \
    "/usr/local/cuda-12.4/bin" \
    /usr/local/cuda/bin \
    "/home/theo/.pub-cache/bin"

for entry in $paths
    fish_add_path $entry --path
end

set envs \
    "$XDG_DATA_HOME/cargo/env.fish"\
"$XDG_DATA_HOME/uv/env"
for env in $envs
    if test -f $env
        source $env
    end
end

set -gx FZF_CTRL_T_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git --exclude .github"
set -gx FZF_ALT_C_COMMAND "fd --type d --hidden --strip-cwd-prefix --exclude .git --exclude .github"
set -gx FZF_CTRL_T_OPTS "--select-1 --exit-0"
set -gx FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200' --select-1 --exit-0"

set LIGHT_HOUR 7
set DARK_HOUR 19

set FZF_LIGHT_OPTS "--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
--color=selected-bg:#bcc0cc \
--multi"

set FZF_DARK_OPTS "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
set current_hour (date +%H)
if test $current_hour -ge $LIGHT_HOUR -a $current_hour -lt $DARK_HOUR
    set -gx FZF_DEFAULT_OPTS $FZF_LIGHT_OPTS
else

    set -gx FZF_DEFAULT_OPTS $FZF_DARK_OPTS
end

set -gx SBCL_HOME /home/theo/programs/sbcl/lib/sbcl
set -gx GOBIN "/home/theo/.local/share/go/bin"
set -gx GOPATH "/home/theo/.local/share/go"

if test -d "$HOMEBREW_PREFIX/share/fish/completions"
    set -p fish_complete_path "$HOMEBREW_PREFIX/share/fish/completions"
end

if test -d "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
    set -p fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
end

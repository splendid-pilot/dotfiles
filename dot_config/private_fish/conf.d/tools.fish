if status is-interactive
    if type -q fzf
        fzf --fish | source
        bind -e \ct fzf-file-widget
        bind \cg fzf-file-widget
    end

    if type -q atuin
        atuin init fish --disable-up-arrow | source
    end

    if type -q direnv
        direnv hook fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end

    if false
        if uname -a | grep -q WSL
            if test -z "$SSH_TTY"
                if type -q zellij && test -z "$ZELLIJ" && test "$TERM_PROGRAM" != vscode && test -z (string match "*kitty" $TERM)
                    eval (zellij setup --generate-auto-start fish | string collect)
                end
            end
        end
    end
    if type -q carapace
        set -Ux CARAPACE_BRIDGES 'bash,inshellisense,argcomplete,carapace,clap,click,cobra,complete,fish,inshellisense,urfavecli,zsh'
        carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish # disable auto-loaded completions (#185)
        carapace _carapace | source
    end
end

if status is-interactive
    if type -q fzf
        fzf --fish | source
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

    if uname -a | grep -q WSL
        if -z "$SSH_TTY"
        if type -q zellij
            eval (zellij setup --generate-auto-start fish)
        end
    end
end

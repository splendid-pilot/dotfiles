alias ls='lsd --hyperlink always'
alias ll='lsd -lh --hyperlink always'
alias la='lsd -A --hyperlink always'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
abbr -a rm trash-put
abbr -a cst "chezmoi status"
abbr -a cadd "chezmoi add"
abbr -a ccd "chezmoi cd"
abbr -a can "chezmoi apply -nv"
abbr -a capply "chezmoi apply -v"
abbr -a cdiff "chezmoi diff"
abbr -a creadd "chezmoi status | cut -f2 -d ' ' | chezmoi re-add"
abbr -a cforget 'chezmoi forget'
abbr -a cgp 'chezmoi git push'
abbr -a cgl 'chezmoi git pull'
abbr -a cfind 'chezmoi find'
abbr -a cgf 'chezmoi git fetch'
abbr -a cgst 'chezmoi git status'
abbr -a cedit 'chezmoi edit'
abbr -a v nvim
abbr -a belp bat -plhelp
abbr -a ga git add
abbr -a gaa git add --all
abbr -a gl git pull
abbr -a gp git push
abbr -a glog git log --oneline --decorate --graph
abbr -a grs git restore
abbr -a gst git status
abbr -a gf git fetch

#! /bin/zsh
# Set personal aliases, overriding those provided by oh-my-zsh libs, plugins,
# and themes. Aliases can be placed here, though oh-my-zsh users are encouraged
# to define aliases within the ZSH_CUSTOM folder
#
# For a full list of active aliases, run `alias`

alias ls="ls $LS_OPTIONS -F"
alias ll="ls $LS_OPTIONS -lah"
alias gg="git grep -I --untracked"
alias g="git"
alias rsa='rsync -azip --info=progress2'
alias sucs="sort | uniq -c | sort -n"
alias nautilus="nautilus --browser"
alias jj='dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}"'
alias j='fasd_cd -d'
alias a='php artisan'
alias ping='prettyping -nolegend'
alias wip="git add . && git commit -am 'wip'"
alias nah="git reset --hard && git clean -df"
alias k=kubectl
alias phpunit="./vendor/bin/phpunit"
alias clock="clockify-cli"
alias vim="nvim"
alias vi="nvim"
compdef __start_kubectl k

# vim: ft=zsh

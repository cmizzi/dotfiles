#! /bin/zsh
# Execute following code if we're working on a local machine

(( ${+commands[keychain]} )) && eval `keychain --eval --quiet id_rsa`

export EDITOR="neovim"
export PGHOST=127.0.0.1
export PGUSER=postgres
export MYSQL_HOST=127.0.0.1
export MAIL=/var/spool/mail/$USERNAME
export JAVA_HOME=/home/.java

alias ls="exa -F"
alias ll="exa -lah"
alias cat="bat"
alias du="dust"
alias ps="procs"
alias top="btm"
alias htop="btm"
alias diff="delta"

source <(kubectl completion zsh)
source <(stern --completion zsh)

#! /bin/zsh
# Execute following code if we're working on a local machine
export PATH="$HOME/.phpenv/bin:$PATH"

(( ${+commands[keychain]} )) && eval `keychain --eval --quiet id_rsa`

export EDITOR="vi"
export PGHOST=127.0.0.1
export PGUSER=postgres
export MYSQL_HOST=127.0.0.1
export MAIL=/var/spool/mail/$USERNAME

alias ls="exa -F"
alias ll="exa -lah"

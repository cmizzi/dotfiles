#! /bin/zsh
# Execute following code if we're working on a local machine

(( ${+commands[keychain]} )) && eval `keychain --eval --quiet id_rsa`

export EDITOR="vim"
export PGHOST=127.0.0.1
export PGUSER=postgres
export MYSQL_HOST=127.0.0.1
export MAIL=/var/spool/mail/$USERNAME
export JAVA_HOME=/home/.java
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:/opt/emsdk/:/opt/emsdk/upstream/emscripten"
export GIT_PAGER="delta -s"

alias ls="exa -F --icons"
alias ll="exa -lah --icons --git"
alias cat="bat"
alias du="dust"
alias ps="procs"
alias top="btm"
alias htop="btm"
alias diff="delta"

source <(kubectl completion zsh)
source <(helm completion zsh)

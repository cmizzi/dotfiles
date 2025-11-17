#! /bin/zsh
# Execute following code if we're working on a local machine

(( ${+commands[keychain]} )) && eval `keychain --eval --quiet id_rsa`

export EDITOR="nvim"
export PGHOST=127.0.0.1
export PGUSER=postgres
export MYSQL_HOST=127.0.0.1
export MAIL=/var/spool/mail/$USERNAME
export JAVA_HOME=/home/.java
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$HOME/.dotnet:$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:/opt/emsdk/:/opt/emsdk/upstream/emscripten:$HOME/sdk/go1.23.1/bin:$HOME/go/bin"
export GIT_PAGER="delta -s"
export GOROOT="$HOME/sdk/go1.23.1"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

alias ls="eza -F --icons"
alias ll="eza --long --all --icons --git --group-directories-first"
alias cat="bat"
alias less="bat"
alias du="dust"
alias ps="procs"
alias top="btm"
alias htop="btm"
alias diff="delta"
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"

source <(kubectl completion zsh)
source <(helm completion zsh)
source <(flux completion zsh)


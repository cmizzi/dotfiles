#! /bin/zsh
# Define default configuration

export LANG=en_US.UTF-8
export LS_OPTIONS="--color"

[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
[ -s "$HOME/.local/bin/fasd" ] && eval "$($HOME/.local/bin/fasd --init auto)"

# vim: ft=zsh

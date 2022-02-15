#! /bin/zsh
# Configure PATH environment

export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.zfunctions:$PATH"
export PATH="$HOME/.local/bin/tools:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/home/data/bin"
export MANPATH="/usr/local/man:$MANPATH"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/Code/.go"
export GOBIN="$GOROOT/bin"
export PATH="$GOBIN:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# vim: ft=zsh

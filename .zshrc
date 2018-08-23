CURDIR=$(dirname ${(%):-%N})

source "$CURDIR/.zsh/zplug.zsh"
source "$CURDIR/.zsh/path.zsh"
source "$CURDIR/.zsh/default.zsh"
source "$CURDIR/.zsh/bindkeys.zsh"
source "$CURDIR/.zsh/history.zsh"
source "$CURDIR/.zsh/aliases.zsh"
source "$CURDIR/.zsh/functions.zsh"
source "$CURDIR/.zsh/fzf.zsh"

# Preferred ssh or local configuration
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	source "$CURDIR/.zsh/ssh.zsh"
else
	source "$CURDIR/.zsh/local.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$CURDIR/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$CURDIR/.rvm/bin"

export PATH="$CURDIR/.yarn/bin:$PATH"

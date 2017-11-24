source "$HOME/.zsh/zplug.zsh"
source "$HOME/.zsh/path.zsh"
source "$HOME/.zsh/default.zsh"
source "$HOME/.zsh/bindkeys.zsh"
source "$HOME/.zsh/history.zsh"
source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/functions.zsh"
source "$HOME/.zsh/fzf.zsh"

# Preferred ssh or local configuration
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	source "$HOME/.zsh/ssh.zsh"
else
	source "$HOME/.zsh/local.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$PATH"

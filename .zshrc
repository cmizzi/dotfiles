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

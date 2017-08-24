#! /bin/zsh
# Execute following code if we're working on a remote machine

export EDITOR="vi"

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ] && [ -x "$(command -v tmux)" ]; then
	# Forward SSH agent when present to work with tmux reattach
	if test "$SSH_AUTH_SOCK" ; then
		ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
	fi

	tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
	exit
fi

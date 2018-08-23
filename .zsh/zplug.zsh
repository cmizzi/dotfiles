#! /bin/zsh
# Install zPlug if not present and also define needed libraries

if [[ ! -d "$HOME/.zplug" ]]; then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

if [[ -f "$HOME/.zplug/init.zsh" ]]; then
	source $HOME/.zplug/init.zsh

	zplug "zsh-users/zsh-history-substring-search"
	zplug "hlissner/zsh-autopair", defer:3
	zplug "zsh-users/zsh-syntax-highlighting", defer:3
	zplug "arzzen/calc.plugin.zsh"
	zplug "supercrabtree/k"
	zplug "unixorn/git-extra-commands", if:"which git"
	zplug "bobthecow/git-flow-completion", if:"which git"
	zplug "arzzen/calc.plugin.zsh"
	zplug 'lib/completion', from:oh-my-zsh
	zplug 'lib/functions', from:oh-my-zsh
	zplug 'lib/history', from:oh-my-zsh
	zplug 'lib/key-bindings', from:oh-my-zsh
	zplug 'lib/misc', from:oh-my-zsh
	zplug 'lib/spectrum', from:oh-my-zsh
	zplug 'lib/theme-and-appearance', from:oh-my-zsh
	zplug "plugins/mix", from:oh-my-zsh
	zplug "plugins/git", from:oh-my-zsh, if:"which git"
	zplug "plugins/command-not-found", from:oh-my-zsh
	zplug "plugins/composer", from:oh-my-zsh, if:"which composer"
	zplug "plugins/docker", from:oh-my-zsh, if:"which docker"
	zplug "plugins/gem", from:oh-my-zsh, if:"which gem"
	zplug "plugins/jsontools", from:oh-my-zsh
	zplug "plugins/php", from:oh-my-zsh, if:"which php"
	zplug "plugins/sudo", from:oh-my-zsh
	zplug "plugins/symfony", from:oh-my-zsh
	zplug "changyuheng/zsh-interactive-cd"

	# Configure theme
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ "$USER" = "root" ]; then
		# If we're on SSH, just load the agnoster theme
		zplug "themes/agnoster", from:oh-my-zsh
	else
		# Otherwise, load my custom theme
		zplug "tylerreckart/hyperzsh", as:theme
	fi

	zplug check || zplug install
	zplug load
fi

# vim: ft=zsh

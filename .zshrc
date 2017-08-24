# zplug : load zsh plugins

# auto-install zplug
if [[ ! -d "$HOME/.zplug" ]]; then
	curl -sL zplug.sh/installer | zsh
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

	# Oh My ZSH plugins
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
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
		# If we're on SSH, just load the agnoster theme
		zplug "themes/agnoster", from:oh-my-zsh
	else
		# Otherwise, load my custom theme
		zplug "tylerreckart/hyperzsh", as:theme
		PROMPT='$(_user_host)$(_python_venv)%{$fg[cyan]%}%c $(git_prompt_info)%{$reset_color%}$(git_prompt_short_sha)%{$fg[magenta]%}$(git_prompt_status)${_return_status}➜ '
	fi

	# Then, source plugins and add commands to $PATH
	zplug check || zplug install
	zplug load
fi

# Avoid history duplicates
export HISTCONTROL=ignoredups:erasedups
source /home/cyril/.zplug/repos/changyuheng/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# When the shell exits, append to the history file instead of overwriting it
setopt auto_cd
setopt autopushd
setopt extended_glob
setopt dotglob

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Key bindings

bindkey -A viins main
bindkey '^[Oa'    history-beginning-search-backward
bindkey '^[[1;5A' history-beginning-search-backward
bindkey '^[[A'    history-beginning-search-backward
bindkey '^[OA'    history-beginning-search-backward

bindkey '^[Ob'    history-beginning-search-forward
bindkey '^[[1;5B' history-beginning-search-forward
bindkey '^[[B'    history-beginning-search-forward
bindkey '^[OB'    history-beginning-search-forward

bindkey "^[a"     accept-and-hold
bindkey "^[Oc"    vi-forward-blank-word
bindkey "^[[1;5C" vi-forward-blank-word
bindkey "^[Od"    vi-backward-blank-word
bindkey "^[[1;5D" vi-backward-blank-word
bindkey "^[OH"    beginning-of-line
bindkey "^[OF"    end-of-line
bindkey "^[[7~"   beginning-of-line
bindkey "^[[8~"   end-of-line
bindkey "^A"      beginning-of-line
bindkey "^E"      end-of-line
bindkey "^[^["    vi-cmd-mode
bindkey "^[[3~"   delete-char

# History and mail configuration

SAVEHIST=40000
HISTSIZE=40000
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt histignorealldups
setopt HIST_IGNORE_SPACE
HISTFILE=$HOME/.history
MAIL=/var/spool/mail/$USERNAME

export HISTORY SAVEHIST HISTFILE HISTSIZE MAIL

# LS

LS_OPTIONS="--color"
export LS_OPTIONS

# PostgreSQL configuration

export PGHOST=127.0.0.1
export PGUSER=postgres

# MYSQL configuration

export MYSQL_HOST=127.0.0.1

# History configuration

export HISTIGNORE='&:sudo rm *:rm *:sudo shutdown *'
export MANPATH="/usr/local/man:$MANPATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# RVM

# fasd starting

[ -s "/usr/local/bin/fasd" ] && eval "$(fasd --init auto)"

# User configuration

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.zfunctions:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.captain/bin:$PATH"
export PATH="$PATH:/usr/sbin"
export EDITOR=vi

# fzf

export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_COMMAND="rg -g '' --files"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR="vi"
else
	export EDITOR="vi"
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

function server () { /usr/bin/ssh -A -T -t $@ "tmux -2 -u attach || tmux -2 -u new || screen -r || screen || zsh" 2> /dev/null; }
function dl     () {
	CONTAINER=$(docker ps -a --no-trunc | grep $1 | awk '{print $1}' | head -n 1)
	docker logs -f --tail=100 $CONTAINER
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls="ls $LS_OPTIONS -F"
alias ll="ls $LS_OPTIONS -lah"
alias gg="git grep -I --untracked"
alias g="git"
alias rsa='rsync -aizP'
alias sucs="sort | uniq -c | sort -n"
alias nautilus="nautilus --browser --no-desktop"
alias deploy="bash /data/capistrano/cap"
alias p="parallel"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# fasd alias
alias jj='dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}"'
alias j='fasd_cd -d'     # cd, same functionality as j in autojump

# Functions

ax () {
	if [ $# -eq 0 ]              ; then echo 'Gimme a file to unpack !' ; return ; fi
	if [ !  -x  /usr/bin/atool ] ; then echo 'Need "agi atool"'         ; return ; fi
	if [ !  -x  /bin/mktemp ]    ; then echo 'Need "mktemp"'            ; return ; fi

	TMP=`mktemp /tmp/aunpack.XXXXXXXXXX`
	atool -x --save-outdir=$TMP "$@"
	DIR="`cat $TMP`"
	[ "$DIR" != "" -a -d "$DIR" ] && cd "$DIR"
	rm -rf $TMP
}

v() {
	local file
	file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
}

#### CTRL-J - Fasd+fzf fast jump
fzf-fasd-widget() {
	local cmd="${FZF_ALT_C_COMMAND:-"command fasd -Rdl"}"

	cd "${$(eval "$cmd" | $(__fzfcmd) +m +s):-.}"
	zle reset-prompt
}

zle     -N    fzf-fasd-widget
bindkey '^J'  fzf-fasd-widget

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#! /bin/zsh
# Configure history options

setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt histignorealldups
setopt HIST_IGNORE_SPACE
export HISTCONTROL=ignoredups:erasedups
export SAVEHIST=40000
export HISTSIZE=40000
export HISTFILE=$HOME/.history
export HISTIGNORE='&:sudo rm *:rm *:sudo shutdown *'
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# When the shell exits, append to the history file instead of overwriting it
setopt auto_cd
setopt autopushd
setopt extended_glob
setopt dotglob

# vim: ft=zsh

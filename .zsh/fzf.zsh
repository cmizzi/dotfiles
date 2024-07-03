#! /bin/zsh
# Define options for fzf plugin

# export FZF_COMPLETION_OPTS='+c -x'
# export FZF_DEFAULT_COMMAND="rg -g '' --files"
#
# #### CTRL-J - Fasd + fzf fast jump
# fzf-fasd-widget() {
# 	local cmd="${FZF_ALT_C_COMMAND:-"command fasd -Rdl"}"
#
# 	cd "${$(eval "$cmd" | $(__fzfcmd) +m +s):-.}"
# 	zle reset-prompt
# }
#
# zle     -N    fzf-fasd-widget
# bindkey '^J'  fzf-fasd-widget

# vim: ft=zsh

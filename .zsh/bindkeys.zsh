#! /bin/zsh
# Configure key bindings

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

# vim: ft=zsh

for file (~/.aliases) do
    [[ -f $file ]] && source $file
done
unset file

# History
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=16384
SAVEHIST=16384

# History with strftime format
alias history="history -t '%b %d %Y %H:%M'"

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zmodload zsh/complist

# Use Shift+Tab to go backwards in menu completion
bindkey -M menuselect '^[[Z' reverse-menu-complete

autoload -U colors
colors
 
# Enable vim mode
bindkey -v

# Enable backspace in insert mode
bindkey "^?" backward-delete-char

# Setup fzf from installed ~/.fzf.zsh file
# Enables fzf, auto-completion, and key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type fzf &> /dev/null && fd -V &> /dev/null; then
    # Use fd for fzf to show hidden files and respect .gitignore
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    # Use the fzf default command for the CTRL+T key binding
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

if type starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

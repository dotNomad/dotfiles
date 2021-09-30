for file (~/.aliases ~/.exports) do
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

# Prompt
git_prompt() {
    local branchName=""
    local state=""

    # Check if the current directory is in a git repository
    ! git rev-parse &> /dev/null && return

    # Check if inside of .git
    [[ "$(git rev-parse --is-inside-git-dir)" == true ]] && return

    # Check for uncommitted changes in the index
    if ! git diff --quiet --ignore-submodules --cached; then
        state+="+"
    fi

    # Check for unstaged changes
    if ! git diff-files --quiet --ignore-submodules --; then
        state+="!"
    fi

    # Check for untracked files
    if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        state+="?"
    fi

    # Check for stashed files
    if git rev-parse --verify refs/stash &> /dev/null; then
        state+="$"
    fi

    [ -n "$state" ] && state=" [$state]"

    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
        git rev-parse --short HEAD 2> /dev/null || \
        printf "(unknown)" )"

    printf "%s" "$1$branchName$state"
}

autoload -U colors
colors
 
setopt PROMPT_SUBST

PROMPT=$'\n'                                        # newline to start
PROMPT+='%{$fg_bold[green]%}%~'                     # Current directory starting with ~
PROMPT+='%{$reset_color%}'
PROMPT+=' $(git_prompt "on %{$fg_bold[magenta]%}")' # Git Repository details
PROMPT+='%{$reset_color%}'
PROMPT+=$'\n'                                       # newline to end
PROMPT+='❯ '                                        # End symbol

# Enable vim mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Enable backspace in insert mode
bindkey "^?" backward-delete-char

# Setup fzf from installed ~/.fzf.zsh file
# Enables fzf, auto-completion, and key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type fzf &> /dev/null && fd &> /dev/null; then
    # Use fd for fzf to show hidden files and respect .gitignore
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    # Use the fzf default command for the CTRL+T key binding
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

if type starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

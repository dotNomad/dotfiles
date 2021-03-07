for file (~/.aliases ~/.exports) do
    [[ -f $file ]] && source $file
done
unset file

# History
alias history="history -t '$HISTTIMEFORMAT'"
setopt APPEND_HISTORY

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

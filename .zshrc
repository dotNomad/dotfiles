# Activate starship

# eval "$(starship init zsh)"

# ALIASES

# Colored ls
if ls --color &> /dev/null; then
    alias ls="ls --color=auto"
else
    alias ls="ls -G"
fi

# Clear
alias c="clear"
# Git
alias gs="git status --short"
alias gd="git diff"
alias gl="git log --oneline --graph"
alias glp="git log --graph --pretty=format:'%C(auto)%h%Creset%C(auto)%d%Creset %C(auto)%s%Creset %C(green)(%cr)%Creset %C(blue)<%an>%Creset'"

# EXPORTS

# Make vim the default editor
export EDITOR="vim"
export VISUAL="vim"
export GIT_EDITOR="vim"

# History

# PROMPT

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

NEWLINE='
'

PROMPT='
%{$fg_bold[orange]%}%~%{$reset_color%} $(git_prompt "on %{$fg_bold[magenta]%}")%{$reset_color%}
❯ '

[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor

PROMPT='
%F{#fe8019}%~%f $(git_prompt "on %{$fg_bold[magenta]%}")%{$reset_color%}
❯ '

PROMPT='
%B%F{green}%~%f%b $(git_prompt "on %{$fg_bold[magenta]%}")%{$reset_color%}
❯ '

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

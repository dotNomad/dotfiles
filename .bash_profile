#!/bin/bash

# Load dotfiles
for file in ~/.{bash_prompt,exports,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Append to history instead of overwriting
shopt -s histappend

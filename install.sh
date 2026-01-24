#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles.bak"

# Files to symlink to $HOME
HOME_FILES=(
    .aliases
    .bash_profile
    .bash_prompt
    .bashrc
    .exports
    .gitconfig
    .gitignore
    .tmux.conf
    .vimrc
    .zshrc
)

# Vim files (.vim/)
VIM_FILES=(
    after/ftplugin/markdown.vim
)

# XDG config files (.config/)
CONFIG_FILES=(
    ghostty/config
    starship.toml
)

# VSCode files (macOS path)
VSCODE_DIR="$HOME/Library/Application Support/Code/User"
VSCODE_FILES=(
    settings.json
    keybindings.json
)

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_success() { echo -e "${GREEN}[+]${NC} $1"; }
print_skip() { echo -e "${YELLOW}[-]${NC} $1"; }
print_error() { echo -e "${RED}[!]${NC} $1"; }

# Prompt for installation
# Args: $1 = file name to display
# Returns: 0 if yes, 1 if no
prompt_install() {
    local name="$1"
    while true; do
        read -rp "Install ${name}? [y/n] " answer
        case "$answer" in
            [yY]) return 0 ;;
            [nN]) return 1 ;;
            *) echo "Please answer y (yes) or n (no)" ;;
        esac
    done
}

# Create symlink with backup support
# Args: $1 = source, $2 = target
create_link() {
    local source="$1"
    local target="$2"
    local name
    name="$(basename "$target")"

    # Check if source exists
    if [[ ! -e "$source" ]]; then
        print_error "Source not found: $source"
        return 1
    fi

    # Already correctly symlinked
    if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
        print_skip "Already linked: $name"
        return 0
    fi

    # Prompt user
    if ! prompt_install "$name"; then
        print_skip "Skipped: $name"
        return 0
    fi

    # Backup existing file/directory
    if [[ -e "$target" || -L "$target" ]]; then
        mkdir -p "$BACKUP_DIR"
        local backup_name
        backup_name="$(basename "$target").$(date +%Y%m%d%H%M%S)"
        mv "$target" "$BACKUP_DIR/$backup_name"
        print_skip "Backed up: $target -> $BACKUP_DIR/$backup_name"
    fi

    # Create symlink
    if ln -s "$source" "$target"; then
        print_success "Linked: $name"
    else
        print_error "Failed to link: $name"
    fi
}

echo "Installing dotfiles..."
echo

# Link home files
echo "Home files:"
for file in "${HOME_FILES[@]}"; do
    create_link "$DOTFILES_DIR/$file" "$HOME/$file"
done
echo

# Link vim files
echo "Vim files:"
for file in "${VIM_FILES[@]}"; do
    mkdir -p "$HOME/.vim/$(dirname "$file")"
    create_link "$DOTFILES_DIR/.vim/$file" "$HOME/.vim/$file"
done
echo

# Link config files
echo "Config files:"
for file in "${CONFIG_FILES[@]}"; do
    mkdir -p "$HOME/.config/$(dirname "$file")"
    create_link "$DOTFILES_DIR/.config/$file" "$HOME/.config/$file"
done
echo

# Link VSCode files (if VSCode is installed)
if [[ -d "$VSCODE_DIR" ]]; then
    echo "VSCode files:"
    for file in "${VSCODE_FILES[@]}"; do
        create_link "$DOTFILES_DIR/vscode/$file" "$VSCODE_DIR/$file"
    done
    echo
else
    echo "VSCode not found, skipping VSCode files."
    echo
fi

echo "dotNomad/dotfiles installed"

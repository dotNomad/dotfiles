# dhruvi's dotfiles

## Install

1. Clone the repo to the local machine
2. Use symlinks for the wanted files from the repo

```
ln -s ~/code/dotfiles/.zshrc ~/.zshrc
```

## iTerm

Use `Terminal` to setup iTerm

1. Install a [nerd font](https://www.nerdfonts.com/)
2. Delete configuration file
3. symlink the configuration file
4. Check `Load preferences from a custom folder of URL` under Settings
5. Make sure preferences are being loaded from `~/.iterm`

## Brewfile

### Install

1. Install [`Homebrew`](https://brew.sh/)
2. Run `brew bundle` from the Brewfile directory

### Generate Brewfile

This will also dump applications installed using [`mas`](https://github.com/mas-cli/mas)

```
brew bundle dump
```

### Git Config

The `.gitconfig.local` file is included by `.gitconfig`. Use it to store user
information.

```
[user]
    name = Dhruvi Sompura
    email = fake@invalid.com
```

## Optional tools

- [`bat`](https://github.com/sharkdp/bat)
- [`fzf`](https://github.com/junegunn/fzf)
- [`fd`](https://github.com/sharkdp/fd)
- [ripgrep `rg`](https://github.com/BurntSushi/ripgrep)
- [`starship`](https://starship.rs/)

### Commit Messages

Messages should start with the affected `[software]`

If there is not a specific piece of software the commit targets then it can be
excluded

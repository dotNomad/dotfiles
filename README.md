# dhruvi's dotfiles

## Install

1. Clone the repo to the local machine
2. Use symlinks for the wanted files from the repo

```
ln -s ~/code/dotfiles/.zshrc ~/.zshrc
```

### Git Config

The `.gitconfig.local` file is included by `.gitconfig`. Use it to store user
information.

```
[user]
    name = Jordan Jensen
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

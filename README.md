# dotNomad's dotfiles

A simple group of dotfiles that I'm sure will expand as I hunt for new features,
functions, and improvements

## Install (macOS)

Install the dotfiles using the install script on macOS

```
./install.sh
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

### CLI tools

- [`bat`](https://github.com/sharkdp/bat)
- [`fzf`](https://github.com/junegunn/fzf)
  - [`fzf-tab`](https://github.com/Aloxaf/fzf-tab)
- [`fd`](https://github.com/sharkdp/fd)
- [`gh`](https://cli.github.com/)
- [ripgrep `rg`](https://github.com/BurntSushi/ripgrep)
- [starship](https://starship.rs/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

### Desktop apps

- [Rectangle Pro](https://rectangleapp.com/pro/)

### Commit Messages

Messages should start with the affected `[software]`

If there is not a specific piece of software the commit targets then it can be
excluded

### Heavily inspired by:

- [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Cătălin Mariș's dotfiles](https://github.com/alrra/dotfiles)

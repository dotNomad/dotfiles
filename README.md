# dotNomad's dotfiles

A simple group of dotfiles that I'm sure will expand as I hunt for new features,
functions, and improvements

## Install

Use symlinks for the wanted files

```
ln -s ~/development/dotfiles/.zshrc ~/.zshrc
```

### Visual Studio Code

Once Visual Studio Code is installed remove the original `settings.json` and
create a symlink to the `settings.json` in the vscode directory.

```
ln -s ~/development/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
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
    - [`fzf-tab`](https://github.com/Aloxaf/fzf-tab)
- [`fd`](https://github.com/sharkdp/fd)
- [ripgrep `rg`](https://github.com/BurntSushi/ripgrep)
- [starship](https://starship.rs/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

### Commit Messages

Messages should start with the affected `[software]`

If there is not a specific piece of software the commit targets then it can be
excluded

### Heavily inspired by:
* [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Cătălin Mariș's dotfiles](https://github.com/alrra/dotfiles)

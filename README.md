# dotNomad's dotfiles

A simple group of dotfiles that I'm sure will expand as I hunt for new features, functions, and improvements

## Install

Use symlinks for the wanted files

```
ln -s ~/development/dotfiles/.zshrc ~/.zshrc
```

### Git Config

The `.gitconfig.local` file is included by `.gitconfig`. Use it to store user information.

```
[user]
    name = Jordan Jensen
    email = fake@invalid.com
```

### Commit Messages

Messages should start with the affected `[software]`

If there is not a specific piece of software the commit targets then it can be excluded

### Heavily inspired by:
* [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Cătălin Mariș's dotfiles](https://github.com/alrra/dotfiles)

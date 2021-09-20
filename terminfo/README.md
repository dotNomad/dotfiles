# terminfo

Adds italics support to xterm-256color `TERMINFO` files.

## Install
```
tic -o ~/.terminfo xterm-256color.terminfo
```

## Verify It Is Working
```
echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`
```

## References

- [Vim screencast #22: Italics by Greg Hurrell](https://youtu.be/n1cKtZfwOgQ?t=16)

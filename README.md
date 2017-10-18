My personal dotfiles.


## Requirements

All OSes:

* bash
* fish
* git
* neovim
* nerd fonts
* ssh

Macos only:

* terminal-notifier *(brew)*

Linux only:

* notify-send

### Installing nerd fonts on macOs
```
$ brew tap caskroom/fonts
$ brew cask install font-hack-nerd-font
```

## Usage

* Install dotfiles: `./setup.sh`
* Decrypt ssh config file: `gpg -d ssh/config.gpg`
* Encrypt ssh config file: `gpg -c ssh/config`
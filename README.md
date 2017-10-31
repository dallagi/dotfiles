My personal dotfiles.


## Requirements

All OSes:

* bash
* fish
* git
* neovim
* nerd fonts
* ssh
* python + pip

Macos only:

* terminal-notifier *(brew)*
* brew and brew-cask

Linux only:

* notify-send

### Installing nerd fonts on macOs
```
$ brew tap caskroom/fonts
$ brew cask install font-hack-nerd-font
```

## Usage

* Install dotfiles: `./setup.sh`
* Decrypt ssh config file: `gpg -d ssh/config.gpg > ssh/config`
* Encrypt ssh config file: `gpg -c ssh/config`


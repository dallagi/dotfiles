set -e

read -r -p "+++ Make sure that no ~/.emacs.el or ~/.emacs.d exist +++"
read -r -p "+++ Linking config files +++"
mkdir -p ~/.config/emacs
stow --restow --dir files --target ~/.config/emacs emacs

echo "+ Done."


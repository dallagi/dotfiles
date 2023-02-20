set -e

read -r -p "+++ Linking emacs config +++"
mkdir -p ~/.config/emacs
stow --restow --dir files --target ~/.config/emacs emacs

echo "+ Done."


set -e

read -r -p "+++ Linking doom config +++"
mkdir -p ~/.config/doom
stow --restow --dir files --target ~/.config/doom doom-emacs

echo "+ Done."


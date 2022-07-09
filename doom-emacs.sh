set -e

mkdir -p ~/.config/doom
stow --restow --dir files --target ~/.config/doom doom-emacs

echo "+ Done."


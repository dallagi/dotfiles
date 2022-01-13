set -e

read -r -p "+++ Have you installed doom emacs (in ~/.config/emacs)? If not, do it now and come back when you're done. +++"

read -r -p "+++ Linking .doom.d +++"
mkdir -p ~/.config/doom
stow --restow --dir files --target ~/.config/doom doom-emacs

echo "+ Done."


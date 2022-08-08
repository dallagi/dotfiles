set -e


echo "+ Linking..."
stow -v --restow --dir files --target ~/.bin bin

echo "+ Done."

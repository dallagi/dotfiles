set -e


echo "+ Linking..."
stow -v --restow --dir files --target ~ git

echo "+ Done."

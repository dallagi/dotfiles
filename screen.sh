set -e

echo "+ Linking..."
stow -v --restow --dir files --target ~ screen

echo "+ Done."

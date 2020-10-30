set -e

read -r -p "+++ Linking .gitconfig and .gitignore +++"

echo "+ Linking..."
stow -v 5 --restow --dir files --target ~ git

echo "+ Done."

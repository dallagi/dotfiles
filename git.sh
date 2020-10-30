set -e

read -r -p "+++ Linking .gitconfig and .gitignore +++"

echo "+ Linking..."
stow -v --restow --dir files --target ~ git

echo "+ Done."

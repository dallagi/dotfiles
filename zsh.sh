set -e

read -r -p "+++ Linking zshrc +++"
stow -v 1 --restow --dir files --target ~ zsh
echo "+ Done."

read -r -p "+++ Installing Pure +++"
npm install --global pure-prompt
echo "+ Done."

read -r -p "+++ Installing asdf +++"
echo "+ Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0 | true
echo "+ Configuring some asdf plugins..."
. $HOME/.asdf/asdf.sh  # enable asdf
asdf plugin add java
asdf plugin-add kotlin https://github.com/asdf-community/asdf-kotlin.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
echo "+ Done."

echo "+ Manual steps:"
echo "\t1. Install and configure some Nerd Font in the terminal"
echo "\t2. Install autojump for zsh"


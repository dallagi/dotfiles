set -e

read -r -p "+++ Linking zshrc +++"
stow -v 1 --restow --dir files --target ~ zsh
echo "+ Done."

read -r -p "+++ Installing Starship +++"
curl -fsSL https://starship.rs/install.sh | bash
echo "+ Done."

read -r -p "+++ Linking Starship configuration +++"
mkdir -p ~/.config
stow -v 1 --restow --dir files --target ~/.config starship
echo "+ Done."

read -r -p "+++ Installing asdf +++"
echo "+ Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
echo "+ Configuring some asdf plugins..."
asdf plugin add java
asdf plugin-add kotlin https://github.com/asdf-community/asdf-kotlin.git
echo "+ Done."

echo "+ Manual steps:"
echo "\t1. Install and configure some Nerd Font in the terminal"
echo "\t2. Install autojump for zsh (on fedora: $ dnf install autojump-zsh)"


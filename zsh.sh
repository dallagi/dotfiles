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

echo "+ Manual steps:"
echo "\t1. Install and configure some Nerd Font in the terminal"
echo "\t2. Install autojump for zsh (on fedora: $ dnf install autojump-zsh)"

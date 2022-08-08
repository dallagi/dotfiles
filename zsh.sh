set -e

read -r -p "+++ Linking zshrc +++"
stow -v 1 --restow --dir files --target ~ zsh
echo "+ Done."

read -r -p "+++ Installing Starship +++"
curl -sS https://starship.rs/install.sh > /tmp/starship-install.sh
read -r -p "+ Let's check the script looks good"
vi /tmp/starship-install.sh
read -r -p "+ Press enter to install starship, Ctrl-C to abort"
sh /tmp/starship-install.sh
echo "+ Done."

read -r -p "+++ Installing zsh plugins"
echo "+ zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

read -r -p "+++ Installing asdf +++"
echo "+ Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0 | true
echo "+ Configuring some asdf plugins..."
. $HOME/.asdf/asdf.sh  # enable asdf
asdf plugin add java
asdf plugin-add kotlin https://github.com/asdf-community/asdf-kotlin.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
echo "+ Done."

echo "+ Manual steps:"
echo "  1. Install and configure some Nerd Font in the terminal"
echo "  2. Install zoxide for autojump with z"
echo "  3. Install kubectl"


set -e

read -r -p "! Note: this installation script depends on having run the zsh one before"
read -r -p "+++ Installing Fisher +++"
curl -sL https://git.io/fisher > /tmp/fisher-install.fish
read -r -p "+ Let's check the script looks good"
vi /tmp/fisher-install.fish
read -r -p "+ Press enter to install Fisher, Ctrl-C to abort"
fish -c "source /tmp/fisher-install.fish && fisher install jorgebucaran/fisher"
echo "+ Done."

read -r -p "+++ Installing fish plugins"
echo "+ bass"
fish -c "fisher install edc/bass"


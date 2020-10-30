set -e

read -r -p "+++ Installing one-dark theme for gnome-terminal +++"

echo "+ Cloning repo..."
git clone https://github.com/aaron-williamson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal

echo "+ Installing Onedark theme..."
~/.config/base16-gnome-terminal/color-scripts/base16-onedark.sh

echo "+ Theme installed. Activate it from the Gnome-Terminal settings."

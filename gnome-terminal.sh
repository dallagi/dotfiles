set -e

read -r -p "+++ Installing one-dark theme for gnome-terminal +++"

echo "+ Downloading script..."
curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh > /tmp/gnome-terminal-one-dark-theme.sh

read -r -p "+ Time to check the script, press enter when ready"
vi /tmp/gnome-terminal-one-dark-theme.sh

read -r -p "+ Press enter to install. Ctrl-C to abort"
bash /tmp/gnome-terminal-one-dark-theme.sh

echo "+ Theme installed. Activate it from the Gnome-Terminal settings."

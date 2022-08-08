set -e

read -r -p "+++ Linking systemd service files"
stow --restow --dir files --target ~/.config/systemd/user systemd

systemctl enable --user emacs
systemctl start --user emacs

echo "+ Done."


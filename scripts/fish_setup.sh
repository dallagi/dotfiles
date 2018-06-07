#!/usr/bin/env bash

set -x

fish -c "curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher"
fish -c "fisher"

pip install virtualfish
pip completion --fish > ~/.config/fish/completions/pip.fish

# append fish path to /etc/shells, only if it does not already contain it
grep -qF $(which fish) /etc/shells || echo $(which fish) | sudo tee -a "/etc/shells"

chsh -s $(which fish)


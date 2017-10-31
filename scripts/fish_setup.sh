#!/usr/bin/env bash

echo
echo "+ Configuring Fish shell..."

echo "- Installing virtualfish"
pip2 install virtualfish

echo "- Installing fisherman and plugins..."
fish -c "curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher"

echo "- Installing pip completions..."
pip completion --fish > ~/.config/fish/completions/pip.fish

fish -c "fisher"

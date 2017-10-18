#!/usr/bin/env bash

. scripts/utils.sh

# Make sure requirements are installed...
ask_to_continue "Have you read the README, and installed the required packages?" "Continuing..."

# Prepare dirs for dotfiles
ask_to_continue "Removing old fish and zsh config." "Removing..."

NVIM_DIR="$HOME/.config/nvim"
rm -rf $NVIM_DIR
mkdir -p $NVIM_DIR

FISH_DIR="$HOME/.config/fish"
rm -rf $FISH_DIR
rm -rf $HOME/.config/fisherman
mkdir -p $FISH_DIR

mkdir -p $HOME/.bin

mkdir -p $HOME/.ssh

echo "- Linking dotfiles..."
stow -t $HOME git
stow -t $HOME/.ssh ssh
stow -t $HOME/.config/fish fish
stow -t $HOME/.config/nvim nvim
stow -t $HOME/.bin bin
stow -t $HOME bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    ./scripts/macos_setup.sh
fi

./scripts/fish_setup.sh
./scripts/vim_setup.sh

echo
echo "Done."
echo

#!/usr/bin/env bash

. "$(dirname "$0")"/utils.sh

echo
echo "+ Configuring Macos-specific stuff"

brew install md5sha1sum

echo "- Installing quick look plugins"
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# todo: additional config


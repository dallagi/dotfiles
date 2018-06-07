# Install vscode extensions from file with list of names
# To get a list of installed extensions, run `code --list-extensions`
cat "$1" | xargs -L 1 code --install-extension

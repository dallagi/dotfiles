set -e

read -r -p "+++ Linking init.vim and coc-settings.json +++"
stow --restow --dir files --target ~/.config/nvim nvim
echo "+ Done."

read -r -p "+++ Installing packer and vim plugins +++"
nvim +qall # start vim to automatically install packer
nvim -c ":PackerInstall" # install plugins via packer
echo "+ Done."


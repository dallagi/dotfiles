set -e

read -r -p "+++ Linking init.vim and coc-settings.json +++"
stow --restow --dir files --target ~/.config/nvim nvim
echo "+ Done."

read -r -p "+++ Installing python neovim providers +++"
pip3 install --upgrade neovim
echo "+ Done."

read -r -p "+++ Installing vim-plug for neovim and the plugins +++"
echo "+ Installing vim-plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "+ Installing plugins..."
nvim +PlugInstall +qall

echo "+ Done."

read -r -p "+++ Installing COC plugins and language servers. You may have to stare at a blank screen for a while, and manually close a NVim window later. +++"
echo "+ Installing COC plugins..."
nvim -c 'CocInstall -sync coc-json coc-html coc-css coc-eslint coc-vetur coc-tsserver coc-solargraph coc-python |q'

echo "+ Installing language servers..."
npm install vue-language-server eslint eslint-plugin-vue -g
gem install solargraph
pip install python-language-server

echo "+ Done."


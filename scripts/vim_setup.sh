echo  "Installing python neovim providers..."
sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim

echo "Installing vim-plug for neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins..."
nvim +PlugInstall +qall

echo "Installing COC plugins..."
nvim -c 'CocInstall -sync coc-json coc-html coc-css coc-eslint coc-vetur coc-tsserver coc-solargraph coc-python |q'

echo "Installing language servers..."
npm install vue-language-server eslint eslint-plugin-vue -g
gem install solargraph
pip install python-language-server


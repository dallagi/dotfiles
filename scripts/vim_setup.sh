echo  "Installing python neovim providers..."
sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim

echo "Installing vim-plug for neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins..."
nvim +PlugInstall +qall

echo "Installing COC plugins..."
nvim -c 'CocInstall -sync coc-json coc-html coc-eslint coc-vetur coc-tsserver coc-solargraph |q'

echo "Installing language servers..."
npm install vue-language-server -g
gem install solargraph


echo  "Installing python neovim providers..."
sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim

echo "Installing vim-plug for neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins..."
nvim +PlugInstall +qall

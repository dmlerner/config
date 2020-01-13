#!/bin/bash
sudo apt install neovim i3 fonts-powerline zsh
mkdir -p ~/.config/i3
ln -s ~/dotfiles/i3config ~/.config/i3/config
ln -s ~/dotfiles/zshenv ~/.zshenv
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/xsessionrc ~/.xsessionrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm .zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc

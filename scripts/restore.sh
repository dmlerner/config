#!/bin/bash
cd $HOME
DOTFILES=$HOME/gdrive/dotfiles
SCRIPTS=$HOME/gdrive/scripts
sudo apt install neovim i3 fonts-powerline zsh xcalib thefuck python3-distutils colordiff google-rebaser ranger ack-grep nodejs npm yarn vim-google-config python3-pip
mkdir -p $HOME/.config/i3
sudo rm -rf $HOME/.config/i3/config
ln -sf $DOTFILES/i3config $HOME/.config/i3/config
mkdir -p $HOME/.config/nvim
sudo rm -rf $HOME/.config/nvim/init.vim
ln -sf $DOTFILES/nvimrc $HOME/.config/nvim/init.vim
sudo rm -rf $HOME/.xsessionrc
ln -sf $DOTFILES/xsessionrc $HOME/.xsessionrc
sudo rm -rf $HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's/exec/#exec/')"
sudo rm -rf $HOME/.vimrc
ln -sf $DOTFILES/google-desktop-vimrc $HOME/.vimrc
sudo rm -rf $HOME/.zshenv
ln -sf $DOTFILES/zshenv $HOME/.zshenv
sudo rm -rf $HOME/.zshrc
ln -sf $DOTFILES/zshrc $HOME/.zshrc
sudo rm -rf $HOME/.config/alacritty
mkdir -p $HOME/.config/alacritty
ln -sf $DOTFILES/alacritty.yml $HOME/.config/alacritty
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
chmod +x $DOTFILES/.git/hooks/*
chmod +x $SCRIPTS/.git/hooks/*
pip3 install --user pynvim
vim -c ':PlugInstall' -c ':q' -c ':q'
sudo rm -rf $HOME/.config/i3status/config
mkdir -p $HOME/.config/i3status
ln -sf $DOTFILES/i3status $HOME/.config/i3status/config

#!/bin/bash

sudo apt install neovim i3 fonts-powerline zsh xcalib thefuck python3-distutils colordiff google-rebaser ranger ack-grep nodejs npm yarn vim-google-config python3-pip xdotool
echo
pip3 install --user pynvim jedi numpy pandas matplotlib
echo

cd $HOME

GDRIVE=$HOME/gdrive
DOTFILES=$GDRIVE/config/dotfiles
SOURCE_CONFIG=$GDRIVE/config
DEST_CONFIG=$HOME/.config
chmod +x $SOURCE_CONFIG/.git/hooks/*

link () {
  local from=$DOTFILES/$1
  local to=$2
  echo $from $to
  mkdir -p $(dirname $to)
  ln -sf $from $to
}
link_home() { link $1 $HOME/$2; }
link_config() { link $1 $DEST_CONFIG/$2; }

link_config drivefs Google/DriveFS/preferences.json

if [[ ! -a $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's/exec/#exec/')"
  rm -f $HOME/install.sh
fi

if [[ ! -a $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

link_home xsessionrc .xsessionrc
link_home zshenv .zshenv
link_home zshrc .zshrc
link_home hgrc .hgrc

link_config alacritty.yml alacritty/alacritty.yml
link_config i3status i3status/config
link_config i3config i3/config
i3-msg restart

link_home vimrc .vimrc
link_config nvimrc nvim/init.vim
vim -c ':PlugInstall' -c ':q' -c ':q'

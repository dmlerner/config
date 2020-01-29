#!/bin/bash

cd $HOME

if [[ ! /usr/bin/nvim ]]; then
	wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
	mv $HOME/Downloads/nvim.appimage /usr/bin/nvim
fi

sudo apt autoremove
for i in i3 fonts-powerline zsh xcalib thefuck python3-distutils colordiff ranger ack-grep nodejs npm yarn vim-google-config python3-pip xdotool tox; do
	sudo apt-get install -y $i
done

echo
#pip3 install --user pynvim jedi numpy pandas matplotlib
echo


[[ $HOME/Dropbox ]] && CLOUD_ROOT=$HOME/Dropbox || CLOUD_ROOT=$HOME/gdrive

SOURCE_CONFIG=$CLOUD_ROOT/config
SCRIPTS=$CLOUD_ROOT/scripts
DEST_CONFIG=$HOME/.config
chmod -R +x $SOURCE_CONFIG/.git/hooks/*
chmod -R +x $SCRIPTS/*

if [[ ! $SCRIPTS/mawk ]]; then
	git clone https://github.com/dmlerner/mawk
	mv mawk $SCRIPTS
fi

if [[ -a $HOME/google ]]; then
	sudo apt install google-rebaser
	ln -sf $HOME/DriveFileStream/My\ Drive $CLOUD_ROOT
	pip3 install -e $SCRIPTS/mawk
	link_config alacritty.yml alacritty/alacritty.yml
	link_config i3status i3status/config
	link_config i3config i3/config
	i3-msg restart
fi


link () {
  local from=$SOURCE_CONFIG/$1
  local to=$2
  echo $from $to
  mkdir -p $(dirname $to)
  ln -sf $from $to
}
link_home() { link $1 $HOME/$2; }
link_config() { link $1 $DEST_CONFIG/$2; }

if [[ ! -a $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's/exec/#exec/')"
  rm -f $HOME/install.sh
fi

if [[ ! -a $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

link_home ackrc .ackrc
link_home xsessionrc .xsessionrc
link_home zshenv .zshenv
link_home zshrc .zshrc
link_home hgrc .hgrc

link_home vimrc .vimrc
link_config nvimrc nvim/init.vim
if [[ ! -a $HOME/.local/share/nvim/site/autoload/plug.vim ]]; then
  curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim -c ':PlugInstall' -c ':q' -c ':q'
fi

link_config inputrc .inputrc

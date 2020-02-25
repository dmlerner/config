#!/bin/bash

cd $HOME

if [[ ! -a /usr/bin/nvim ]]; then
	wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
	mv $HOME/Downloads/nvim.appimage /usr/bin/nvim
fi

INSTALL_APT=${1:-''}
INSTALL_PYTHON=${2:-''}

if [[ $INSTALL_APT ]]; then
	echo "installing from apt"
	sudo apt autoremove

	for i in i3 fonts-powerline zsh xcalib thefuck python3-distutils colordiff \
		ranger ack-grep nodejs npm yarn vim-google-config python3-pip xdotool tox\
		; do
		sudo apt-get install -y $i
	done
	if [[ -a $HOME/google ]]; then
		sudo apt install google-rebaser
	fi
fi

if [[ $INSTALL_PYTHON ]]; then
	echo
	echo "installing from pip"
	pip3 install --user pynvim jedi numpy pandas matplotlib
	echo
fi


if [[ -a $HOME/Dropbox ]]; then
	CLOUD_ROOT=$HOME/Dropbox
	_CLOUD_ROOT=$HOME/Dropbox
else
	CLOUD_ROOT=$HOME/gdrive
	_CLOUD_ROOT=$HOME/DriveFileStream/My\ Drive
fi

echo $CLOUD_ROOT
echo $_CLOUD_ROOT

if [[ -a "$CLOUD_ROOT" ]]; then
	rm -f "$CLOUD_ROOT"
fi
ln -sf "$_CLOUD_ROOT" "$CLOUD_ROOT"

SOURCE_CONFIG=$CLOUD_ROOT/config
SCRIPTS=$CLOUD_ROOT/scripts
DEST_CONFIG=$HOME/.config
chmod -R +x $SOURCE_CONFIG/.git/hooks/*
chmod -R +x $SCRIPTS/*

link () {
  local from=$SOURCE_CONFIG/$1
  local to=$2
  echo $from $to
  mkdir -p $(dirname $to)
  ln -sf $from $to
}
link_home() { link $1 $HOME/$2; }
link_config() { link $1 $DEST_CONFIG/$2; }


if [[ ! -a $SCRIPTS/mawk ]]; then
	git clone https://github.com/dmlerner/mawk
	mv mawk $SCRIPTS
	pip3 install -e $SCRIPTS/mawk
fi

if [[ -a $HOME/google ]]; then
	link_config alacritty.yml alacritty/alacritty.yml
	link_config i3status i3status/config
	link_config i3config i3/config
	i3-msg restart
fi


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

link_home inputrc .inputrc
link_config profile .profile

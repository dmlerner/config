#!/bin/bash

cd $HOME

#if [[ ! -a /usr/bin/nvim ]]; then
#	wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage && \
# chmod u+x $HOME/Downloads/nvim.appimage
#	mv $HOME/Downloads/nvim.appimage /usr/bin/nvim
#fi

#install alacritty
#https://docs.google.com/document/d/1d8O3VgAR9xeFzZbs2YcDUpJ158RrFOKvLIvZjQFZ2Gs/edit

INSTALL_APT=${1:-''}
INSTALL_PYTHON=${2:-''}

if [[ $INSTALL_APT ]]; then
	echo "installing from apt"
	sudo apt autoremove

	for i in git i3 fonts-powerline zsh xcalib thefuck python3-distutils colordiff \
		ranger ripgrep ack-grep nodejs npm yarn vim-google-config python3-pip xdotool tox\
		tmux fzf \
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
echo 'link cloud root'
ln -sf "$_CLOUD_ROOT" "$CLOUD_ROOT"

SOURCE_CONFIG=$CLOUD_ROOT/config
SCRIPTS=$CLOUD_ROOT/scripts
DEST_CONFIG=$HOME/.config
echo 'chmod scripts'
#chmod -R +x $SOURCE_CONFIG/.git/hooks/*
#chmod -R +x $SCRIPTS/*

link () {
  local from=$SOURCE_CONFIG/$1
  local to=$2
  echo $from $to
  mkdir -p $(dirname $to)
  ln -sf $from $to
}
link_home() { link $1 $HOME/$2; }
link_config() { link $1 $DEST_CONFIG/$2; }

echo 'linking alacritty and i3'
if [[ -a $HOME/google ]]; then
	link_config alacritty.yml alacritty/alacritty.yml
	link_config i3status i3status/config
	link_config i3config i3/config
	i3-msg restart
fi

echo 'set up zsh'
if [[ ! -a $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's/exec/#exec/')"
  rm -f $HOME/install.sh
fi
echo 'set up powerlevel10k'
if [[ ! -a $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

echo 'link_home all the things'

link_home ackrc .ackrc
link_home xsessionrc .xsessionrc
link_home zshenv .zshenv
link_home zshrc .zshrc
link_home hgrc .hgrc
link_home tmux .tmux.conf

link_home vimrc .vimrc
link_config nvimrc nvim/init.vim
if [[ ! -a $HOME/.local/share/nvim/site/autoload/plug.vim ]]; then
  curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim -c ':PlugInstall' -c ':q' -c ':q'
fi

link_home inputrc .inputrc
link_config profile .profile

#! /bin/bash

# Description:
#   Compile a full-featured Vim from source on Ubuntu/Debian distros. Based
#   entirely on
#   https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
#
# Use:
#   ./compile_full_vim.sh

main(){
	#apt-get update
	echo "y" | sudo apt-get remove \
		vim \
		vim-runtime \
		gvim \
		vim-tiny \
		vim-common \
		vim-gui-common
	echo "y" | sudo apt-get install --fix-missing\
		libncurses5-dev \
		lua5.1 liblua5.1-dev \
		libgnome2-dev \
		libgnomeui-dev \
		libgtk2.0-dev \
		libatk1.0-dev \
		libbonoboui2-dev \
		libcairo2-dev \
		libx11-dev \
		libxpm-dev \
		libxt-dev \
		ruby-dev \
		python3.8-dev \
		libperl-dev \
		mercurial

	cd ~
	[ ! -d "~/vim" ] && git clone https://github.com/vim/vim.git
	cd vim
	./configure --with-features=huge \
		--enable-multibyte \
		--enable-rubyinterp=yes \
		--enable-pythoninterp=no \
		--enable-python3interp=yes \
		--with-python3-config-dir=/usr/bin/python3-config \
		--with-python3-command=/usr/bin/python3 \
		--enable-perlinterp=yes \
		--enable-luainterp=yes \
		--enable-cscope=yes \
		--enable-gui=auto \
		--enable-gtk2-check \
		--enable-gnome-check \
		--enable-fail-if-missing=yes \
	        --with-x \
		--prefix=/opt/vim81
	#make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
	sudo checkinstall
}

main

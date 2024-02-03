#!/bin/sh

script_pos=$PWD

# Make backup file for every files given in argument
backup() {
	for bak in $@
	do
		[ -f $bak ] && echo $bak file exists, creating $bak.bak backup && cp $bak $bak.bak
		[ -d $bak ] && echo $bak directory exists, creating $bak.bak backup && cp -r $bak $bak.bak
	done

	return 0
}


install_i3_conf() {
	mkdir -p $HOME/.config
	backup $HOME/.config/i3 && cp -r i3 $HOME/.config
}


install_nvim_conf() {
	mkdir -p $HOME/.config
	backup $HOME/.config/nvim && cp -r nvim $HOME/.config
}


installX_conf() {
	echo Copying next files to /etc/X11/xorg.conf.d :
	ls xorg
	echo sudo is required for the next command : `sudo backup /etc/X11/xorg.conf.d && cp -r xorg /etc/X11/xorg.conf.d`

	sudo backup /etc/X11/xorg.conf.d && cp -r xorg /etc/X11/xorg.conf.d

	backup $HOME/.xinitrc && cp .xinitrc $HOME
}


install_profile() {
	backup $HOME/.profile && cp .profile $HOME
}


install_shell() {
	backup $HOME/.shell && cp -r .shell $HOME
}


install_polybar_conf() {
	mkdir -p $HOME/.config
	cp -r polybar $HOME/.config
}


install_scripts() {
	mkdir -p $HOME/.local/bin
	cp my_scripts/* $HOME/.local/bin
}


install_picom_config() {
	mkdir -p $HOME/.config
	cp picom.conf $HOME/.config/picom.conf
}


install_st() {
	mkdir -p $HOME/.local/srcs
	cd $HOME/.local/srcs
	git clone https://github.com/NemoDacremont/st.git
	cd st

	make clean install DESTDIR=$HOME/.local
	cd $script_pos
}


install_dwm() {
	mkdir -p $HOME/.local/srcs
	cd $HOME/.local/srcs
	git clone https://github.com/NemoDacremont/dwm.git
	cd dwm

	make clean install DESTDIR=$HOME/.local
	cd $script_pos
}

install_profile



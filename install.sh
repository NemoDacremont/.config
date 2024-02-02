#!/usr/bin/sh

function install_i3_conf() {
	cp -r i3 $HOME/.config/i3
}

function install_nvim_conf() {
	cp -r nvim $HOME/.config/i3
}


function installX_conf() {
	echo Copy xorg to /etc/X11
	sudo cp -r xorg /etc/X11

	cp .xinitrc $HOME
}

function install_profile() {
	cp .profile $HOME
}

function install_shell() {
	cp -r .shell $HOME
}

function install_polybar_conf() {
	cp -r polybar $HOME/.config
}

function install_scripts() {
	mkdir -p $HOME/.local/bin
	cp my_scripts/* $HOME/.local/bin
}





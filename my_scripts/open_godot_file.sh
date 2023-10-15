#!/bin/bash
/usr/bin/alacritty -e /usr/bin/nvim $* || (echo error ! && sleep 2)

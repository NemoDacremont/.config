#!/bin/bash

#CURRENT_BRIGHTNESS=$(xbacklight -get | grep -E -o '[0-9]+' | head -1)
#NEW_BRIGHTNESS=`echo $CURRENT_BRIGHTNESS - 10 | bc`

xbacklight -dec 10


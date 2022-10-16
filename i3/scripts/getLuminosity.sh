#!/usr/bin/env bash

LUMINOSITY=`xbacklight -get`
PERCENT=${LUMINOSITY%.*}

echo $PERCENT%


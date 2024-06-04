#!/bin/bash

choices="laptop\noffice-dual\noffice-mono\nhome"
chosen=$(echo -e $choices | dmenu -i)

case "$chosen" in
    laptop) xrandr --output eDP-1 --auto --primary --output HDMI-1 --off ;;
    office-mono) xrandr --output eDP-1 --off --output HDMI-1 --auto --primary ;;
    office-dual) xrandr --output eDP-1 --auto --primary --output HDMI-1 --auto ;;
    home) xrandr --output eDP-1 --off --output HDMI-1 --auto --primary --output DP-1 --rotate right;;
esac

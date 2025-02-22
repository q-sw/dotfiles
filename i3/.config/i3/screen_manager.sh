#!/bin/bash

choices="laptop\noffice-dual\noffice-mono\nhome\nhome-work"
chosen=$(echo -e $choices | dmenu -i)

case "$chosen" in
    laptop) xrandr --output eDP-1 --auto --primary --output HDMI-1 --off --output DP-3 --off && setxkbmap fr ;;
    office-mono) xrandr --output eDP-1 --off --output DP-3 --auto --primary && setxkbmap fr;;
    office-dual) xrandr --output eDP-1 --auto --primary --output DP-3 --auto --above eDP-1 && setxkbmap fr;;
    home) xrandr --output eDP-1 --off --output HDMI-1 --auto --primary --output DP-1 --rotate right && setxkbmap us;;
    home-work) xrandr --output eDP-1 --off --output HDMI-1 --auto --primary --output DP-3 --auto --right-of HDMI-1 --rotate right && setxkbmap us;;
esac

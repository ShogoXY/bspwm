#!/bin/bash

printf"
+++++++++++++++++++++++++++++++++++++++++
+                                       +
+     Instalation and simple config     +
+     BSPWM and SDDM window manager     +
+                                       +
+++++++++++++++++++++++++++++++++++++++++
"

sudo apt-get vim git install feh bspwm sddm picom sxhkd polybar kitty rofi thunar firefox -y

sudo systemctl set-default graphical.target
sudo systemctl enable sddm


mkdir -p ~/.config/polybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd




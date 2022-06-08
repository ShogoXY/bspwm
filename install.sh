#!/bin/bash
clear
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++"
echo "+                                       +"
echo "+     Instalation and simple config     +"
echo "+     BSPWM and SDDM window manager     +"
echo "+                                       +"
echo "+++++++++++++++++++++++++++++++++++++++++"
echo ""
echo ""

sudo echo ""
echo "Installation will start in 5 sec"

for i in {5..1};
        do
                echo -ne "   $i..." \\r
        	sleep 1
        done   



SYS=` cat /etc/*-release 2> /dev/null | grep PRETTY_NAME `
de=$(echo $DESKTOP_SESSION)


if [[ $SYS =~ "Debian" ]]; then

    sudo apt-get update -y

    if [[ "$de" != "" ]]
        then
	    sudo apt-get -y install vim git feh bspwm sxhkd polybar kitty rofi x11-xserver-utils
        else
	    sudo apt-get -y install vim git feh bspwm sddm picom sxhkd polybar x11-xserver-utils kitty rofi thunar firefox-esr mirage lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs
            sudo systemctl set-default graphical.target
            sudo systemctl enable sddm
            wget -O ~/.config/picom.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/picom.conf
    fi
    

elif [[ $SYS =~ "Fedora" ]]; then
    sudo dnf update -y
    sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    
    
    if [[ "$de" != "" ]]
        then
	    sudo dnf -y install vim git feh bspwm sxhkd polybar xsetroot kitty rofi flatpak 
	    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        else
	    sudo dnf -y install vim git feh bspwm sddm picom sxhkd xsetroot polybar kitty rofi thunar firefox mirage flatpak lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	    sudo systemctl set-default graphical.target
            sudo systemctl enable sddm
            wget -O ~/.config/picom.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/picom.conf
    fi
 fi
     




#sudo apt-get update -y
#sudo apt-get -y install vim git feh bspwm sddm picom sxhkd polybar kitty rofi thunar firefox-esr mirage lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs

mkdir -p ~/.config/polybar
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/kitty
touch ~/.config/user-dirs.dirs

printf"
XDG_DESKTOP_DIR="$HOME/Pulpit"
XDG_DOWNLOAD_DIR="$HOME/Pobrane"
XDG_TEMPLATES_DIR="$HOME/Szablony"
XDG_PUBLICSHARE_DIR="$HOME/Publiczny"
XDG_DOCUMENTS_DIR="$HOME/Dokumenty"
XDG_MUSIC_DIR="$HOME/Muzyka"
XDG_PICTURES_DIR="$HOME/Obrazy"
XDG_VIDEOS_DIR="$HOME/Wideo"
"


wget -O ~/.config/sxhkd/sxhkdrc https://raw.githubusercontent.com/ShogoXY/bspwm/main/sxhkd/sxhkdrc 
wget -O ~/.config/bspwm/bspwmrc https://raw.githubusercontent.com/ShogoXY/bspwm/main/bspwm/bspwmrc
wget -O ~/.config/polybar/config.ini https://raw.githubusercontent.com/ShogoXY/bspwm/main/polybar/config.ini
wget -O ~/.config/polybar/launch.sh https://raw.githubusercontent.com/ShogoXY/bspwm/main/polybar/launch.sh
wget -O ~/.config/kitty/kitty.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/kitty/kitty.conf
wget -O ~/.gtkrc-2.0 https://raw.githubusercontent.com/ShogoXY/bspwm/main/gtkrc-2.0

chmod +x ~/.config/polybar/launch.sh
cd
chmod +x ~/.config/bspwm/bspwmrc


mkdir -p ~/.fonts
mkdir -p ~/wallpapers
mkdir -p ~/.config/rofi
git clone https://github.com/ShogoXY/bspwm
cp -r ~/bspwm/fonts ~/.fonts
cp -r ~/bspwm/wallpapers ~/wallpapers
cp -r ~/bspwm/rofi ~/.config/rofi
chmod +x ~/.config/rofi/poweermenu/powermenu.sh
rm -rf ~/bspwm

echo "Do you want to Reboot the system [y/N] "


while read -r -p " " odp
do
if [[ "$odp" =~ ^([yY][eE][sS]|[yY]|[tT])$ ]]
then
	sudo reboot
	
else

	echo "to set setting you must reboot te system"
fi
break
done


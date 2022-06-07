#!/bin/bash
clear
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++"
echo "+                                       +"
echo "+     Instalation and simple config     +"
echo "+     BSPWM and SDDM window manager     +"
echo "+                                       +"
echo "+++++++++++++++++++++++++++++++++++++++++"

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
	        sudo apt-get -y install vim git feh bspwm sxhkd polybar kitty rofi
        else
	        sudo apt-get -y install vim git feh bspwm sddm picom sxhkd polybar kitty rofi thunar firefox-esr mirage lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs
            sudo systemctl set-default graphical.target
            sudo systemctl enable sddm
            wget -O ~/.config/picom.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/picom.conf
    fi
    

elif [[ $SYS =~ "Fedora" ]]; then
    sudo dnf update -y
    
    if [[ "$de" != "" ]]
        then
	        sudo dnf -y install vim git feh bspwm sxhkd polybar kitty rofi
        else
	        sudo dnf -y install vim git feh bspwm sddm picom sxhkd polybar kitty rofi thunar firefox mirage lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs
            sudo systemctl set-default graphical.target
            sudo systemctl enable sddm
            wget -O ~/.config/picom.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/picom.conf
    fi
     




#sudo apt-get update -y
#sudo apt-get -y install vim git feh bspwm sddm picom sxhkd polybar kitty rofi thunar firefox-esr mirage lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs

mkdir -p ~/.config/polybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/wallpapers

wget -O ~/.config/sxhkd/sxhkdrc https://raw.githubusercontent.com/ShogoXY/bspwm/main/sxhkd/sxhkdrc 
wget -O ~/.config/bspwm/bspwmrc https://raw.githubusercontent.com/ShogoXY/bspwm/main/bspwm/bspwmrc
wget -O ~/.config/polybar/config.ini https://raw.githubusercontent.com/ShogoXY/bspwm/main/polybar/config.ini
wget -O ~/.config/polybar/launch.sh https://raw.githubusercontent.com/ShogoXY/bspwm/main/polybar/launch.sh

chmod +x ~/.config/polybar/launch.sh
cd ~/wallpapers
wget https://raw.githubusercontent.com/ShogoXY/bspwm/main/wallpapers/car.jpg
wget https://raw.githubusercontent.com/ShogoXY/bspwm/main/wallpapers/hole.jpg
wget https://raw.githubusercontent.com/ShogoXY/bspwm/main/wallpapers/leaf.jpg
wget https://raw.githubusercontent.com/ShogoXY/bspwm/main/wallpapers/motyl.jpg
wget https://raw.githubusercontent.com/ShogoXY/bspwm/main/wallpapers/mountain.png
cd
chmod +x ~/.config/bspwm/bspwmrc


git clone https://github.com/ShogoXY/bspwm
mv -r ~/bspwm/fonts ~/.fonts
rm -r ~/bspwm

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


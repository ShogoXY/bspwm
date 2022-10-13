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
	    sudo apt-get -y install  make pip npm cargo vim git feh bspwm sxhkd polybar kitty lxpolkit rofi x11-xserver-utils curl unzip tar gzip gcc g++ pip dunst arandr flatpak
            #wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
            wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
            sudo dpkg -i nvim-linux64.deb
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        #     sudo flatpak install spotify -y    
            rm nvim-linux64.deb
            
	    
	    
            
        else
	        sudo apt-get -y install make pip npm cargo vim git feh bspwm sddm picom pip sxhkd polybar flatpak lxpolkit x11-xserver-utils kitty rofi thunar dunst arandr curl unzip tar gzip gcc g++ firefox-esr mirage lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs
            sudo apt-get -y install --no-install-recommends qml-module-qtquick-layouts qml-module-qtgraphicaleffects qml-module-qtquick-controls2 libqt5svg5
            sudo systemctl set-default graphical.target
            sudo systemctl enable sddm
            

            #wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
            wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
            sudo dpkg -i nvim-linux64.deb
            rm nvim-linux64.deb
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        #     sudo flatpak install spotify -y    
            
	    
    fi
    

elif [[ $SYS =~ "Fedora" ]]; then
    sudo dnf update -y
    sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    
    
    if [[ "$de" != "" ]]
        then
	    sudo dnf -y install make pip npm cargo vim git feh bspwm sxhkd polybar xsetroot kitty rofi lxpolkit flatpak curl unzip tar gzip gcc g++ pip neovim python3-neovim dunst arandr
	    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        #     sudo flatpak install spotify -y  
	    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
	    wget -O ~/.config/lvim/config.lua https://raw.githubusercontent.com/ShogoXY/bspwm/main/config.lua
            
        else
	        sudo dnf -y install make pip npm cargo vim git feh bspwm sddm @base-x picom sxhkd xsetroot polybar kitty rofi lxpolkit thunar firefox pip mirage curl unzip dunst arandr tar gzip gcc g++ flatpak lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs neovim python3-neovim qt5-qtgraphicaleffects qt5-qtquickcontrols2 qt5-qtsvg
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	        sudo systemctl set-default graphical.target
            sudo systemctl enable sddm
        #     sudo flatpak install spotify -y   
	    
    fi
 fi
     




#sudo apt-get update -y
#sudo apt-get -y install vim git feh bspwm sddm picom sxhkd polybar kitty rofi thunar firefox-esr mirage lxappearance breeze-cursor-theme papirus-icon-theme arc-theme xdg-utils xdg-user-dirs

mkdir -p ~/.config/polybar
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/kitty
mkdir -p ~/.config/gtk-3.0
#mkdir -p ~/.config/rofi/
#mkdir -p ~/.config/Thunar
#mkdir -p ~/.fonts
#mkdir -p ~/wallpapers
touch ~/.config/user-dirs.dirs

printf "
XDG_DESKTOP_DIR="$HOME/Pulpit"
XDG_DOWNLOAD_DIR="$HOME/Pobrane"
XDG_TEMPLATES_DIR="$HOME/Szablony"
XDG_PUBLICSHARE_DIR="$HOME/Publiczny"
XDG_DOCUMENTS_DIR="$HOME/Dokumenty"
XDG_MUSIC_DIR="$HOME/Muzyka"
XDG_PICTURES_DIR="$HOME/Obrazy"
XDG_VIDEOS_DIR="$HOME/Wideo"
" > ~/.config/user-dirs.dirs


wget -O ~/.config/sxhkd/sxhkdrc https://raw.githubusercontent.com/ShogoXY/bspwm/main/sxhkd/sxhkdrc 
wget -O ~/.config/bspwm/bspwmrc https://raw.githubusercontent.com/ShogoXY/bspwm/main/bspwm/bspwmrc
wget -O ~/.config/polybar/config.ini https://raw.githubusercontent.com/ShogoXY/bspwm/main/polybar/config.ini
wget -O ~/.config/polybar/launch.sh https://raw.githubusercontent.com/ShogoXY/bspwm/main/polybar/launch.sh
wget -O ~/.config/kitty/kitty.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/kitty/kitty.conf
wget -O ~/.config/picom.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/picom.conf
wget -O ~/.gtkrc-2.0 https://raw.githubusercontent.com/ShogoXY/bspwm/main/gtkrc-2.0
wget -O ~/.config/gtk-3.0/settings.ini https://raw.githubusercontent.com/ShogoXY/bspwm/main/settings.ini


chmod +x ~/.config/polybar/launch.sh
cd
chmod +x ~/.config/bspwm/bspwmrc


git clone https://github.com/ShogoXY/bspwm

cp -r ~/bspwm/fonts/. ~/.fonts
cp -r ~/bspwm/Thunar/. ~/.config/Thunar
cp -r ~/bspwm/wallpapers/. ~/wallpapers
sudo cp -r ~/bspwm/sugar-candy/. /usr/share/sddm/themes/sugar-candy
sudo mv /etc/sddm.conf /etc/sddm.conf.bak
sudo cp -r ~/bspwm/sddm.conf /etc/
git clone https://github.com/jluttine/rofi-power-menu

cp -r ~/rofi-power-menu/. ~/.config/rofi/
cp -r ~/bspwm/rofi/. ~/.config/rofi/
rm -rf ~/bspwm
rm -rf ~/rofi-power-menu
xdg-user-dirs-update



#sudo echo "#!/bin/bash" >> spotify
#sudo echo "flatpak run com.spotify.Client" >> spotify
#sudo chmod +x spotify
#sudo cp spotify /usr/local/bin/spotify


echo ""
echo ""
echo "Do you want to Install LunarVim [y/N] "
echo ""

while read -r -p " " odp
do
if [[ "$odp" =~ ^([yY][eE][sS]|[yY]|[tT])$ ]]
then
	bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
	    wget -O ~/.config/lvim/lvim_config.txt https://raw.githubusercontent.com/ShogoXY/bspwm/main/lvim_config.txt 
        cat ~/.config/lvim/lvim_config.txt >> ~/.config/lvim/config.lua
        rm ~/.config/lvim/lvim_config.txt
        ~/.local/bin/lvim -c 'TSupdate' -c 'autocmd User PackerComplete quitall' -c 'PackerSync';
	
else
        echo ""
	echo "BYE!!"
        echo ""
fi
break
done


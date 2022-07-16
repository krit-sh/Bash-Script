##BASH SCRIPT TO DO POST ARCH INSTALLATION STEPS

##UPDATING THE SYSTEM
sudo pacman -Syu

##INSTALLING BLACKARCH AND OTHER STUFF
read -p "DO YOU WANT TO INSTALL BLACKARCH Y/N: " ch1
if [ "$ch1" = "Y" -o "$ch1" = "y" ]; then
	curl -O https://blackarch.org/strap.sh
	echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c
	chmod +x strap.sh
	sudo ./strap.sh
	sudo pacman -Syu
fi

read -p "DO YOU WANT TO INSTALL GNOME-TWEAKS Y/N: " ch2
if [ "$ch2" = "Y" -o "$ch2" = "y" ]; then
	sudo pacman -S gnome-tweaks 
fi

read -p "DO YOU WANT TO INSTALL yay Package manager Y/N: " ch3
if [ "$ch3" = "Y" -o "$ch3" = "y" ]; then
	sudo pacman -S yay
	echo "ALSO INSTALLING SOME ADDITIONAL PACKAGES TO RUN yay PROPERLY"
	sudo pacman -S binutils base-devel
fi

read -p "DO YOU WANT TO INSTALL BLACKARCH CONFIG ICONS Y/N: " ch4
if [ "$ch4" = "Y" -o "$ch4" = "y" ]; then
	yay -S blackarch-config-icons 
fi

read -p "DO YOU WANT TO INSTALL FIREFOX Y/N: " ch5
if [ "$ch5" = "Y" -o "$ch5" = "y" ]; then
	sudo pacman -S firefox 
fi

read -p "DO YOU WANT TO REMOVE THESE APPLICATIONS gnome browser, music, contacts, maps, weather, books, gedit Y/N: " ch6
if [ "$ch6" = "Y" -o "$ch6" = "y" ]; then
	sudo pacman -Rsunc epiphany gnome-music gnome-contacts gnome-maps gnome-weather gnome-books gedit
fi

read -p "DO YOU WANT TO INSTALL pfetch TO CUSTOMIZE YOUR TERMINAL Y/N: " ch
if [ "$ch" = "Y" -o "$ch" = "y" ]; then
	yay -Syu pfetch
	echo pfetch >> .bashrc
	sudo pacman -S gnome-software-packagekit-plugin
fi

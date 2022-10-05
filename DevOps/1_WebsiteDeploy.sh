#!/bin/bash

# >>>> Global Variables
webDir=/var/www/html
tmpDir=/tmp

# >>>> Choosing Package Manager
# **** Arch Distros
if [ -x "$(command -v pacman)" ];
then
    webDir="/srv/http"
    webServer="httpd"
    packagesNeeded="apache unzip wget"
    sudo pacman -S --noconfirm $packagesNeeded

# **** Debian Based Distros
elif [ -x "$(command -v apt)" ]; 
then 
    webServer="apache2"
    packagesNeeded="$webServer unzip wget"
    sudo apt install $packagesNeeded
# --- Adjusting The Firewall
    sudo ufw allow 'Apache'

# **** Fedora, RedHat, CentOS Distros
elif [ -x "$(command -v dnf)" ];     
then 
    packagesNeeded="unzip wget"
    sudo dnf install group install "Web Server"
    sudo dnf install $packagesNeeded
# --- Adjusting The Firewall
    sudo firewall-cmd --add-service=http --add-service=https --permanent
    sudo firewall-cmd --reload

# **** OpenSUSE Distro
elif [ -x "$(command -v zypper)" ];  
then 
    packagesNeeded="httpd unzip wget"
    sudo zypper install $packagesNeeded
else 
    echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; fi


# >>>> Enabling Server
sudo systemctl start $webServer
sudo systemctl enable $webServer

# >>>> Getting an URL
echo "Please, enter a URL to a website, so I can deploy your resource"
read URL

# >>>> Local Variables
BASENAME=$(basename $URL | cut -d '.' -f1)
ZIP=$BASENAME.zip

# >>>> Downloading And Unpacking Website
wget -O $tmpDir/$ZIP $URL 
sudo unzip $tmpDir/$ZIP -d $tmpDir/$BASENAME/ > $tmpDir/logs.log

# *** Retrive The Name Of Website Folder
FOLDERNAME=$(cat $tmpDir/logs.log | sed -n 's|\(/index\).*||p' | sed -n 's|.*/||p')

# *** Website Folder Location
WEBSITE=$tmpDir/$BASENAME/$FOLDERNAME/

# >>>> Plasing Website And Cleaning tmpDir
sudo rm -rf $webDir/*
sudo cp -r $WEBSITE/* $webDir/
sudo rm -rf $tmpDir/*

# >>>> Reastart Server
sudo systemctl restart $webServer
#/sbin/restorecon -v /var/www/html/index.html 

#grep link intet
ip address

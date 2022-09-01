#!/bin/bash

# >>>> Global Variables
PACKS="httpd unzip wget"
WEBDIR=/var/www/html
SERVICE=httpd
TMP=/tmp/

# >>>> Installing Packs
sudo dnf install -y $PACKS

# >>>> Enabling Service
sudo systemctl start $SERVICE
sudo systemctl enable $SERVICE

# >>>> Getting an URL
echo "Please, enter a URL to a website, so I can deploy your resource"
read URL

# >>>> Local Variables
BASENAME=$(basename $URL | cut -d '.' -f1)
ZIP=$BASENAME.zip

# >>>> Downloading And Unpacking Website
wget -O $TMP/$ZIP $URL 
sudo unzip $TMP/$ZIP -d $TMP/$BASENAME/ > logs.log
# *** Retrive The Name Of Website Folder
FOLDERNAME=$(cat logs.log | sed -n -e "s|^.*$BASENAME/||p" | cut -d '/' -f1 | sed -n "1 p")
# *** Website Folder Location
WEBSITE=$TMP/$BASENAME/$FOLDERNAME

# >>>> Plasing Website And Cleaning TMP
sudo mv $WEBSITE/* $WEBDIR/
sudo rm -rf $TMP/*

# >>>> Reastart Service
sudo systemctl restart $SERVICE

#grep link intet
ip addr

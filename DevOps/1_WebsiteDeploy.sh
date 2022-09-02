#!/bin/bash

# >>>> Global Variables
PACKS="httpd unzip wget"
WEBDIR=/var/www/html
SERVICE=httpd
TMP=/tmp

# >>>> Installing Packs
sudo dnf install -y $PACKS

# >>>> Enabling Service
sudo systemctl start $SERVICE
sudo systemctl enable $SERVICE

# >>>> Getting an URL
echo "Please, enter a URL to a website, so I can deploy your resource"
read URL
#URL=https://www.free-css.com/assets/files/free-css-templates/download/page282/astro-motion.zip

# >>>> Local Variables
BASENAME=$(basename $URL | cut -d '.' -f1)
ZIP=$BASENAME.zip

# >>>> Downloading And Unpacking Website
wget -O $TMP/$ZIP $URL 
sudo unzip $TMP/$ZIP -d $TMP/$BASENAME/ > $TMP/logs.log

# *** Retrive The Name Of Website Folder
FOLDERNAME=$(cat $TMP/logs.log | sed -n 's|\(/index\).*||p' | sed -n 's|.*/||p')

# *** Website Folder Location
WEBSITE=$TMP/$BASENAME/$FOLDERNAME/

# >>>> Plasing Website And Cleaning TMP
sudo rm -rf $WEBDIR/*
sudo cp -r $WEBSITE/* $WEBDIR/
sudo rm -rf $TMP/*

# >>>> Reastart Service
sudo systemctl restart $SERVICE
#/sbin/restorecon -v /var/www/html/index.html 

#grep link intet
ip address

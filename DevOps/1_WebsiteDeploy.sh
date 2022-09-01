#!/bin/bash

# >>>> Global Variables
PACKS="httpd, unzip, wget"
WEBDIR=/var/www/html
SERVICE=httpd
ZIP=website.zip
BASENAME=$(basename $WEBDIR | cut -d. -f1)

# >>>> Installing Packs
sudo apt install $PACKS

# >>>> Enabling Service
sudo systemctl start $SERVICE
sydo systemctl enable $SERVICE

# >>>> Getting an URL
echo "Please, enter a URL to a website, so I can deploy your resource"
read URL

# >>>> Downloading And Unpacking Website
wget -O $ZIP -P $WEBDIR/ $URL
unzip $WEBDIR/$ZIP -d $WEBDIR
cd $WEBDIR/$BASENAME/
mv ./* $WEBDIR/
#Add Cleaning feature

# >>>> Reastart Service
sudo systemctl restart $SERVICE

#grep link intet
ip addr

#!/bin/bash

# >>>> Global Variables
PACKS="httpd unzip wget"
WEBDIR=/var/www/html
SERVICE=httpd


# >>>> Installing Packs
sudo dnf install -y $PACKS

# >>>> Enabling Service
sudo systemctl start $SERVICE
sudo systemctl enable $SERVICE

# >>>> Getting an URL
echo "Please, enter a URL to a website, so I can deploy your resource"
read URL

# *** Local Variables
BASENAME=$(basename $URL | cut -d. -f1)
ZIP=$BASENAME.zip

# >>>> Downloading And Unpacking Website
sudo wget -O $WEBDIR/$ZIP $URL 
unzip $WEBDIR/$ZIP -d $WEBDIR/
cd $WEBDIR/$BASENAME/
sudo mv ./$BASENAME/* $WEBDIR/
#Add Cleaning feature

# >>>> Reastart Service
sudo systemctl restart $SERVICE

#grep link intet
ip addr

#!/bin/bash


echo "Hi, you've run the script that filters the output of LS command"
echo ====================
echo

echo "Let's filter your files"
echo ====================
echo "Please, type Y or N for what you want"
echo ====================
echo

read -p "Permissions - " PRERMS
read -p "Number of hard links to the file - " NUMLINKS
read -p "File Owner - " OWNER
read -p "File Group - " GROUP
read -p "File Size - " SIZE
read -p "Date and Time - " DATE
read -p "Filename - " FILENAME 
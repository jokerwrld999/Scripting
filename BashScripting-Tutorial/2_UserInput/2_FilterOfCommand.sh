#!/bin/bash


echo "Hi, you've run the script that filters the output of LS command"
echo ====================
echo

echo "Let's filter your files"
echo ====================
echo "Please, type Y or N for what you want"
echo ====================
echo

ARGS="PERMS NUMLINKS OWNER"
for i in $ARGS
do
    while :
    do
        read -p "Permissions $i - " beta
        echo "That's your answer: $beta"
        if [[ $beta =  "Y" ]] || [[ $beta = N ]]
        then
            $i=$beta
            echo "Great"
            break
        else 
            echo "Are you retarded or what?"
            echo "Commone you stupid ass, just type Y or N" 
        fi
    done   
done
echo $PERMS
#read -p "Number of hard links to the file - " NUMLINKS
#read -p "File Owner - " OWNER
#read -p "File Group - " GROUP
#read -p "File Size - " SIZE
#read -p "Date and Time - " DATE
#read -p "Filename - " FILENAME 
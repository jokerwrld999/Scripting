#!/bin/bash


echo "Hi, you've run the script that filters the output of LS command"
echo ====================
echo

echo "Let's filter your files"
echo ====================
echo "Please, type Y or N for what you want"
echo ====================
echo

FIELDS="PERMS NUMLINKS OWNER"
for FIELD in $FIELDS
do
    case $FIELD in
        $FIELD ) MSG="Permissions - " ;;
        $FIELD ) MSG="Permissions - " ;;
        $FIELD ) MSG="File Owner - " ;;
        $FIELD ) MSG="File Group - " ;;
        $FIELD ) MSG="File Size - " ;;
        $FIELD ) MSG="Date and Time - " ;;
        $FIELD ) MSG="Filename - " ;;
        * ) MSG="Incorrect Data"
    esac
    while :
    do
        read -p "$MSG" TMP
        if [[ $TMP =  "Y" ]] || [[ $TMP = N ]]
        then
            export $FIELD=$TMP
            echo "Great"
            break
        else 
            echo "Are you retarded or what?"
            echo "Commone you stupid ass, just type Y or N" 
        fi
    done   
done
echo $FIELDS

#!/bin/bash


echo "Hi, you've run the script that filters the output of LS command"
echo ====================
echo

echo "Let's filter your files"
echo ====================
echo "Please, type Y or N for what you want"
echo ====================
echo

FIELDS="PERMS NUMLINKS OWNER GROUP SIZE DATE FILENAME"
counter=1
for FIELD in $FIELDS
do
    while :
    do
        case $FIELD in
        ( FILETYPE ) MSG="The type of file - " ;;
        ( PERMS ) MSG="Permissions - " ;;
        ( NUMLINKS ) MSG="Number of links - " ;;
        ( OWNER ) MSG="File Owner - " ;;
        ( GROUP ) MSG="File Group - " ;;
        ( SIZE ) MSG="File Size - " ;;
        ( DATE ) MSG="Date and Time - " ;;
        ( FILENAME ) MSG="Filename - " ;;
        ( * ) MSG="Incorrect Data" ;;
        esac

        read -p "$MSG" TMP
        
        if [[ $TMP =  "Y" ]] || [[ $TMP =  "y" ]]
        then
            export $FIELD="\$$counter " 
            #export $FIELD=$TMP
             
            counter=$(( $counter + 1 ))
            echo "Great"
            break
        elif [[ $TMP = "N" ]] || [[ $TMP = "n" ]]
        then
            counter=$(( $counter + 1 ))
            break
        else 
            echo "Are you retarded or what?"
            echo "Come on you stupid ass, just type Y or N"
        fi
        
    done   
done

STACK="$FILETYPE $PERMS $NUMLINKS $OWNER $GROUP $SIZE $DATE $FILENAME"

columns=$(echo $STACK |  sed 's/$7/$9/g' | sed 's/\$6/$6 $7 $8/g') 

echo $columns

ls -l | awk "{print \"$columns\"}"

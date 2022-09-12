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
for FIELD in $FIELDS
do
    export counter=1
    while :
    do
        case $FIELD in
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
        
        if [[ $TMP =  "Y" ]] || [[ $TMP = N ]]
        then
            case $TMP in
                ( Y ) export $FIELD="\$$counter " 

            esac
            #export $FIELD=$TMP
             
             
             (($counter+=1))
            echo "Great"
            break
        else 
            echo "Are you retarded or what?"
            echo "Come on you stupid ass, just type Y or N" a
        fi
    done   
done

STACK="$PERMS $NUMLINKS $OWNER $GROUP $SIZE $DATE $FILENAME"



echo $STACK


#ls -l | awk "{print $STACK}"

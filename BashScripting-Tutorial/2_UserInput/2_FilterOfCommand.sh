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
            export $FIELD=$TMP
            echo "Great"
            break
        else 
            echo "Are you retarded or what?"
            echo "Come on you stupid ass, just type Y or N" a
        fi
    done   
done

STACK="$PERMS $NUMLINKS $OWNER $GROUP $SIZE $DATE $FILENAME"
i=1
B=""
    for j in $STACK
    do
        
        echo "i $i"
        if [[ $j = Y ]]
        then
            export B="$B"\$"$i "  
           

            
        elif [[ $j = N ]]
        then
            export B="$B "
             
        fi
        ((i++))
    
    done

DATESED=$(echo $B | grep -o '$6')
 case $B in
                ( $DATESED ) $B='$6 " " $7 " " $8' ;;
                ( $7 ) $B='$9 " "' ;;
esac

echo DOLLARB $B
ls -l | awk "{print $B}"

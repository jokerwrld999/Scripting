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
        ( PERMS ) MSG="The Type Of Files And Permissions - " ;;
        ( NUMLINKS ) MSG="Number of links - " ;;
        ( OWNER ) MSG="File's Owner - " ;;
        ( GROUP ) MSG="File's Group - " ;;
        ( SIZE ) MSG="File's Size - " ;;
        ( DATE ) MSG="Date and Time - " ;;
        ( FILENAME ) MSG="Filename - " ;;
        ( * ) MSG="Incorrect Data" ;;
        esac

        read -p "$MSG" TMP
        
        if [[ $TMP =  "Y" ]] || [[ $TMP =  "y" ]]
        then
            backslashDollar="\$"
            spaceDelim='" "'
            export $FIELD="${backslashDollar}${counter}${spaceDelim}" 
            counter=$(( $counter + 1 ))
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

stringOfAnswers="$PERMS $NUMLINKS $OWNER $GROUP $SIZE $DATE $FILENAME"
filteredString=$(echo $stringOfAnswers |  sed 's|$7|$9|g' | sed 's|\$6|$6" "$7" "$8|g')

ls -la > list.txt
sed -i '2s/^/PERMITIONS NUMLINKS OWNER GROUP SIZE MONTH DAY TIME FILENAME\n/' list.txt
cat list.txt | awk "{print $filteredString}" | column -ts ' '


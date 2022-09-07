#!/bin/bash

# >>>> Number Of Line
echo "Hey, what line do you want to print?"
read -p "Line Number: " LINENUM

# >>>> Number to echo
case $LINENUM in 

    1)
        FORMATNUM="$LINENUM"st
        ;;

    2)
        FORMATNUM="$LINENUM"nd
        ;;

    3)
        FORMATNUM="$LINENUM"rd
        ;;

    [4-20])
        FORMATNUM="$LINENUM"th
        ;;

    *)
        FORMATNUM="$LINENUM"
        ;;
esac


echo "Here is the $FORMATNUM line of your $1 file:"
echo ===============================
echo 

cat $1 | sed -n "$LINENUM p"
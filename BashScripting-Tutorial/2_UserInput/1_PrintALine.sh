#!/bin/bash

# >>>> Number Of Line
echo "Hey, what line do you want to print?"
echo ======================================
echo
read -p "Line Number: " LINENUM
echo ==========================
echo

# >>>> Number to echo
case $LINENUM in
    ( 1 | [2-9]1 ) FORMATNUM="$LINENUM"st ;;
    ( 2 | [2-9]2 ) FORMATNUM="$LINENUM"nd ;;
    ( 3 | [2-9]3 ) FORMATNUM="$LINENUM"rd ;;
    ( [4-9] | 1[0-9] ) FORMATNUM="$LINENUM"th ;;
    ( * ) FORMATNUM="$LINENUM" ;;
esac


echo "Here is the $FORMATNUM line of your $1 file:"
echo ===============================
echo 

cat $1 | sed -n "$LINENUM p"
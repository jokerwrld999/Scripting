#!/bin/bash

day=$(date +%d)
DAY=$(echo $day)
let "nextDay = $DAY + 1"
echo "Tommorow's date is "date +$nextDay-%m-%y
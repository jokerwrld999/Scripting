#!/bin/bash

day=$(date +%d)
let "nextDay = $day + 1"
tomorrowsDate=$(date +$nextDay-%m-%y)
echo "Tommorow's date is $tomorrowsDate" 
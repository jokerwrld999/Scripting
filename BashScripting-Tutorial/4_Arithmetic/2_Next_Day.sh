#!/bin/bash

day=$(date +%d)
let "nextDay = $day + 1"
echo "Tommorow's date is "date +$nextDay-%m-%y
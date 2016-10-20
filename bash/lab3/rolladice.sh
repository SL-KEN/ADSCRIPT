#!/bin/bash

#Lab 3 Script 2


while [ 1 ]; do

read -p "How many dice should I roll[1-5] ?" count 

[ -n "$count" ] || continue 

[[ $count =~ ^[1-5]$ ]] && break

done 

for (( rolls=0 ; rolls < count ; rolls++ )); do

die1=$(($RANDOM %6 +1)) 
die2=$(($RANDOM %6 +1)) 
rolled=$(($die1 + $die2))

echo "Rolled $die1,$die2 for $rolled"

done

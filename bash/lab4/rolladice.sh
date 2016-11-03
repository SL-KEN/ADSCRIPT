#!/bin/bash

#Lab 4 Script 1
#Roll A DICE - allows user to roll virtual dice and get the sum of the rolls

count=0 
sides=0

while [ $# -gt 0 ]; do 
 	case "$1" in
  	-h )
cat <<EOF
 	Usage: $0 [-h] [-c numberofdice] [-s 4-20]
EOF
 	exit  0
 	;;

	-c )

	if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then 
	count =$2
 	shift  
       else 

cat <<EOF
   	You gave me '$2' as the number of dice to roll 
EOF
         >&2
  	exit 1
  	
      fi
      ;;

	   -s ) 
	if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then 
	if [ $2 -lt 4 -o $2 -gt 20]; then
 
 

	  echo "Number of sides must be between 4 and 20, .."   >&2
        exit 1 
 else 
	sides=$2
	shift
     fi 
     else 
     echo "You gave me '$2' as the number of sides per die, that isn't possible" >&2 
     exit 1
     fi 
     ;; 

	* ) 
 		echo "I don't understand '$1'" >&2 
		echo "Usage:  $0 [-h] [-c numberofdice] [-s 4-20]"
		exit 1 
		;; 
esac
shift 

done

until  [[ $count =~ ^[1-9][0-9]*$ ]]; do

read -p "How many dice should I roll[1-5] ?" count 

done 

until [[ $sides =~ ^[1-9][0-9]*$ ]]; do
  read -p "How many sides should each die have[4-20]? " sides
  if [ "$sides" -lt 4 -o "$sides" -gt 20 ]; then
    echo "$sides isn't allowed, the sides must be between 4 to 20" >&2
    sides=0
  fi
done

for (( rolls=0 ; rolls < count ; rolls++ )); do

die1=$(($RANDOM %6 +1)) 
die2=$(($RANDOM %6 +1)) 
rolled=$(($die1 + $die2))


echo "Rolled $die1,$die2 for $rolled"


done

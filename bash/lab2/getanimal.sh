#!/bin/bash
#lab 2 script 4


colours=("red","green","blue","yellow")

declare -A animals

animals=(["red"]="bird" ["green"]="frog" ["blue"]="lobster" ["yellow"]="house finch")

echo "The colors are: ${colours[0]}, ${colours[1]}, ${colours[2]}, ${colours[3]}. "
echo "The colours are ${colours[0]} "


echo "The animals are ${animals[red]}, ${aniamls[green]}, ${animals[blue]}, ${animals[yellow]}  "
echo "The animals are ${animals[0]} coloured ${animals[0]} "

num=0
read -p "Give me a number from 0 to 3: " num 
colour=${colours[$num]}
animal=${animals[$colour]}
echo "Index $num produces a $color $animal. " 

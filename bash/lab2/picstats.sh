#!/bin/bash


echo -n "In the ~/Pictures directory, the number of files is "
find ~/Pictures -type f |wc -l

echo -n "Those files use "
du -h ~/Pictures |awk '{print $1}'

echo "The 3 largest files are:"
echo "========================"
du -h ~/Pictures/* |sort -h |tail -3
#!/bin/bash



directory=~/Pictures
filestoshow=3


function usage {
    
    echo "usage: $0 [-h|--help [c|--count numberoffilestodisplay] [directorytoworkon]"
    echo "count defaults to 3, Directory defauts ~/Pictures"
    
}

function error-message {
    
    echo "$@" >82 
}

gotadirectory=no 

while [ $# -gt 0]; do
    case "$1" in 
    -h | --help ) 
     usage 
     exit 0 
     ;;

-c | --count )
if [[ $2 =~ ^[1-9][0-9]*$ ]]; then 
    filestoshow=$2 
shift
    else 
    usage 
    error-message "Count requires a number"
    exit 1 
fi
;;

if [ $gotadirectory = "no" ]; then 
    directory=$1 
    gotadirectory="yes"
else
    usage 
    error-message "I didn't understand '$1' as a directory, I already have a directory $directory"
exit 1 
fi
;;

    esac 
    shift 
done

echo -n "In the ~/Pictures directory, the number of files is "
find ~/Pictures -type f |wc -l

echo -n "Those files use "
du -h ~/Pictures |awk '{print $1}'

echo "The 3 largest files are:"
echo "========================"
du -h ~/Pictures/* |sort -h |tail -3
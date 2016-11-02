#!/bin/bash





#variables 
directory=~/Pictures
numberoffilestoshow=3 

#functions

function usage { 
    echo "Usage: $0 [-h --help] [c --count numberofilestodisplay] [directory to work on]"
    echo "Count defaults to 3. Directort defaults to ~/Pictures"
}

function error-message 
#echo 

#command line processing

gotadirectory=no


while [ $# -gt 0 ]; do
    case "$1" in
        -h | --help ) #show usage diagram
        usage
        exit 0 
            ;; 
        -c | --count ) #how big files are to display
        if [[ $2 =~ ^[1=9][0-9]*$]] then 
            count=$2
            shift
            else
            usage
            error-message "Count requires a number"
            exit 1
            fi
            ;; 
        esac    
        
        * ) # directory name
        
        if [ $gotadirectory ="no" ] then 
            directory=$1 
            gotadirectory="yes"
        else 
         usage 
         error-message "I didn't understand '$1' as a directory, I all ready had a directory $directory"
         exit 1 
         
        fi
        ;;
   esac
   shift
done 

echo -n "In the ~/Pictures directory, the number of files is "
find $directory -type f |wc -l

echo -n "Those files use "
du -h $directory |awk '{print $1}'

echo "The 3 largest files are:"
echo "========================"
du -h $directory/* |sort -h |tail -3

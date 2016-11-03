#!/bin/bash
#lab 2 script 5


interfacenames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)

defaultroute=0

declare -A ips

declare -a int 

declare -a interface


help_function() {
    
    
    echo "shows IP stuff or something"
    
    
}


error-message () {
	
	echo "error message $filename: $1 " >&2
echo "use -h or --help option to get help"


}


while [ $# -gt 0 ]; do
    case "$1" in
    -h| --help )
        help_function
        exit 0
        ;;
        
    -r|--route )
        defaultroute=1 
        shift
        
        ;;
        
*)


  if [ $? -eq 0 ]; then
        
                int+=("$1") 
        else 
                exit 1
        fi
                
    ;;
        
    esac
    shift 
done


ips[0]=`ifconfig ${interfacenames[0]} | grep 'inet addr' |
                                     sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
                                     
ips[1]=`ifconfig ${interfacenames[1]} | grep 'inet addr' |
                                     sed -e 's/  *inet addr://'| sed -e 's/ .*//'`

gatewayip=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`







cat <<EOF
Interface ${interfacenames[0]} has address ${ips[0]}
Interface ${interfacenames[1]} has address ${ips[1]}
My default gateway is $gatewayip
EOF
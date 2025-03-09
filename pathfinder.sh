#!/bin/bash

echo -e "Legal disclaimer: Usage of pathfinder on hosts without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program.\n"

HOST="$1"
IP_ADDR=$( dig +short "$HOST"  | paste -sd ", " - )
SERVER=$( curl -sI "$HOST" | grep "Server:"  | awk '{print $2}' )

if [[ -z "$SERVER" ]]; then
    SERVER=$( nmap -p 443 -sV "$HOST" | grep "443" | awk '{print $4}' )
else
    SERVER="Not Found"
fi

echo "Host name:   $HOST"
echo "IP Address:  $IP_ADDR"
echo "Server name: $SERVER"

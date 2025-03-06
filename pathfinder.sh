#!/bin/bash

HOST="$1"
IP_ADDR=$( dig +short "$HOST"  | paste -sd ", " - )
SERVER=$( curl -sI "$HOST" | grep "Server:"  | awk '{print $2}' )

echo "Host name:   $HOST"
echo "IP Address:  $IP_ADDR"
if [[ -n "$SERVER" ]]; then
    echo "Server name: $SERVER"
else
    echo "Server name: N/A"
fi

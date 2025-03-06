#!/bin/bash

HOST="$1"
IP_ADDR=$( dig +short "$HOST")
SERVER=$( curl -sI "$HOST" | grep "Server:"  | awk '{print $2}' )

echo "Host name:   $HOST"
echo "IP Address:  $IP_ADDR"
echo "Server name: $SERVER"

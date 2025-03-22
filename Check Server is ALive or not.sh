#!/bin/bash

echo "Server IP Checking if server is up or not"

SERVER_IP="8.8.8.8"

if ping -c 5 $SERVER_IP >> /dev/null; then

    echo "Server IP $SERVER_IP is reachable"
else
    echo "Sorry, Server IP $SERVER_IP is not reachable"
fi

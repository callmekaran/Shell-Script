#!/bin/bash

# Decode the Base64 encoded password
MYSQL_PASSWORD=$(echo "TXlTZWN1cmVQYXNzd29yZAo=" | base64 -d)

# Print the decoded password
echo "$MYSQL_PASSWORD"
                                         

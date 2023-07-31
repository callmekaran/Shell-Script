#!/bin/bash
echo "Quality-logs"
cd /home/ubuntu/application/wildfly-13.0.0.Final/standalone/log/
find  server.log.*  -mtime +3 -print -exec gzip {} \;
sleep 30
find . -type f -name '*.gz' -mtime +15 -exec rm {} \;

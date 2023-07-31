#!/bin/bash
rsync -arvz /home/ubuntu/application/wildfly-13.0.0.Final/standalone/log/server.log /tmp/log/
cd /tmp/log/
aws s3 sync . s3://discus-upload/Logs_files/Greeebox_qlt/ --acl public-read

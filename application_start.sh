#!/bin/bash
cd /home/ubuntu/jboss-as-7.1.1.Final/bin/
sudo sh standalone.sh &
sleep 2m
cd /home/ubuntu/jboss-as-7.1.1.Final/standalone/deployments
rm -f *.failed

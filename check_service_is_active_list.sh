#!/bin/bash
  
services=("ssh" "nginx")

for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "$service is active."
    else
        echo "$service is not active. Starting..."
        sudo systemctl start "$service"
    fi
done

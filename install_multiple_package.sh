#!/bin/bash
  
installpackages() {
        local packagename=${1}
        apt install -y ${packagename} > /dev/null
        if [ $? -eq 0 ]
        then
                echo "${packagename} is successfully installed."
        else
                echo "${packagename} is successfully not installed"
        fi
}

installpackages openjdk-11-jre 
installpackages maven

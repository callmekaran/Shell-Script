#!/bin/bash

<<comment

Hi Karan is writing This
script for
case statement

comment

echo "press a in order to Install the Package git"
echo "press b in order to Install the Package nginx" 
echo "press c in order to Install the Package apache2"

read -p "Select Package Name Inorder to Install it :  " package

case $package in
        a|A ) apt install git ;;
        b|B ) apt install nginx ;;
        c|C ) apt install apache2 ;;
        *) echo "Sorry, Please Type Valid Answer";;
esac

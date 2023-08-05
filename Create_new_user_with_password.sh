#!/bin/bash

#script should be only run with root user

if [ "$UID" -ne 0 ]; 
then
    echo "You are a regular user. Please Login With Root User."
    exit 1
fi

#user should pass atleast one argurment

if [ "$#" -lt 1 ];
then
        echo "Usage Of Script is Pass Argument As First Name. For Example, bash $0 Vijendra"
        exit 1
fi

#Storing Argument as a variable

Username=$1

#Storing Password as a variable

Password=$(date +%s)

#Now Create User & Set Password

useradd -m $Username -s /bin/bash

echo "$Username:$Password" | chpasswd

echo "Your UserName is $Username"
echo "Your Password is $Password"

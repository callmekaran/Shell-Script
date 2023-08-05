#!/bin/bash

<<comment

Hi Karan is writing This
script for elif 

comment

read -p "Enter Your Marks, Inorder to Know Your Grade: " marks

if [ $marks -ge 0 ] && [ $marks -le 30 ];
then
echo "Your Grade is E"

elif [ $marks -ge 30 ] && [ $marks -le 40 ];
then
echo "Your Grade is D"

elif [ $marks -ge 40 ] && [ $marks -le 60 ];
then
echo "Your Grade is C"

elif [ $marks -ge 60 ] && [ $marks -le 80 ];
then
echo "Your Grade is B"

elif [ $marks -ge 80 ] && [ $marks -le 100 ];
then
echo "Your Grade is A"

elif [ $marks -gt 100 ]
then
echo "Sorry Your Marks Are Invalid"

fi

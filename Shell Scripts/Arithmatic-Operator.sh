#!/bin/bash



################################
#Author: Ravikant Jadhav
#
#Date: 1/6/2025
#
#Purpose: Arithmatic Operators
#
#Version: 1.0
#
#################################

set -x #Debug mode
set -e #Exits the script when there is an error
set -o pipefail


echo -e "Please enter some value: \c"
read -r a

echo -e "Please enter another value: \c"
read -r b


echo "a+b value is $((a+b))"
echo "a-b value is $((a-b))"
echo "a*b value is $((a*b))"
echo "a/b value is $((a/b))"
echo "a%b value is $((a%b))"

echo "Complete Sucessfully"






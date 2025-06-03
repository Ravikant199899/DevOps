#!/bin/bash


#############################
#Author:Ravikant Jadhav
#
#Purpose: Even Odd Numbers
#
#Date: 1/6/2025
#
#Version: 1.1
#
#############################


set -x #Debug  mode
set -e #Exit script when error  occur
set -o pipefail


echo "Enter a number"
read num

if [ $((num % 2)) -eq 0 ];
then
	echo "Number is even."

else
	echo "Number is odd."

fi




#!/bin/bash



############################
#Author: Ravikant Jadhav
#
#Date: 1/6/2025
#
#Purpose: Logical Operators
#
#Version: 1.2
#############################

set -x #Debug mode
set -e #Exit from script when error occurs
set -o pipefail


echo -e "Enter your Math Subject marks: \c"
read -r m

echo -e "Enter your Physics Subject marks: \c"
read -r p

echo -e "Enter your Chemistery Subject marks: \c"
read -r c

echo -e "Enter your Biology Subject marks: \c"
read -r b

if test $m -ge 35 -a $p -ge 35 -a $c -ge 35 -a $b -ge 35
then
	echo "Congrulation you have passed in all subjects"

else
	echo "Sorry you not upto marks in one of the subject"

fi




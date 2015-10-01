#!/bin/bash

# parse.sh v.1
# Licence: GPL v.3

# This script parse output from:
#   $ strace -e open photoqt 2>&1 | grep -v "No such"  
#
# to get only links, then looking rpm packages which provides this links 
# and save rpm list to "list packages" file
# Made for PCLinuxOS

# How Use:
#	parse.sh file


#  check - if file exist then remove it
    rm  link1
    rm  list_packages







# info
echo $1


# parsing
cat $1 | cut -d "\"" -f2 | sort | uniq > link1


# info
echo "$1 parsed"




# In file links is $aa lines.
aa=$(cat link1 | wc -l)
echo $aa



# for i in `seq 1 $aa`
for i in `seq 1 $aa`
do
		# info
		echo "$i / $aa"

		# line from lista_elf
		ab=$(awk 'NR=='$i link1)

		rpm -qf $ab >> list_packages

 done


# uniq
ac=$(cat list_packages | sort | uniq)
echo "$ac" > list_packages
ad=$(cat list_packages | wc -l)

# info
echo $aa
echo $ad
echo "Ready."


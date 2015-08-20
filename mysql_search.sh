#!/bin/bash

a="ac_akb48_vote"

for i in $a
do
	column=`mysql -D system32 -e "desc $i;" | awk '{if($2 ~ /char/ || $2 ~ /text/ || $2 ~ /enum/){print $1}}'`
	#echo $column
	if [ "$column" != "" ]
	then
		for j in $column
		do
			num=`mysql -D system32 -e "select count(1) from $i where $j like '%static.acfun.mm111.net%'" | tail -1`
			#echo $num
			echo $num' '$i:$j
			sleep 1
		done
	fi
	sleep 2
done

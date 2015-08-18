#!/bin/bash

# $1 20150x0x $2 201x0x0x
# 第一个参数为起始日期，第二个参数为终止日期

day_11=$1
day_end=$2
num=`echo $day_end-$day_11+1 | bc`

for i in `seq $num`
do
    day_22=`echo $day_11+1 | bc`
    sec_11=`date -d "$day_11 00:00:00" +%s`
    sec_22=`date -d "$day_22 00:00:00" +%s`
    sql="db.lock_danmaku.find({'date':{'\$gte':$sec_11,'\$lte':$sec_22}}).count()"
    danma=`echo $sql | mongo danmaku --quiet`
    echo $day_11":"$danma
    day_11=`echo $day_11+1 | bc`
done


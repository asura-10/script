#!/bin/bash

HOST=10.0.0.1
PORT=6379

sum_ops() {
    redis-cli -h ${HOST} -p ${PORT} info stats | grep total_commands_processed | awk -F: '{print $NF}'
}


for i in `seq 1 20`
do
    now_1=`date +%H:%M:%S.%N`
    sum_ops_1=`sum_ops`
    sleep 1
    sum_ops_2=`sum_ops`
    now_2=`date +%H:%M:%S.%N`

    sum_ops_1=${sum_ops_1:0:${#sum_ops_1}-1}
    sum_ops_2=${sum_ops_2:0:${#sum_ops_2}-1}
    echo $now_1" - "$now_2" ops:"$[$sum_ops_2-$sum_ops_1]
done

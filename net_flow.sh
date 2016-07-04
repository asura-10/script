#!/bin/bash

net_card=$1

rx_bytes() {
    ifconfig $net_card | grep "RX bytes" | sed 's/RX bytes:\([0-9]*\) .*)/\1/'
}

tx_bytes() {
    ifconfig $net_card | grep "RX bytes" | sed 's/.*TX bytes:\([0-9]*\) .*)/\1/'
}


for i in `seq 1 20`
do
    now_1=`date +%H:%M:%S.%N`
    rx_bytes_1=`rx_bytes`
    tx_bytes_1=`tx_bytes`
    sleep 1
    rx_bytes_2=`rx_bytes`
    tx_bytes_2=`tx_bytes`
    now_2=`date +%H:%M:%S.%N`

    #sum_ops_1=${sum_ops_1:0:${#sum_ops_1}-1}
    #sum_ops_2=${sum_ops_2:0:${#sum_ops_2}-1}
    echo $now_1"~"$now_2" rx: "$[$rx_bytes_2-$rx_bytes_1]" bytes tx: "$[$tx_bytes_2-$tx_bytes_1]" bytes"
done

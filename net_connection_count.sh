#!/bin/bash

PORT_LIST=$@

PWD="$( cd "$( dirname "$0"  )" && pwd  )"
TMP_FILE=${PWD}/ss_all.tmp

connections_count() {
    PORT_LIST=$@

    while true
    do
        start_time=`date "+%Y-%m-%d~%H:%M:%S"`
        ss -tan | awk '{print $4}' > ${TMP_FILE}
        for PORT in $PORT_LIST
        do
            num=`cat ${TMP_FILE} | grep ":${PORT}" | wc -l`
            echo ${start_time}" "${PORT}" "${num} >> ${PWD}/${PORT}_connections_count.log
        done
        sleep 20
    done
}

connections_count $PORT_LIST &

#!/bin/bash

S2T=0

while getopts "s:" arg; do
    case $arg in
        s)
            S2T=1
            T_STRING=${OPTARG}
            ;;
        ?)
            echo "Usage: $0 [-s]"
            exit 1
            ;;
    esac
done


if [[ $S2T -eq 1 ]]; then
    date -d "${T_STRING}" "+%s"
else
    ts=$1
    date -d @${ts} "+%Y-%m-%d %H:%M:%S"
fi

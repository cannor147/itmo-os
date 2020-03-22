#!/usr/bin/env bash

out='./out/production/lab04'

echo $$ > $out/task6_connection

value=0
mode="work"

handle() {
    mode="stop"
}

trap 'handle' SIGTERM

tail -n 0 -f $out/task6_connection |
while true
do
    case $mode in
        "work")
            value=$(($value + 1))
            echo $value
            ;;
        "stop")
            echo "Stopped by SIGTERM signal"
            exit 0
            ;;
    esac
    sleep 1
done

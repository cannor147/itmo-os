#!/usr/bin/env bash

out='./out/production/lab04'

echo $$ > $out/task7_connection

value=1
mode="wait"

add() {
	mode="add"
}

multiply() {
	mode="multiply"
}

stop() {
	mode="stop"
}

trap 'add' USR1
trap 'multiply' USR2
trap 'stop' SIGTERM

echo $value

tail -n 0 -f $out/task7_connection |
while true
do
    case $mode in
        "add")
            value=$(($value + 2))
            echo $value
            mode="wait"
            ;;
        "multiply")
            value=$(($value * 2))
            echo $value
            mode="wait"
            ;;
        "stop")
            echo "Stopped by SIGTERM signal"
            exit 0
            ;;
    esac
    
    sleep 1
done
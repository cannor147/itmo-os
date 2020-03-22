#!/usr/bin/env bash

out='./out/production/lab04'

while true
do
    read line
    case $line in
        "+")
            kill -USR1 $(cat $out/task7_connection)
            ;;
        "*")
            kill -USR2 $(cat $out/task7_connection)
            ;;
        "TERM")
            kill -SIGTERM $(cat $out/task7_connection)
            exit 0
            ;;
        *)
            continue
            ;;
    esac
done
#!/usr/bin/env bash

out='./out/production/lab04'

touch $out/task5_connection

value=1
mode="+"

tail -n 0 -f $out/task5_connection |
while true
do
    read line
    case $line in
        "+")
            mode="+"
            echo "Changed mode to the +"
            ;;
        "*")
            mode="*"
            echo "Changed mode to the *"
            ;;
        "QUIT")
            echo "Stopped by QUIT message"
            exit 0
            ;;
        *)
            if [[ "$line" =~ [0-9]+ ]]
            then
                case $mode in
                    "+")
                        value=$(($value + $line))
                        echo $value
                        ;;
                    "*")
                        value=$(($value * $line))
                        echo $value
                        ;;
                esac
            else
                echo "Incorrect message"
                exit 1
            fi
            ;;
    esac
done
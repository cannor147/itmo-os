#!/usr/bin/env bash

read command
while [[ $command != "4" ]]
do
    case $command in
        "1" )
            echo "run nano"
        ;;
        "2" )
            echo "run vi"
        ;;
        "3" )
            echo "run links"
        ;;
    esac
    read command
done

exit 0
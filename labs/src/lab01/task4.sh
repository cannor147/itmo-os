#!/usr/bin/env bash

count=0
scan=1
while (( $scan % 2 != 0 ))
do
    read scan
    count=$(($count + 1))
done

echo $count

exit 0
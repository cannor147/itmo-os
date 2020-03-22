#!/usr/bin/env bash

out='./out/production/lab03'

result=""

for pid in $(ps -A -o pid)
do
    status_file="/proc/"$pid"/status"
    sched_file="/proc/"$pid"/sched"

    ppid=$(grep -E -h -s -i "ppid:\s(.+)" $status_file | grep -o "[0-9]\+")
    sum=$(grep -E -h -s -i "se.sum_exec_runtime(.+)" $sched_file | grep -o "[0-9.]\+")
    count=$(grep -E -h -s -i "nr_switches(.+)" $sched_file | grep -o "[0-9.]\+")

    if [[ -z $sum || -z $count ]]
    then
        sum=0
    else
        sum=$(echo "scale=8;$(echo $sum | cut -d' ' -f2)/$count" | bc)
    fi

    if [[ -n $ppid ]]
    then
        result=$result"ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Sleeping_Time="$sum$'\n'
    fi
done

echo "$result" | sort -n -t "=" -k3 | awk 'NF' > $out/processes.txt
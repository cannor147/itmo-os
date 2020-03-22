#!/usr/bin/env bash

out='./out/production/lab03'

ppid=0
sum=0
count=0
result=""

while read file
do
    if [[ -n $file ]]
    then
    ppid_next=$(echo $file | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")
        sum_next=$(echo $file | grep -E -h -s -i -o "Average_Sleeping_Time=[0-9.]+" | grep -o "[0-9.]\+")

        if [[ $ppid == $ppid_next ]]
        then
            sum=$(echo "scale=8;$sum+$sum_next" | bc -l)
            count=$(echo "scale=8;$count+1" | bc -l)
        else
            sum=$(echo "scale=8;$sum/$count" | bc -l)

            if [[ -n $result ]]
            then
                result=$result"Average_Sleeping_Children_of_ParentID="$ppid" is "$sum$'\n'
            fi

            sum=$sum_next
            ppid=$ppid_next
            count=1
        fi

        result=$result$file$'\n'
    fi
done < $out/processes.txt

sum=$(echo "scale=8;$sum/$count" | bc -l)

if [[ -n $result ]]
then
    result=$result"Average_Sleeping_Children_of_ParentID="$ppid" is "$sum$'\n'
fi

echo "$result" | awk 'NF' > $out/processes-updated.txt
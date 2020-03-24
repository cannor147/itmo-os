#!/usr/bin/env bash

scan=""
while [[ $scan != "q" ]]
do
    result="$result$scan"
    read scan
done

echo $result

exit 0
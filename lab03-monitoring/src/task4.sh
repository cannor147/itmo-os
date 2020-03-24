#!/usr/bin/env bash

out='./out/production/lab03'

echo "PID:DIFF" > $out/diff-processes.txt
ps -A -o pid | awk '{ file="/proc/"$1"/statm"; getline f<file; close (file); split(f, a); print $1"&"a[2]-a[3] }' | sort -r -n -t "&" -k2 >> $out/diff-processes.txt


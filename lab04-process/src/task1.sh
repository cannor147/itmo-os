#!/usr/bin/env bash

out='./out/production/lab04'
host='www.net_nikogo.ru'

date=$(date +"%F_%R")

mkdir $out/test && echo "catalog test was created successfully" > $out/report && touch $out/test/$date

ping -c 1 $host || echo "ERROR: host "$host" is unavailable" >> $out/report
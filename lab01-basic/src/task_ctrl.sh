#!/usr/bin/env bash

for ((i=1; $i <=12; i++))
do
    expr ${!i} \* 10
done
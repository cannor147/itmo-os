#!/usr/bin/env bash

src='./src/lab04'
cores=4
sleep_time=10

gnome-system-monitor &
$src/additional/loop.sh & pid1=$!
$src/additional/loop.sh & pid2=$!

cpulimit -p $pid1 -l $((20 * $cores)) --background

sleep $sleep_time

kill $pid1
kill $pid2
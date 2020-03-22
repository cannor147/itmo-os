#!/usr/bin/env bash

out='./out/production/lab04'
src='./src/lab04'

at -f $src/task1.sh now + 1 minutes

tail -n 0 -f $out/report
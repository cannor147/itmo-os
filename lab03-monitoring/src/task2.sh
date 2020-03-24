#!/usr/bin/env bash

ps kstart_time -ef | awk -v pid="$$" '$2 != pid && $3 != pid' | tail -1 | awk '{print "PID: " $2"    STIME: " $5}'
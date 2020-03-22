#!/usr/bin/env bash

if [[ $PWD != $HOME ]]
    then
        echo "$PWD is not home directory"
        exit 1
    else
        echo $HOME
        exit 0
fi
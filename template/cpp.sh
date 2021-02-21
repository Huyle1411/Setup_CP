#!/bin/bash
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;36m'
NOCOLOR='\e[0m'
for problem_name in "$@"; do
    start=`date +%s%N`
    if timeout 2 ./$problem_name < input > myoutput
    then
        end=`date +%s%N`
        var=$(diff myoutput output)
        if [ -z "$var" ]
        then
        echo -e "${GREEN} Accepted ${NOCOLOR}"
        else
        echo -e "${RED} Wrong answer ${NOCOLOR}"
        echo -e "$var"
        fi
        echo -e "${YELLOW} execution time: $(($((end-start))/1000000)) ms ${NOCOLOR}"
    else
        echo -e "${BLUE} Time Limit Exceeded ${NOCOLOR}"
    fi
done

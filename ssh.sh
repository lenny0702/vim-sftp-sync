#!/bin/bash

HOST=$1
PORT=$2
USER=$3
PASS=$4
CMD=$5

expect -c "
set timeout 5
spawn ssh -l${USER} -p${PORT} ${HOST}
expect \"*assword:\"
send ${PASS}\r
expect \":~>\"
send \"${CMD}\r\"
expect \":~>\"
send \"exit\r\"
interact
"
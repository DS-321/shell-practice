#!/bin/bash

DISK_USAGE=$(df -hT | grep -v "Filesystem")
DISK_THRESHOLD=2
MSG=""
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do

    USAGE=$(echo $line | awk '{print $(NF-1)}' | cut -d "%" -f1)
    PARTITION=$(echo line | awk '{print $1}')

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk Usage on $PARTITION: $USAGE% <br>"
    fi
done <<< $DISK_USAGE

source ./16.mail.sh "DevOps Team" "High Disk Usage" "$IP" "$MSG" "sharmiladaram5@gmail.com" "ALERT-High Disk Usage"
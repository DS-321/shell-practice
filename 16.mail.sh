#!/bin/bash

TO_TEAM=$1
ALERT_TYPE=$2
IP_ADDRESS=$3
MSG=$4
FINAL_MSG=$(printf '%s\n' "$MSG" | sed -e 's/[]\/$*.^[]/\\&/g')
TO_ADDRESS=$5
SUBJECT=$6

FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/IP_ADDRESS/$IP_ADDRESS/g" -e "s/MSG/$FINAL_MSG/g" template.html) 

{
echo "To: sharmiladaram5@gmail.com"
echo "Subject: ALERT-High Disk Usage"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "sharmiladaram5@gmail.com"
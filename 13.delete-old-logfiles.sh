#!/bin/bash

START_TIME=$(date +%s)
Userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "script started executing at: $(date)" | tee -a $log_file

if [ $Userid -ne 0 ]
    then
    echo -e "$R ERROR: You are not running with root access $N" | tee -a $log_file
    exit 1
    else
    echo "You are running with root access" | tee -a $log_file
fi

mkdir -p $logs_folder
logs_folder="/var/log/shell-practice.logs"
script_name=$(echo $0 | cut -d "." -f1-2)
log_file="$logs_folder/$script_name.log"
script_dir=$PWD
SRC_DIR=/home/ec2-user/app-logs

FILES_TO_DELETE=$(find $SRC_DIR -name "*.log" -mtime +14)

while IFS= read -r filepath

    do
        echo "deleting file: $filepath" | tee -a $log_file
        rm -rf $filepath

    done <<< $FILES_TO_DELETE

echo "Script executed successfully"

END_TIME=$(date +%s)
TOTAL_TIME=$(( $END_TIME - $START_TIME ))

echo -e "Script exection completed successfully, $Y time taken: $TOTAL_TIME seconds $N" | tee -a $log_file

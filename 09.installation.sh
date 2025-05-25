#!/bin/bash

Userid= $(id -u)
if [ $User -ne 0 ]
    then
    echo "ERROR: You are not running with root access"
    exit 1
    else
    echo "You are running with root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
    then
    echo "Sql is not installed... going to install now"

        dnf install mysql -y
        if [$? -eq 0]
            then
            echo "SQL is installed ... Successful"
            else
            echo "ERROR: SQL not installed"
        fi
    else
    echo "Sql is already installed... nothing to do"
fi
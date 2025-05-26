#!/bin/bash

Userid=$(id -u)
if [ $Userid -ne 0 ]
    then
    echo "ERROR: You are not running with root access"
    exit 1
    else
    echo "You are running with root access"
fi

validate(){

    if [ $1 -eq 0 ]
    then
            echo "$2 is installed ... Successful"
            else
            echo "$2 not installed ... Failure"
            exit 1
    fi        
}

dnf list installed mysql
if [ $? -ne 0 ]
    then
    echo "Sql is not installed... going to install now"

        dnf install mysql -y
        validate $? "mysql"

    else
    echo "Sql is already installed... nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
    then
    echo "nginx is not installed... going to install now"

        dnf install nginx -y
        validate $? "nginx"
    else
    echo "nginx is already installed... nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
    then
    echo "python3 is not installed... going to install now"

        dnf install python3 -y
        validate $? "python3"
    else
    echo "python3 is already installed... nothing to do"
fi
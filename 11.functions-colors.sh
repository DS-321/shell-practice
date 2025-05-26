#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Userid=$(id -u)
if [ $Userid -ne 0 ]
    then
    echo -e "$R ERROR: You are not running with root access $N"
    exit 1
    else
    echo "You are running with root access"
fi

validate(){

    if [ $1 -eq 0 ]
    then
            echo -e "$2 is installed ... $G Successful $N"
            else
            echo -e "$2 not installed ... $R Failure $N"
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
    echo -e "Sql is already installed... $Y Skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
    then
    echo "nginx is not installed... going to install now"

        dnf install nginx -y
        validate $? "nginx"
    else
    echo -e "nginx is already installed... $Y Skipping $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
    then
    echo "python3 is not installed... going to install now"

        dnf install python3 -y
        validate $? "python3"
    else
    echo -e "python3 is already installed... $Y Skipping $N"
fi
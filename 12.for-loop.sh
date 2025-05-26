#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/log/shellscript.logs"
script_name=$(echo $0 | cut -d "." -f1-2)
log_file="$logs_folder/$script_name.log"
package=("mysql" "python3" "nginx")

mkdir -p $logs_folder
echo "script started executing at: $(date)" &>>$log_file

Userid=$(id -u)
if [ $Userid -ne 0 ]
    then
    echo -e "$R ERROR: You are not running with root access $N" | tee -a $log_file
    exit 1
    else
    echo "You are running with root access" | tee -a $log_file
fi

validate(){

    if [ $1 -eq 0 ]
    then
            echo -e "$2 is installed ... $G Successful $N" | tee -a $log_file
            else
            echo -e "$2 not installed ... $R Failure $N" | tee -a $log_file
            exit 1
    fi        
}

    for package in ${package[@]}

    do
        dnf list installed $package &>>$log_file
            if [ $? -ne 0 ]
                then
                echo "$package is not installed... going to install now" | tee -a $log_file
                dnf install $package -y &>>$log_file
                validate $? "$package"
                else
                echo -e "$package is already installed... $Y Skipping $N" | tee -a $log_file
            fi

    done

# dnf list installed mysql &>>$log_file
# if [ $? -ne 0 ]
#     then
#     echo "Sql is not installed... going to install now" | tee -a $log_file

#         dnf install mysql -y &>>$log_file
#         validate $? "mysql"

#     else
#     echo -e "Sql is already installed... $Y Skipping $N" | tee -a $log_file
# fi

# dnf list installed nginx &>>$log_file
# if [ $? -ne 0 ]
#     then
#     echo "nginx is not installed... going to install now" | tee -a $log_file

#         dnf install nginx -y &>>$log_file
#         validate $? "nginx"
#     else
#     echo -e "nginx is already installed... $Y Skipping $N" | tee -a $log_file
# fi

# dnf list installed python3 &>>$log_file
# if [ $? -ne 0 ]
#     then
#     echo "python3 is not installed... going to install now" | tee -a $log_file

#         dnf install python3 -y &>>$log_file
#         validate $? "python3"
#     else
#     echo -e "python3 is already installed... $Y Skipping $N" | tee -a $log_file
# fi
#!/bin/bash

echo "all the arguments passed are: $@"
echo "number of arguments passed are: $#"
echo "current script name is: $0"
echo "present working directory: $PWD"
echo "User who is running th escript now is: $USER"
echo "user's home directory is: $HOME"
echo "PID of the script is: $$"
sleep 10 &
echo "PID of the last command ran in back ground is: $! "
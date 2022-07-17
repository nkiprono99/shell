#!/bin/bash
echo "Welcome to CentOS8 Linux"
        sleep 2
        echo "I will need you to create a new user"
sleep 3
if [ $(id -u) -eq 0 ]; then
        read -p "Enter username : " username
        sleep 1
        read -s -p "Enter password : " password
        sleep 2
        egrep "^$username" /etc/passwd >/dev/null
        if [ $? -eq 0 ]; then
                echo "$username exists!"
                exit 1
        else
                sudo useradd -m -p "$pass" "$username"
                [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
        fi
else
        echo "Only root may add a user to the system."
        exit 2
fi

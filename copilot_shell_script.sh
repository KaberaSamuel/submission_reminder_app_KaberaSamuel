#!/bin/bash

user_dir=$(ls -d -- */ 2>/dev/null)

# handling error when getting user directory
if [ $? -ne 0 ]; then
  printf "Error: failed get user directory \nConsider running create_environment.sh first\n"
  exit 1            
fi


# importing variables from config.env file
config_file="$user_dir/config/config.env"
source $config_file  2>/dev/null

# handling error when sourcing config.env file
if [ $? -ne 0 ]; then
  printf "Error: failed to read config.env file \nThis is probably because there are many user directories \nDelete unwanted users and run the script again\n"
  exit 1            
fi

# getting new assignment name from user
read -p "Enter new assignment name: " assignment

# updating assignment variable 
sed -i "s/$ASSIGNMENT/$assignment/" $config_file

cd $user_dir && bash startup.sh


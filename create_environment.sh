#!/bin/bash

read -p "Enter your name: " name
dir="submission_reminder_$name"
mkdir $dir && cd $dir

# creating starting files
mkdir app && touch app/reminder.sh
mkdir modules && touch modules/functions.sh
mkdir assets && touch assets/submissions.txt
mkdir config && touch config/config.env 
touch startup.sh



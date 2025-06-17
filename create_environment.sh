#!/bin/bash

# file content variables
startup_script='#!/bin/bash

bash app/reminder.sh'

reminder_script='#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file'

functions_script=$(cat <<'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF
)


env_content='# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2'

submissions_content='student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted'



read -p "Enter your name: " name
dir="submission_reminder_$name"
mkdir $dir && cd $dir

# creating starting files
mkdir app && touch app/reminder.sh && chmod +x app/reminder.sh
mkdir modules && touch modules/functions.sh && chmod +x modules/functions.sh
touch startup.sh && && chmod +x startup.sh
mkdir assets && touch assets/submissions.txt 
mkdir config && touch config/config.env `

# populating files
echo "$reminder_script" > app/reminder.sh
echo "$functions_script" > modules/functions.sh
echo "$startup_script" > startup.sh
echo "$submissions_content" > assets/submissions.txt
echo "$env_content" > config/config.env

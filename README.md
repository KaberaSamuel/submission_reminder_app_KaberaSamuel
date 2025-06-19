# **Submission Reminder App**

## **About**

A simple app that reminds students about the upcoming assignment deadlines.

## **Usage**

To use this app, follow these steps:

1. Clone the repository: **`git clone git@github.com:KaberaSamuel/submission_reminder_app_KaberaSamuel.git`**
2. Set up user directory: **`bash create_environment.sh`**
3. To change assignment being tracked: **`bash copilot_shell_script.sh`**
4. To check students who haven't submitted:
   1. Go to the user directory: **`cd submission_reminder_[username]`**
   2. Run the startup script: **`bash startup.sh`**

## **TroubleShooting (Must Read)**

If you follow the usage steps correctly, it should work fine. But if you meet some bugs, check these:

- Scripts must be run from the right location:
  - Run startup.sh inside the user directory.
  - Run create_environment.sh and copilot_shell_script.sh from the root of the app.
- Don't change the directory structure or create files manually.
- Remember run create_environment.sh before any other script.

## **Extra Tips**

- create_environment.sh sets up all needed folders and files.
  - File content is stored in variables at the top, then written after file creation.
  - You can edit:
    - submissions_content to add more students and assignments
    - env_content to change the assignment name or deadline

## **Handling Errors (copilot_shell_script.sh)**

- I used 2>/dev/null to hide system error messages.
- Then I check if the command failed using: **`if [ $? -ne 0 ];`**
- If there's an error, a custom message is shown and the script exits.

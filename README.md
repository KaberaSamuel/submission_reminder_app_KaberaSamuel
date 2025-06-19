# **Submission Reminder App**

## **About**

This is a basic application that alerts students about upcoming assignment deadlines

## **Usage**

To use this app, follow these steps:

1. Clone the repository: **`git clone git@github.com:KaberaSamuel/submission_reminder_app_KaberaSamuel.git`**
2. Create user environment files: **`bash create_environment.sh`**
3. To change assignment that is being tracked: **`bash copilot_shell_script.sh`**
4. To see students who haven't submitted assignment (the one being tracked): **`bash archive_logs.sh`**
   1. Switch to created user directory: **`cd submission_reminder_[username].sh`**
   2. Run the startup script: **`bash startup.sh`**

## **TroubleShooting (Must Read)**

If you clearly follow steps in Usage section, there shouldn't be any bugs; but in case it happens, here are the tips to help you

- This app works with relative paths, so make sure you run scripts from the directories, they're located in. Forexample:
  - Running startup.sh from the app root directory, will throw an error. You have to first switch to the directory where it's located, that is: **`cd submission_reminder_[username]`** and then **`bash startup.sh`**
  - Running copilot_shell_script.sh or create_environment.sh from created user directory, will also cause errors, they should be run from the root directory of the app
- Make sure files and directories are created by the create_environment.sh script. if you try to create files by yourself, or change the directory structure, you'll likely get errors
- Remember to create user files, before running any other script. Forexample: running copilot_shell_script.sh will before running create_environment.sh, will throw an error

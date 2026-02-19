# Deploy Agent — Student Attendance Tracker Project Factory

This repository contains a **shell script** `setup_project.sh` that automates the creation of a Student Attendance Tracker project. The script demonstartes principles by setting up the entire project folder, configuring settings, and handling interruptions automatically.


# Features

- **Automated project creation**: Creates all required folders and files automatically:
  - `attendance_checker.py` — main Python script
  - `Helpers/` — contains `assets.csv` and `config.json`
  - `reports/` — contains `reports.log`
  - `image.png` placeholder file
- **Dynamic configuration**: Prompts the user to update attendance thresholds (Warning and Failure) and validates numeric input.
- **Environment validation**: Checks if Python3 is installed before finishing setup.
- **Process management with Ctrl+C**: On interruption, creates an archive of the current project and deletes incomplete folders.


# Directory Structure

After running the script, the project folder structure looks like this:
attendance_tracker_{input}/
├── attendance_checker.py
├── Helpers/
│ ├── assets.csv
│ └── config.json
├── reports/
│ └── reports.log
└── image.png

# How to Run 

git clone https://github.com/bketia/deploy_agent_bketia.git
cd deploy_agent_bketia
chmod +x setup_project.sh
./setup_project.sh

# Testing the Archive Feature
1. Run the script (./setup_project.sh)
2. Press Crtl + C during execution 
3. The script will archive the current state and clean the workspace automatically.


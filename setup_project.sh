#!/bin/bash
echo "Enter project name suffix:"
read PROJECT_DIR
PROJECT_DIR="attendance_tracker_$PROJECT_DIR"
mkdir -p "$PROJECT_DIR/Helpers"
mkdir -p "$PROJECT_DIR/reports"
touch "$PROJECT_DIR/attendance_checker.py"
touch "$PROJECT_DIR/Helpers/assets.csv"
touch "$PROJECT_DIR/Helpers/config.json"
touch "$PROJECT_DIR/reports/reports.log"
touch "$PROJECT_DIR/image.png"
cat <<EOF > "$PROJECT_DIR/Helpers/config.json"
{
  "warning_threshold": 75,
  "failure_threshold": 50
}
EOF
echo "Enter new warning threshold (default 75):"
read warn
echo "Enter new failure threshold (default 50):"
read fail
warn=${warn:-75}
fail=${fail:-50}
sed -i "s/\"warning_threshold\": 75/\"warning_threshold\": $warn/" "$PROJECT_DIR/Helpers/config.json"
sed -i "s/\"failure_threshold\": 50/\"failure_threshold\": $fail/" "$PROJECT_DIR/Helpers/config.json"
if python3 --version >/dev/null 2>&1
then
  echo "Python3 is installed"
else
  echo "Python3 is NOT installed"
fi
cleanup() {
  echo "Script interrupted! Creating archive..."
  tar -czf "${PROJECT_DIR}_archive.tar.gz" "$PROJECT_DIR"
  rm -rf "$PROJECT_DIR"
  echo "Archive created and incomplete folder removed."
  exit 1
}
trap cleanup SIGINT

echo "Project setup complete!"

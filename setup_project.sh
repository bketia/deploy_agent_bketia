#!/bin/bash
set -e
echo "Enter project name suffix:"
read PROJECT_DIR
PROJECT_DIR="attendance_tracker_$PROJECT_DIR"
cleanup() {
  echo ""
  echo "Script interrupted! Creating archive..."
  tar -czf "${PROJECT_DIR}_archive.tar.gz" "$PROJECT_DIR" 2>/dev/null || echo "No folder to archive yet."
  rm -rf "$PROJECT_DIR" 2>/dev/null
  echo "Archive created and incomplete folder removed."
  exit 1
}
trap cleanup SIGINT

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
while true; do
  echo "Enter new warning threshold:"
  read warn
  warn=${warn:-75}
  if [[ "$warn" =~ ^[0-9]+$ ]] && [ "$warn" -le 100 ] && [ "$warn" -ge 0 ]; then
    break
  else
    echo "Please enter a number between 0 and 100."
  fi
done

while true; do
  echo "Enter new failure threshold:"
  read fail
  fail=${fail:-50}
  if [[ "$fail" =~ ^[0-9]+$ ]] && [ "$fail" -le 100 ] && [ "$fail" -ge 0 ]; then
    break
  else
    echo "Please enter a number between 0 and 100."
  fi
done
sed -i "s/\"warning_threshold\": 75/\"warning_threshold\": $warn/" "$PROJECT_DIR/Helpers/config.json"
sed -i "s/\"failure_threshold\": 50/\"failure_threshold\": $fail/" "$PROJECT_DIR/Helpers/config.json"
if python3 --version >/dev/null 2>&1
then
  echo "Python3 is installed"
else
  echo "Python3 is NOT installed"
fi

echo "Project setup complete! You can now use the project!!"
chmod +x setup_project.sh
echo "Setup script is executable."

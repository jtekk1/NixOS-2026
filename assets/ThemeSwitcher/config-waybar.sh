#!/bin/bash

CONFIG_FILE="$HOME/.config/waybar/config" # Adjust this path if needed
CURRENT_HOST=$(cat /etc/hostname | tr -d '[:space:]')

# 1. Check if the module is already in the file

add_toggle_monitor() {
  if grep -q '"custom/monitor-toggle"' "$CONFIG_FILE"; then
    echo "Module is already present."
  else
    echo "Module not found. Adding it after custom/updates..."

    # 2. Find "custom/updates", and replace it with itself + a newline + the new module
    # Using | as the sed delimiter so we don't have to escape the slashes in "custom/updates"
    sed -i 's|"custom/updates",|"custom/updates",\n      "custom/monitor-toggle",|' "$CONFIG_FILE"

    # 3. Reload the bar (assuming Waybar, adjust if you are using something else for dwl)
    pkill -USR2 waybar

    echo "Done!"
  fi
}

if [ "$CURRENT_HOST" = "deepspace" ]; then
  echo "Hostname Matched DEEPSPACE... checking if toggle-monitor is present"
  add_toggle_monitor
else
  echo "Hostname is $CURRENT_HOST, not deepspace. Doing nothing."
fi

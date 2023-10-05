#!/bin/bash

# Path to Windows Terminal settings.json (adjust if your path is different)
SETTINGS_PATH="/mnt/c/Users/UserName/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

# Check current useAcrylic value in defaults
USE_ACRYLIC=$(jq '.profiles.defaults.useAcrylic' < "$SETTINGS_PATH")

# Toggle the value
if [[ "$USE_ACRYLIC" == "true" ]]; then
    NEW_VALUE="false"
else
    NEW_VALUE="true"
fi

# Use jq to update the value in settings.json
jq ".profiles.defaults.useAcrylic = $NEW_VALUE" < "$SETTINGS_PATH" > "$SETTINGS_PATH.tmp"
mv "$SETTINGS_PATH.tmp" "$SETTINGS_PATH"


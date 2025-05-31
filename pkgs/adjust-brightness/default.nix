{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "adjust-brightness" ''
#!/bin/sh

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <display_number> <brightness_value_or_adjustment>"
    exit 1
fi

DISPLAY=$1
VALUE_OR_ADJUSTMENT=$2

# Get the current brightness value
CURRENT=$(ddcutil getvcp 10 --display=$DISPLAY | grep -oP 'current value =\s*\K\d+')

# Check if the adjustment is relative (+ or -)
if [[ "$VALUE_OR_ADJUSTMENT" =~ ^[+-] ]]; then
    # Calculate the new brightness value
    NEW_BRIGHTNESS=$((CURRENT + VALUE_OR_ADJUSTMENT))
else
    # Set the brightness to the specified value
    NEW_BRIGHTNESS=$VALUE_OR_ADJUSTMENT
fi

# Ensure the new brightness is within the valid range (0-100)
if [ "$NEW_BRIGHTNESS" -lt 0 ]; then
    NEW_BRIGHTNESS=0
elif [ "$NEW_BRIGHTNESS" -gt 100 ]; then
    NEW_BRIGHTNESS=100
fi

# Set the new brightness value
ddcutil setvcp 10 $NEW_BRIGHTNESS --display=$DISPLAY

echo "Brightness for display $DISPLAY changed to $NEW_BRIGHTNESS"
    '')
  ];
}

#!/bin/sh
#
# Take screenshots on wayland

OUTPUT_PREFIX="$(xdg-user-dir PICTURES)/screenshots/"

# Create output folder if it doesn't exist
mkdir -p $OUTPUT_PREFIX

# Define a function to save screenshot to file
save_screenshot() {
  # Get current date and time
  timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

  # Make unique filename for each screenshot
  input=$(printf "\n" | wmenu -S "#222222" -p "Enter a filename:")
  [ -n "$input" ] && filename="${OUTPUT_PREFIX}${input}.png"
  [ ! -n "$input" ] && filename="${OUTPUT_PREFIX}${timestamp}.png"

  # Save screenshot to file
  grim -g "$(slurp)" - | wl-copy --type image/png
  [ ! -n "$filename" ] && exit 1
  wl-paste > $filename
}

# Call the function with output folder and filename template
save_screenshot

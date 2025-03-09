#!/bin/sh
#
# Take screenshots on wayland

OUTPUT_PREFIX="$(xdg-user-dir PICTURES)/screenshots/"

# Create output folder if it doesn't exist
mkdir -p $OUTPUT_PREFIX

# Define a function to save screenshot to file
shoot() {
  # Get current date and time
  timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

  # Create unique filename for each screenshot
  input=$(printf "\n" | wmenu -S "#222222" -p "Enter a filename:")
  test -n "$input" && filename="${OUTPUT_PREFIX}${input}.png"
  test ! -n "$input" && filename="${OUTPUT_PREFIX}${timestamp}.png"

  # Save screenshot to file
  grim -g "$(slurp)" - | wl-copy --type image/png
  test ! -n "$filename" && exit 1
  wl-paste > $filename
}

# Call the function with output folder and filename template
shoot

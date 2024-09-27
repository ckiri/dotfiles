#!/bin/sh
#
# Start VS Code with required flags under wayland

/opt/VSCode-linux-x64/code \
  --enable-features=UseOzonePlatform \
  --ozone-platform=wayland

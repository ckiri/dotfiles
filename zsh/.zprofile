if [[ -n "$SSH_CLIENT" ]]; then
  echo "Login via ssh"
else
  startx
fi

# Created by `pipx` on 2023-10-24 06:34:44
export PATH="$PATH:/home/chris/.local/bin"

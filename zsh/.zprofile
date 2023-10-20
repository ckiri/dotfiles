if [[ -n "$SSH_CLIENT" ]]; then
  echo "Login via ssh"
else
  startx
fi

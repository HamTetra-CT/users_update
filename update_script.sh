#!/bin/bash

# Download the latest version of the file from GitHub
wget -q https://raw.githubusercontent.com/HamTetra-CT/users_update/main/tetra_users.json -O /tmp/tetra_users.json

# Compare the contents of the two files
if ! cmp -s /tmp/tetra_users.json /etc/svxlink/tetra_users.json; then
   # Replace the local file with the updated version
   sudo cp /tmp/tetra_users.json /etc/svxlink/tetra_users.json

   # Delete the temporary file
   rm /tmp/tetra_users.json
fi

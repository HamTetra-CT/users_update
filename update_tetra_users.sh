#!/bin/bash
# Script by HamTetra-CT Dev Team
echo "A inicializar..."
sudo systemctl stop svxlink
sleep 1

# Download the latest version of the file from GitHub
echo "A iniciar transferência do novo ficheiro tetra_users..."
wget -q https://raw.githubusercontent.com/HamTetra-CT/users_update/main/tetra_users.json -O /tmp/tetra_users.json

# Compare the contents of the two files
echo "A comparar versões..."
if ! cmp -s /tmp/tetra_users.json /etc/svxlink/tetra_users.json; then
   # Replace the local file with the updated version
   echo "Nova versão instalada!"
   sudo cp /tmp/tetra_users.json /etc/svxlink/tetra_users.json

   # Delete the temporary file
   rm /tmp/tetra_users.json
fi
echo "Atualização terminada!"
sudo systemctl start svxlink
sleep 1

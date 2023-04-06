#!/bin/bash
# Script and files by HamTetra-CT Dev Team
# Intended to be used with "SVXLink tetra-contrib" by DL1HRC
# Auto-fecht and updates local tetra_users.json file from github

echo "A inicializar..."
sudo systemctl stop svxlink
sleep 1

# Download the latest version of the file from GitHub
echo "A iniciar transferência do novo ficheiro tetra_users..."
wget -q https://raw.githubusercontent.com/HamTetra-CT/users_update/main/tetra_users.json -O /tmp/tetra_users.json
sleep 1

# Compare the contents of the two files
echo "A comparar versões..."
sleep 1
if ! cmp -s /tmp/tetra_users.json /etc/svxlink/tetra_users.json; then
echo "Nova versão encontrada!"
   # Replace the local file with the updated version
   echo "A nova versão foi instalada com sucesso!"
   sudo cp /tmp/tetra_users.json /etc/svxlink/tetra_users.json
   sleep 1

   # Delete the temporary file
   echo "Limpeza dos ficheiros da atualização..."
   sudo rm /tmp/tetra_users.json
   sleep 1
fi
echo "Atualização terminada com sucesso!"
sudo systemctl start svxlink
sleep 1

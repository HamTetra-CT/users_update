#!/bin/bash
# Script and files by HamTetra-CT Dev Team
# Intended to be used with "SVXLink tetra-contrib" by DL1HRC
# Auto-fetch and updates local tetra_users.json file from github

# Enforce strict error handling
set -euo pipefail

echo "A inicializar..."
echo "Script provided by HamTetra-CT Dev Team & made by Francisco Carmo F4VSE / CT7AJM"
sleep 1

# Variables
URL="https://raw.githubusercontent.com/HamTetra-CT/users_update/main/tetra_users.json"
TARGET_FILE="/etc/svxlink/tetra_users.json"
# Create a secure temporary file
TMP_FILE=$(mktemp)

# Ensure the temporary file is deleted when the script exits (whether it succeeds or fails)
trap 'rm -f "$TMP_FILE"' EXIT

echo "A iniciar transferência do novo ficheiro tetra_users..."
# Download file and fail explicitly if there is an HTTP/network error
if ! wget -q -O "$TMP_FILE" "$URL"; then
    echo "Erro: Falha ao transferir o ficheiro do GitHub." >&2
    exit 1
fi

# Optional but highly recommended: Validate JSON syntax before applying
if command -v jq >/dev/null 2>&1; then
    if ! jq . "$TMP_FILE" >/dev/null 2>&1; then
        echo "Erro: O ficheiro descarregado está corrompido ou não é um JSON válido." >&2
        exit 1
    fi
fi

echo "A comparar versões..."
if ! cmp -s "$TMP_FILE" "$TARGET_FILE"; then
    echo "Nova versão encontrada!"
    
    # Stop the service ONLY when an update is actually confirmed
    echo "A parar o SVXLink..."
    sudo systemctl stop svxlink
    
    echo "A instalar o novo ficheiro..."
    sudo cp "$TMP_FILE" "$TARGET_FILE"
    
    echo "A iniciar o SVXLink..."
    sudo systemctl start svxlink
    
    echo "A nova versão foi instalada com sucesso!"
else
    echo "Nenhuma atualização necessária. O ficheiro já se encontra na versão mais recente."
fi

echo "Atualização terminada com sucesso!"

# 🇵🇹 Portuguese TETRA Users Update

### ⚙️ Automatização da actualização do ficheiro utilizadores TETRA Portugal (HamTetra-CT).

---

## ➜ Instruções

#### 1 - Obter o script de actualização:
```
cd
```
```
cd /home/pi
```
```
wget https://raw.githubusercontent.com/HamTetra-CT/users_update/main/update_tetra_users.sh
```
#### 2 - Tornar o script executável:
```
sudo chmod +x /home/pi/update_tetra_users.sh
```
#### 3 - Teste, agora, o script com o seguinte comando:
```
./update_tetra_users.sh
```

> [!IMPORTANT]
> ⚠️ Deverá obter um retorno a indicar que a actualização foi concluída com sucesso.

#### 4 - *(Opcional)* Criar um agendamento (todas as 48h) para a actualização:

+ Abrir o arquivo crontab para o utilizador atual:
```
sudo crontab -e
```
+ Adicione uma nova linha ao arquivo *crontab* com o seguinte comando: (actualização)
```
57 3 */2 * * /bin/bash /home/pi/update_tetra_users.sh
```
+ *(Opcional)* Adicione uma nova linha ao arquivo *crontab* com o seguinte comando: (reboot)
```
0 4 */2 * * /sbin/shutdown -r now
```

> [!WARNING]
> ⚠️ Atenção! Para que a actualização/novo ficheiro passe a ter efeito, o serviço (programa) SVXLink tem de ser reiniciado.

### ✅ Terminado! O script vai ser lançado todos os 2 dias e fazer a actualização do ficheiro *"tetra_users.json"* caso seja necessário ou haja uma actualização disponível. 

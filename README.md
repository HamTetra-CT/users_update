# Portuguese TETRA Users Update

Automatização da actualização dos utilizadores do reflector TETRA Portugal (HamTetra-CT).

**Instruções -**

1 - Obter o script de actualização:
```
cd /home/pi
wget https://raw.githubusercontent.com/HamTetra-CT/users_update/blob/main/update_tetra_users.sh
```
2 - Tornar o script executável:
```
sudo chmod +x /home/pi/update_tetra_users.sh
```
3 - Criar um agendamento (semanal) para a actualização:
Abrir o arquivo crontab para o usuário atual:
```
sudo crontab -e
```
Adicione uma nova linha ao arquivo crontab com o seguinte comando:
```
0 0 */7 * * /bin/bash /home/pi/update_tetra_users.sh
```

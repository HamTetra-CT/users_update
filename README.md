# Portuguese TETRA Users Update

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
>⚠️ Deverá obter um retorno a indicar que a actualização foi concluída com sucesso.

#### 4 - *(opcional)* Criar um agendamento (semanal) para a actualização:

+ Abrir o arquivo crontab para o utilizador atual:
```
sudo crontab -e
```
+ Adicione uma nova linha ao arquivo crontab com o seguinte comando:
```
30 1 */2 * * /bin/bash /home/pi/update_tetra_users.sh
```

### ✅ Terminado! O script vai ser lançado todos os 2 dias e fazer a actualização do ficheiro *"tetra_users.json"* caso seja necessário ou haja uma actualização disponível. 
⚠️ Atenção! Para que a actualização/novo ficheiro passe a ter efeito, o serviço (programa) SVXLink tem de ser reiniciado. Por defeito isto acontece automaticamente por volta das 3 horas da manhã.  

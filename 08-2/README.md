## Установка clickhouse и vector

Данный playbook:
 - Загружает дистрибутивы указанные в одноимённых group_vars/{компонента}/vars.yml
 - Устанавливает clickhouse
 - Запускает clickhouse-server
 - Создаёт базу 'logs' через clickhouse-client
 - Устанавливает vector
 - Запускает vector

Для работы playbook необходимо:
 - Предоставить доступы для работы ansible на хостах через ssh

<details>
     <summary>Создание и настройка пользователей ansible</summary>
    <br>


```bash

 - Подключаемся к хосту и создаём необходимого пользователся с соответствующими правами

iva@c9:~/Documents/08-ansible/08-2  (08.2 *)$ ssh iva@192.168.1.41
[iva@c8a1 ~]$ sudo useradd ansible
[iva@c8a1 ~]$ sudo passwd ansible
Changing password for user ansible.
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.
[iva@c8a1 ~]$ sudo usermod -aG wheel ansible


 - Разрешаем повышение роли без ввода пароля предварительно переподключившись под вновь созданным пользователем

iva@c9:~/Documents/08-ansible/08-2  (08.2 *)$ ssh ansible@192.168.1.41
ansible@192.168.1.41's password: 
client_global_hostkeys_private_confirm: server gave bad signature for RSA key 0: error in libcrypto
Last login: Mon May  9 01:52:12 2022 from 192.168.1.17

[ansible@c8a1 ~]$ echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER
[sudo] password for ansible: 
ansible@c8a1 ~]$ sudo ls -la /etc/sudoers.d/
total 20
drwxr-x---.  2 root root   32 May  9 01:56 .
drwxr-xr-x. 88 root root 8192 May  9 01:48 ..
-rw-r--r--.  1 root root   31 May  9 01:56 ansible
-rw-r--r--.  1 root root   28 May  4 01:11 iva

 - Копируем ключи на хосты для подключения без ввода паролей, сгенерировать ключи можно командой: ssh-keygen -t rsa -b 4096 -o -a 100 -C "mail@examlpe.com"


iva@c9:~/Documents/08-ansible/08-2  (08.2 *)$ ssh-copy-id ansible@192.168.1.41
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 2 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ansible@192.168.1.41's password: 
client_global_hostkeys_private_confirm: server gave bad signature for RSA key 0: error in libcrypto

Number of key(s) added: 2

Now try logging into the machine, with:   "ssh 'ansible@192.168.1.41'"
and check to make sure that only the key(s) you wanted were added.

```
</details>

 - Добавить ip-адрес сервера/ров в [inventory](./inventory/prod.yml) файл
 - Указать имя пользователя в [inventory](./inventory/prod.yml) файле
 - В файлах [vars](./group_vars/)' указать необходимые версии дистрибутивов. Их можно посмотреть на официальных сайтах [clichouse](https://packages.clickhouse.com/rpm/stable/) и [vector](https://packages.timber.io/vector/)
 - Запустить playbook:

```bash
$ ansible-playbook -i inventory/prod.yml site.yml
```
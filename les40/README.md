# Otus MYSQL Replicatin

## Репликация mysql

Базу развернуть на мастере и настроить так, чтобы реплицировались таблицы:
* bookmaker
* competition
* market
* odds
* outcome

На мастер и реплика сервер устанавливается mysql server 5.7. и копируются кофигурационные файлы

```
- name: Install mysql 5.7 repo
  yum:
    name: https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
    state: present

- name: Install mysql server
  yum: 
    name: mysql-community-server
    state: present
  notify: Restart mysql
```

Master
```
[mysqld]

bind-address = 192.168.50.20

binlog-checksum=crc32
gtid-mode=on
enforce-gtid-consistency=true
log-slave-updates=true
server-id = 1
replicate-do-db=bet
replicate-do-table=bet.bookmaker
replicate-do-table=bet.competition
replicate-do-table=bet.market
replicate-do-table=bet.odds
replicate-do-table=bet.outcome

log_bin = /var/log/mysql/bin.log
```

Replica
```
[mysqld]

bind-address = 192.168.50.21

binlog-checksum=crc32
gtid-mode=on
enforce-gtid-consistency=true
log-slave-updates=true
server-id = 2
replicate-do-db=bet
replicate-do-table=bet.bookmaker
replicate-do-table=bet.competition
replicate-do-table=bet.market
replicate-do-table=bet.odds
replicate-do-table=bet.outcome

log_bin = /var/log/mysql/bin.log
```

## Master

На *master* сервере создаем пользователя *replicator*, база данных *bet*. В бд распаковывается дамп из ДЗ.

```
- name: Create database user
  command: mysql -u root -p'{{ mysql_root_password }}' -e "CREATE USER '{{ mysql_user }}'@'%' IDENTIFIED BY '{{ mysql_user_password }}';"

- name: Grant replication slave 
  command: mysql -u root -p'{{ mysql_root_password }}' -e "GRANT REPLICATION SLAVE ON *.* TO '{{ mysql_user }}'@'%';"

- name: Create database
  command: mysql -u root -p'{{ mysql_root_password }}' -e "CREATE DATABASE bet;"

- name: Restore database dump
  command: mysql -u root -p'{{ mysql_root_password }}' bet -e "source /vagrant/bet.dmp"
```

## Replica

На *replica* сервере настраиваем и запускаем репликацию.
```
- name: Configure replication
  command: mysql -u root -p'{{ mysql_root_password }}' -e "change master to master_host='master', master_auto_position=1, Master_User='{{ mysql_user }}', master_password='{{ mysql_user_password }}';"

- name: Start replication
  command: mysql -u root -p'{{ mysql_root_password }}' -e "start slave;"
```


## Проверяем, что все работает как надо

<details>
<summary>Master</summary>

```
mysql> select * from bookmaker;
+----+----------------+
| id | bookmaker_name |
+----+----------------+
|  4 | betway         |
|  5 | bwin           |
|  6 | ladbrokes      |
|  3 | unibet         |
+----+----------------+
4 rows in set (0.00 sec)

mysql> INSERT INTO bookmaker (id,bookmaker_name) VALUES(1,'bets_are_bad');
Query OK, 1 row affected (0.00 sec)
```
</details>

<details>
<summary>Replica</summary>


```
[vagrant@replica ~]$ mysql -u root -p'Root-#qwe!123'
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 6
Server version: 5.7.36-log MySQL Community Server (GPL)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| bet                |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> use bet;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------+
| Tables_in_bet |
+---------------+
| bookmaker     |
| competition   |
| market        |
| odds          |
| outcome       |
+---------------+
5 rows in set (0.00 sec)
mysql> select * from bookmaker;
+----+----------------+
| id | bookmaker_name |
+----+----------------+
|  1 | bets_are_bad   |
|  4 | betway         |
|  5 | bwin           |
|  6 | ladbrokes      |
|  3 | unibet         |
+----+----------------+
5 rows in set (0.00 sec)
```
</details>

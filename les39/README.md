# **PostgreSQL.**

## **Homework**

- Настроить hot_standby репликацию с использованием слотов
- Настроить правильное резервное копирование

Для сдачи присылаем postgresql.conf, pg_hba.conf и recovery.conf

А так же конфиг barman, либо скрипт резервного копирования.


**В дз используется две виртуальные машины:**
- primary.otus.test 
- standby.otus.test 

В режиме primary используем серверы DNS, NTP, Kerberos, NFS и PostgresSQL, в режиме hot_standby используем PostgresSQL, настраиваем потоковую репликацию с использованием слотов. Резервное копирование выполнено с помощью pgbackrest на обоих серверах.

**Проверим работу репликации**

На Primary выполним следующие команды:

[root@admin les39]# vagrant ssh primary

DEPRECATION: The 'sudo' option for the Ansible provisioner is deprecated.

Please use the 'become' option instead.

The 'sudo' option will be removed in a future release of Vagrant.

Last login: Sat Jul 23 21:21:28 2022 from 10.0.2.2

[vagrant@primary ~]$ **sudo -iu postgres psql -c "select application_name, state, sync_priority, sync_state from pg_stat_replication;"**

| application_name |   state   | sync_priority | sync_state |
| ---------------- | --------- | ------------- | ---------- |
| standby          | streaming |             1 | sync       |

(1 row)

[vagrant@primary ~]$ **sudo -iu postgres psql -x -c "select * from pg_stat_replication;"**

| [ RECORD 1 ]    | +                             |
| --------------- | ----------------------------  |
|pid              | 13128                         |
|usesysid         | 16384                         |
|usename          | replication                   |
|application_name | standby                       |
|client_addr      | 192.168.50.101                |
|client_hostname  | standby.otus.test             |
|client_port      | 40650                         |
|backend_start    | 2022-07-23 18:20:44.556379+00 |
|backend_xmin     |                               |
|state            | streaming                     |
|sent_lsn         | 0/5000140                     |
|write_lsn        | 0/5000140                     |
|flush_lsn        | 0/5000140                     |
|replay_lsn       | 0/5000140                     |
|write_lag        |                               |
|flush_lag        |                               | 
|replay_lag       |                               |
|sync_priority    | 1                             |
|sync_state       | sync                          |


**Создадим test database:**

[vagrant@primary ~]$ sudo -iu postgres

-bash-4.2$ psql

psql (11.2)

Type "help" for help.

postgres=# create database test;

CREATE DATABASE

postgres=# \c test

You are now connected to database "test" as user "postgres".

test=#  CREATE TABLE fruits (id serial PRIMARY KEY, name VARCHAR (255) UNIQUE NOT NULL);

CREATE TABLE

test=# insert into fruits values (1,'apple'),(2,'melon'),(3,'lemon');

INSERT 0 3

Подключимся к бд standby:

[root@admin les39]# vagrant ssh standby

DEPRECATION: The 'sudo' option for the Ansible provisioner is deprecated.

Please use the 'become' option instead.

The 'sudo' option will be removed in a future release of Vagrant.

Last login: Sut Jul 28 21:23:10 2022 from 10.0.2.2

[vagrant@standby ~]$  sudo -iu postgres

-bash-4.2$ psql

psql (11.2)

Type "help" for help.

postgres=#  \c test

You are now connected to database "test" as user "postgres".

test=# select * from fruits;

| id | name  |
| -- | ----- |
| 1  | apple |
| 2  | melon |
| 3  | lemon |

(3 rows)


**Резервное копирование на primary выполненго через ansible, а на standby вручную, чтобы наглядно видеть что сделано.**

[vagrant@standby ~]$  sudo -iu postgres pgbackrest --stanza=backup --log-level-console=info --type=incr backup

WARN: unable to open log file '/var/log/pgbackrest/backup-backup.log': Permission denied

      NOTE: process will continue without log file.

2022-07-23 21:59:00.884 P00   INFO: backup command begin 2.13: --backup-standby --delta --log-level-console=info --log-level-file=off --pg1-host=primary.otus.test --pg1-path=/var/lib/pgsql/11/data --pg2-path=/var/lib/pgsql/11/data --process-max=2 --repo1-path=/opt/backup --repo1-retention-full=1 --stanza=backup --type=incr

The authenticity of host 'primary.otus.test (192.168.50.100)' can't be established.

ECDSA key fingerprint is SHA256:3xyya8z3EIYY+vLXVcbOJYXbMpq+g+KKCc0UPsGTlkY.

ECDSA key fingerprint is MD5:a5:79:d2:1a:f6:8f:e2:2a:d3:c4:5e:a8:d8:da:02:c0.

Are you sure you want to continue connecting (yes/no)? y

Please type 'yes' or 'no': yes

2022-07-23 21:59:18.050 P00   INFO: last backup label = 20190428-211635F, version = 2.13

2022-07-23 21:59:18.488 P00   INFO: execute non-exclusive pg_start_backup() with label "pgBackRest backup started at 2022-07-23 21:59:01": backup begins after the next regular checkpoint completes

2022-07-23 21:59:18.917 P00   INFO: backup start archive = 000000010000000000000006, lsn = 0/6000028

2022-07-23 21:59:19.151 P00   INFO: wait for replay on the standby to reach 0/6000028

2022-07-23 21:59:19.561 P00   INFO: replay on the standby reached 0/6000108, checkpoint 0/6000060

2022-07-23 21:59:23.702 P02   INFO: backup file /var/lib/pgsql/11/data/base/16385/1255 (608KB, 7%) checksum dbe98fec7da346ca02a9628e67482f3119d38101

2022-07-23 21:59:23.714 P03   INFO: backup file /var/lib/pgsql/11/data/base/16385/2608 (448KB, 10%) checksum 2ef967b3f2981e74d97474b9cb1e985eac7a4b23

2022-07-23 21:59:23.924 P03   INFO: backup file /var/lib/pgsql/11/data/base/16385/2838 (408KB, 19%) checksum c1e55013724720e518ba0b7b6481434c0bf872ab

2022-07-23 21:59:23.960 P02   INFO: backup file /var/lib/pgsql/11/data/base/16385/1249 (392KB, 24%) checksum 658764da1993be0d70bc9dd20b41c6bb2efa926d

...

2022-07-23 21:59:32.021 P02   INFO: backup file /var/lib/pgsql/11/data/base/16385/12862 (0B, 100%)

2022-07-23 21:59:32.123 P00   INFO: incr backup size = 30MB

2022-07-23 21:59:32.123 P00   INFO: execute non-exclusive pg_stop_backup() and wait for all WAL segments to archive

2022-07-23 21:59:32.239 P00   INFO: backup stop archive = 000000010000000000000006, lsn = 0/6000130

2022-07-23 21:59:33.111 P00   INFO: new backup label = 20190428-211635F_20190428-215901I

2022-07-23 21:59:33.251 P00   INFO: backup command end: completed successfully (32368ms)

2022-07-23 21:59:33.251 P00   INFO: expire command begin

2022-07-23 21:59:33.314 P00   INFO: expire command end: completed successfully (63ms)


# les17 - Настраиваем бэкапы

## Введение

BorgBackup это дедуплицирующая программа для резервного копирования. Опционально доступно сжатие и шифрование данных. Основная задача BorgBackup — предоставление эффективного и безопасного решения для резервного копирования. Благодаря дедупликации резервное копирование происходит очень быстро. Все данные можно зашифровать на стороне клиента, что делает Borg интересным для использования на арендованных хранилищах.

## Цели домашнего задани

Научиться использовать инструмент для резервного копирования

## Описание домашнего задания

- Настроить стенд Vagrant с двумя виртуальными машинами: backup_server и client.
- Настроить удаленный бэкап каталога /etc c сервера client при помощи borgbackup.

Резервные копии должны соответствовать следующим критериям:

- директория для резервных копий /var/backup. Это должна быть отдельная точка монтирования. В данном случае для демонстрации размер не принципиален, достаточно будет и 2GB;
- репозиторий для резервных копий должен быть зашифрован ключом или паролем - на ваше усмотрение;
- имя бэкапа должно содержать информацию о времени снятия бекапа;
- глубина бекапа должна быть год, хранить можно по последней копии на конец месяца, кроме последних трех. Последние три месяца должны содержать копии на каждый день. Т.е. должна
- быть правильно настроена политика удаления старых бэкапов;
- резервная копия снимается каждые 5 минут. Такой частый запуск в целях демонстрации;
- написан скрипт для снятия резервных копий. Скрипт запускается из соответствующей Cron джобы, либо systemd timer-а - на ваше усмотрение;
- настроено логирование процесса бекапа. Для упрощения можно весь вывод перенаправлять в logger с соответствующим тегом. Если настроите не в syslog, то обязательна ротация логов.

## Пошаговая инструкция выполнения домашнего задания

- развернем стенд с помощью Vagrant и Ansible, которые подготовят для нас окружение и запустят бекап

```bash
vagrant up --no-provision
ANSIBLE_ARGS='--skip-tags="client"' vagrant provision
ANSIBLE_ARGS='--tags="client"' vagrant provision client
```

> Ключ шифрования и частоту бекапа можно задать в ./host_vars/client

- оставим стенд поработать пол часа

- зайдем на виртуалку client и посмотрим лог

```bash
vagrant ssh client
sudo -i

cat /var/log/messages | grep borg
May 16 22:17:20 localhost borg: ------------------------------------------------------------------------------
May 16 22:17:20 localhost borg: Archive name: etc-2022-05-16_22:17:17
May 16 22:17:20 localhost borg: Archive fingerprint: f84b587d806995edb5770439249b753f14e2ac3f2f172db8982dd8fef64b92a1
May 16 22:17:20 localhost borg: Time (start): Mon, 2022-05-16 22:17:18
May 16 22:17:20 localhost borg: Time (end):   Mon, 2022-05-16 22:17:20
May 16 22:17:20 localhost borg: Duration: 1.79 seconds
May 16 22:17:20 localhost borg: Number of files: 1700
May 16 22:17:20 localhost borg: Utilization of max. archive size: 0%
May 16 22:17:20 localhost borg: ------------------------------------------------------------------------------
May 16 22:17:20 localhost borg: Original size      Compressed size    Deduplicated size
May 16 22:17:20 localhost borg: This archive:               28.43 MB             13.49 MB             11.84 MB
May 16 22:17:20 localhost borg: All archives:               28.43 MB             13.49 MB             11.84 MB
May 16 22:17:20 localhost borg: Unique chunks         Total chunks
May 16 22:17:20 localhost borg: Chunk index:                    1279                 1696
May 16 22:17:20 localhost borg: ------------------------------------------------------------------------------
May 16 22:22:47 localhost borg: ------------------------------------------------------------------------------
May 16 22:22:47 localhost borg: Archive name: etc-2022-05-16_22:22:46
May 16 22:22:47 localhost borg: Archive fingerprint: 3a81a3c4a1219c1486a841acfb732bfa3b77f72e0baf835fedd89f3bc4cd32d6
May 16 22:22:47 localhost borg: Time (start): Mon, 2022-05-16 22:22:47
May 16 22:22:47 localhost borg: Time (end):   Mon, 2022-05-16 22:22:47
May 16 22:22:47 localhost borg: Duration: 0.31 seconds
May 16 22:22:47 localhost borg: Number of files: 1700
May 16 22:22:47 localhost borg: Utilization of max. archive size: 0%
May 16 22:22:47 localhost borg: ------------------------------------------------------------------------------
May 16 22:22:47 localhost borg: Original size      Compressed size    Deduplicated size
May 16 22:22:47 localhost borg: This archive:               28.43 MB             13.49 MB            126.53 kB
May 16 22:22:47 localhost borg: All archives:               56.85 MB             26.99 MB             11.97 MB
May 16 22:22:47 localhost borg: Unique chunks         Total chunks
May 16 22:22:47 localhost borg: Chunk index:                    1287                 3396
May 16 22:22:47 localhost borg: ------------------------------------------------------------------------------
May 16 20:27:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:27:57 localhost borg: Archive name: etc-2022-05-16_22:27:56
May 16 20:27:57 localhost borg: Archive fingerprint: 90a10548747e16dd8080493a6fabb1af3a5a099570693d70bad0169d9b56cb1f
May 16 20:27:57 localhost borg: Time (start): Mon, 2022-05-16 22:27:56
May 16 20:27:57 localhost borg: Time (end):   Mon, 2022-05-16 22:27:57
May 16 20:27:57 localhost borg: Duration: 0.28 seconds
May 16 20:27:57 localhost borg: Number of files: 1700
May 16 20:27:57 localhost borg: Utilization of max. archive size: 0%
May 16 20:27:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:27:57 localhost borg: Original size      Compressed size    Deduplicated size
May 16 20:27:57 localhost borg: This archive:               28.43 MB             13.49 MB                717 B
May 16 20:27:57 localhost borg: All archives:               56.85 MB             26.99 MB             11.84 MB
May 16 20:27:57 localhost borg: Unique chunks         Total chunks
May 16 20:27:57 localhost borg: Chunk index:                    1284                 3400
May 16 20:27:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:33:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:33:57 localhost borg: Archive name: etc-2022-05-16_22:33:56
May 16 20:33:57 localhost borg: Archive fingerprint: 7d4f1f7c2f238973679ead3728d82d7a800a0e4c39673b9cb4d1a2a8ec2fa54a
May 16 20:33:57 localhost borg: Time (start): Mon, 2022-05-16 22:33:57
May 16 20:33:57 localhost borg: Time (end):   Mon, 2022-05-16 22:33:57
May 16 20:33:57 localhost borg: Duration: 0.31 seconds
May 16 20:33:57 localhost borg: Number of files: 1700
May 16 20:33:57 localhost borg: Utilization of max. archive size: 0%
May 16 20:33:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:33:57 localhost borg: Original size      Compressed size    Deduplicated size
May 16 20:33:57 localhost borg: This archive:               28.43 MB             13.49 MB                716 B
May 16 20:33:57 localhost borg: All archives:               56.85 MB             26.99 MB             11.84 MB
May 16 20:33:57 localhost borg: Unique chunks         Total chunks
May 16 20:33:57 localhost borg: Chunk index:                    1284                 3400
May 16 20:33:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:39:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:39:57 localhost borg: Archive name: etc-2022-05-16_22:39:56
May 16 20:39:57 localhost borg: Archive fingerprint: 8eb7a2aad4eb290d9fb979bd16cc3fc0b8f0d998b451e3e0289e98c64a3c2300
May 16 20:39:57 localhost borg: Time (start): Mon, 2022-05-16 22:39:57
May 16 20:39:57 localhost borg: Time (end):   Mon, 2022-05-16 22:39:57
May 16 20:39:57 localhost borg: Duration: 0.32 seconds
May 16 20:39:57 localhost borg: Number of files: 1701
May 16 20:39:57 localhost borg: Utilization of max. archive size: 0%
May 16 20:39:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:39:57 localhost borg: Original size      Compressed size    Deduplicated size
May 16 20:39:57 localhost borg: This archive:               28.43 MB             13.49 MB             22.02 kB
May 16 20:39:57 localhost borg: All archives:               56.86 MB             26.99 MB             11.87 MB
May 16 20:39:57 localhost borg: Unique chunks         Total chunks
May 16 20:39:57 localhost borg: Chunk index:                    1286                 3401
May 16 20:39:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:45:18 localhost borg: ------------------------------------------------------------------------------
May 16 20:45:18 localhost borg: Archive name: etc-2022-05-16_22:45:16
May 16 20:45:18 localhost borg: Archive fingerprint: 59a6feceb390507b8c4fccefbe15552e1111427d976a00a4982a6f396e6a427d
May 16 20:45:18 localhost borg: Time (start): Mon, 2022-05-16 22:45:17
May 16 20:45:18 localhost borg: Time (end):   Mon, 2022-05-16 22:45:18
May 16 20:45:18 localhost borg: Duration: 0.34 seconds
May 16 20:45:18 localhost borg: Number of files: 1700
May 16 20:45:18 localhost borg: Utilization of max. archive size: 0%
May 16 20:45:18 localhost borg: ------------------------------------------------------------------------------
May 16 20:45:18 localhost borg: Original size      Compressed size    Deduplicated size
May 16 20:45:18 localhost borg: This archive:               28.43 MB             13.49 MB             22.20 kB
May 16 20:45:18 localhost borg: All archives:               56.86 MB             26.99 MB             11.87 MB
May 16 20:45:18 localhost borg: Unique chunks         Total chunks
May 16 20:45:18 localhost borg: Chunk index:                    1287                 3401
May 16 20:45:18 localhost borg: ------------------------------------------------------------------------------
May 16 20:50:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:50:57 localhost borg: Archive name: etc-2022-05-16_22:50:56
May 16 20:50:57 localhost borg: Archive fingerprint: d9364ca931cf48ee58006f7c6bbbdffef84bba5758cd2f51cd723d7127d31d1b
May 16 20:50:57 localhost borg: Time (start): Mon, 2022-05-16 22:50:57
May 16 20:50:57 localhost borg: Time (end):   Mon, 2022-05-16 22:50:57
May 16 20:50:57 localhost borg: Duration: 0.29 seconds
May 16 20:50:57 localhost borg: Number of files: 1700
May 16 20:50:57 localhost borg: Utilization of max. archive size: 0%
May 16 20:50:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:50:57 localhost borg: Original size      Compressed size    Deduplicated size
May 16 20:50:57 localhost borg: This archive:               28.43 MB             13.49 MB                716 B
May 16 20:50:57 localhost borg: All archives:               85.29 MB             40.48 MB             11.87 MB
May 16 20:50:57 localhost borg: Unique chunks         Total chunks
May 16 20:50:57 localhost borg: Chunk index:                    1288                 5101
May 16 20:50:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:56:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:56:57 localhost borg: Archive name: etc-2022-05-16_22:56:56
May 16 20:56:57 localhost borg: Archive fingerprint: fe48a53546ae1cbd053c4d45b00d0cdbeaf8d6180fb1c699adf35fa90e164134
May 16 20:56:57 localhost borg: Time (start): Mon, 2022-05-16 22:56:57
May 16 20:56:57 localhost borg: Time (end):   Mon, 2022-05-16 22:56:57
May 16 20:56:57 localhost borg: Duration: 0.55 seconds
May 16 20:56:57 localhost borg: Number of files: 1700
May 16 20:56:57 localhost borg: Utilization of max. archive size: 0%
May 16 20:56:57 localhost borg: ------------------------------------------------------------------------------
May 16 20:56:57 localhost borg: Original size      Compressed size    Deduplicated size
May 16 20:56:57 localhost borg: This archive:               28.43 MB             13.49 MB             22.29 kB
May 16 20:56:57 localhost borg: All archives:               56.85 MB             26.99 MB             11.87 MB
May 16 20:56:57 localhost borg: Unique chunks         Total chunks
May 16 20:56:57 localhost borg: Chunk index:                    1286                 3400
May 16 20:56:57 localhost borg: ------------------------------------------------------------------------------
```

- последний созданный бекап

```bash
BORG_PASSPHRASE=Otus1234 borg list borg@192.168.11.160:/var/backup/
etc-2022-05-16_22:56:56              Mon, 2022-05-16 22:56:57 [fe48a53546ae1cbd053c4d45b00d0cdbeaf8d6180fb1c699adf35fa90e164134]
```

- посмотрим список файлов

```bash
BORG_PASSPHRASE=Otus1234 borg list borg@192.168.11.160:/var/backup/::etc-2022-05-16_22:56:56 | head -n 10
drwxr-xr-x root   root          0 Mon, 2022-05-16 20:16:48 etc
-rw------- root   root          0 Mon, 2022-05-16 22:04:55 etc/crypttab
lrwxrwxrwx root   root         17 Mon, 2022-05-16 22:04:55 etc/mtab -> /proc/self/mounts
-rw-r--r-- root   root          7 Mon, 2022-05-16 20:13:17 etc/hostname
-rw-r--r-- root   root       2388 Mon, 2022-05-16 22:08:36 etc/libuser.conf
-rw-r--r-- root   root       2043 Mon, 2022-05-16 22:08:36 etc/login.defs
-rw-r--r-- root   root         37 Mon, 2022-05-16 22:08:36 etc/vconsole.conf
lrwxrwxrwx root   root         25 Mon, 2022-05-16 22:08:36 etc/localtime -> ../usr/share/zoneinfo/UTC
-rw-r--r-- root   root         19 Mon, 2022-05-16 22:08:36 etc/locale.conf
-rw-r--r-- root   root        450 Mon, 2022-05-16 20:13:21 etc/fstab
```

- остановим бекап

```bash
systemctl stop borg-backup.timer
```

- восстановим директорию /etc из бекапа

```bash
cd
BORG_PASSPHRASE=Otus1234 borg extract borg@192.168.11.160:/var/backup/::etc-2022-05-16_22:56:56 etc

rm -rf /etc/
ls /etc/ | wc -l
0

cp -Rf etc/* /etc/

ls /etc/ | wc -l
180

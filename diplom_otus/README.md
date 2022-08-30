# OTUS Learning
# Проектная работа


## Цель: Создание рабочего проекта
Веб-проект с развертыванием нескольких виртуальных машин должен отвечать следующим требованиям:
- включен https
- основная инфраструктура в DMZ зоне
- файрволл на входе
- сбор метрик и настроенный алертинг
- везде включен selinux
- организован централизованный сбор логов

## Проектная документация
## Описание стенда
С помощью Vagrant и Ansible описано развёртывание стенда из пяти виртуальных машин:
* [webserver](webserver.yml) - сервер веб-приложения (Atlassian Jira)
* [database](database.yml) - сервер баз данных (PostgreSQL)
* [zabbix](zabbix-server.yml) - сервер мониторинга (Zabbix)
* [elk](elk.yml) - сервер централизованного сбора логов (Стек ELK)
* [backup](backup.yml) - сервер для хранения бэкапов (Borgbackup)

Основная задача - обспечить автоматическое развёртывание Jira Server и сопутствующей инфраструктуры (мониторинг, логирование, алертинг, бэкапирование)
## Технические требования
Host server:
* OS - Linux x86_64
* RAM >= 16GB
* CPU >= 4 cores

Software requirements:
* Ansible version - 2.8.0
* Vagrant version - 2.2.10
* VirtualBox version - 5.2.42
## Механизм работы
Для корректной работы стенда в файле [roles/jira-restore/defaults/main.yml](roles/jira-restore/defaults/main.yml) измените параметр *parent_host_ip* на IP-адрес вашей хостовой системы, на которой будете разворачивать стенд.

Стенд разворачивается командой *vagrant up*

## Проверка работоспособности
После отработки vagrant'а будут доступны следующие веб-интерфейсы:
* Jira Server - http://127.0.0.1:8081
* Zabbix Server - https://127.0.0.1:8443
* ELK - http://127.0.0.1:5601

Доступ ко всем хостам по ssh доступен по команде "*vagrant ssh hostname*"

Проверка включённого фаервола: "*sudo systemctl status firewalld*"

В выводе должно быть: "*Active: active (running)*"


Проверка selinux: "*sudo sestatus*"

В выводе должно быть: "*Current mode: enforcing*"

## Учётные данные
Login/Password
* Jira Server - http://127.0.0.1:8081 - jira.otus/otus
* Zabbix Server - https://127.0.0.1:8443 - Admin/zabbix
* ELK - http://127.0.0.1:5601 - elastic/lAM34W0KV0jwuZD8chuh
# Фильтрация трафика - firewalld, iptables

## Задание

**Сценарии iptables:**

* Реализовать knocking port
    - centralRouter может попасть на ssh inetrRouter через knock скрипт
пример в материалах
* Добавить inetRouter2, который виден(маршрутизируется (host-only тип сети для виртуалки)) с хоста или форвардится порт через локалхост
* Запустить nginx на centralServer
* Пробросить 80й порт на inetRouter2 8080
* Дефолт в инет оставить через inetRouter
* Реализовать проход на 80й порт без маскарадинга

### Решение
* Решение представлено в `Vagrantfile`, `inetrouter_iptables.rules`, `knock.sh`
* Реализация knoking port осуществлена через гайд -> https://otus.ru/nest/post/267/
  - Для проверки подключения через knoking port необходимо:
    * Войти в **centralroute** `vagrant ssh centralrouter`
    * Выполнить `/vagrant/knock.sh 192.168.255.1 8881 7777 9991 && ssh 192.168.255.1`
* Для проверки доступа к nginx через inetRouter2 необходимо:
    * Войти в `inetRouter2` -> `vagrant ssh inetRouter2`
    * Сделать запрос `curl http://192.168.255.2:8080`, `curl http://10.0.2.15:8080`

## Запуск
* `vagrant up`

**ОС**: CentOS

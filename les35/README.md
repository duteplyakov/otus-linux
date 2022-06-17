# Настраиваем split-dns

## Задачи
взять стенд https://github.com/erlong15/vagrant-bind
добавить еще один сервер client2
завести в зоне dns.lab имена:
- web1 смотрит на клиент1
- web2 смотрит на клиент2

завести еще одну зону newdns.lab
завести в ней запись
- www - смотрит на обоих клиентов

настроить split-dns
- клиент1 - видит обе зоны, но в зоне dns.lab только web1

- клиент2 видит только dns.lab

*) настроить все без выключения selinux


## Выполнение

Не сразу понял, почему сами ns в отличие от клиентов не видят те записи, которые сами же и содержат - конечно же, на ns-серверах в resolv.conf были прописаны localhost в качестве nameserver. Решил этот момент добавлением к прослушиванию демоном named адреса 127.0.0.1

### Новые записи в зоне dns.lab

Добавил web1 и web2 в зону dns.lab, не забыв исправить serial:

```
cat >>/etc/named/named.dns.lab

web1            IN      A       192.168.50.15
web2            IN      A       192.168.50.16
```

Также добавил записи в обратную зону:
```
cat >>//etc/named/named.dns.lab.rev

; All other records
15.50.168.192.in-addr.arpa.     IN      PTR     web1
16.50.168.192.in-addr.arpa.     IN      PTR     web2
```
Аналогично вношу изменения в serial

<details>
<summary> ### Проверка </summary>

На ns01
```
[root@ns01 ~]# host web1
web1.dns.lab has address 192.168.50.15
[root@ns01 ~]# host web2
web2.dns.lab has address 192.168.50.16
[root@ns01 ~]#
[root@ns01 ~]#
[root@ns01 ~]# dig @ns01 web1.dns.lab

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> @ns01 web1.dns.lab
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 52147
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;web1.dns.lab.                  IN      A

;; ANSWER SECTION:
web1.dns.lab.           3600    IN      A       192.168.50.15

;; AUTHORITY SECTION:
dns.lab.                3600    IN      NS      ns02.dns.lab.
dns.lab.                3600    IN      NS      ns01.dns.lab.

;; ADDITIONAL SECTION:
ns01.dns.lab.           3600    IN      A       192.168.50.10
ns02.dns.lab.           3600    IN      A       192.168.50.11

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Wed Jun 24 17:02:11 MSK 2020
;; MSG SIZE  rcvd: 127

[root@ns01 ~]# dig @ns01 web2.dns.lab

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> @ns01 web2.dns.lab
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 63386
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;web2.dns.lab.                  IN      A

;; ANSWER SECTION:
web2.dns.lab.           3600    IN      A       192.168.50.16

;; AUTHORITY SECTION:
dns.lab.                3600    IN      NS      ns01.dns.lab.
dns.lab.                3600    IN      NS      ns02.dns.lab.

;; ADDITIONAL SECTION:
ns01.dns.lab.           3600    IN      A       192.168.50.10
ns02.dns.lab.           3600    IN      A       192.168.50.11

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Wed Jun 24 17:02:17 MSK 2020
;; MSG SIZE  rcvd: 127
```

На ns02
```
[root@ns02 ~]# host web1
web1.dns.lab has address 192.168.50.15
[root@ns02 ~]# host web2
web2.dns.lab has address 192.168.50.16
[root@ns02 ~]#
[root@ns02 ~]#
[root@ns02 ~]# dig @ns02 web1.dns.lab

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> @ns02 web1.dns.lab
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 5920
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;web1.dns.lab.                  IN      A

;; ANSWER SECTION:
web1.dns.lab.           3600    IN      A       192.168.50.15

;; AUTHORITY SECTION:
dns.lab.                3600    IN      NS      ns01.dns.lab.
dns.lab.                3600    IN      NS      ns02.dns.lab.

;; ADDITIONAL SECTION:
ns01.dns.lab.           3600    IN      A       192.168.50.10
ns02.dns.lab.           3600    IN      A       192.168.50.11

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Wed Jun 24 17:03:52 MSK 2020
;; MSG SIZE  rcvd: 127

[root@ns02 ~]# dig @ns02 web2.dns.lab

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> @ns02 web2.dns.lab
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 29016
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;web2.dns.lab.                  IN      A

;; ANSWER SECTION:
web2.dns.lab.           3600    IN      A       192.168.50.16

;; AUTHORITY SECTION:
dns.lab.                3600    IN      NS      ns02.dns.lab.
dns.lab.                3600    IN      NS      ns01.dns.lab.

;; ADDITIONAL SECTION:
ns01.dns.lab.           3600    IN      A       192.168.50.10
ns02.dns.lab.           3600    IN      A       192.168.50.11

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Wed Jun 24 17:04:19 MSK 2020
;; MSG SIZE  rcvd: 127
```

На client
```
[vagrant@client ~]$ host ns01
ns01.dns.lab has address 192.168.50.10
[vagrant@client ~]$ host ns02
ns02.dns.lab has address 192.168.50.11
[vagrant@client ~]$ host web1
web1.dns.lab has address 192.168.50.15
[vagrant@client ~]$ host web2
web2.dns.lab has address 192.168.50.16
[vagrant@client ~]$ dig @ns01 web2.dns.lab

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> @ns01 web2.dns.lab
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 57552
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;web2.dns.lab.                  IN      A

;; ANSWER SECTION:
web2.dns.lab.           3600    IN      A       192.168.50.16

;; AUTHORITY SECTION:
dns.lab.                3600    IN      NS      ns02.dns.lab.
dns.lab.                3600    IN      NS      ns01.dns.lab.

;; ADDITIONAL SECTION:
ns01.dns.lab.           3600    IN      A       192.168.50.10
ns02.dns.lab.           3600    IN      A       192.168.50.11

;; Query time: 0 msec
;; SERVER: 192.168.50.10#53(192.168.50.10)
;; WHEN: Wed Jun 24 17:20:41 MSK 2020
;; MSG SIZE  rcvd: 127

[vagrant@client ~]$ dig @ns02 web1.dns.lab

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> @ns02 web1.dns.lab
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 10179
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;web1.dns.lab.                  IN      A

;; ANSWER SECTION:
web1.dns.lab.           3600    IN      A       192.168.50.15

;; AUTHORITY SECTION:
dns.lab.                3600    IN      NS      ns02.dns.lab.
dns.lab.                3600    IN      NS      ns01.dns.lab.

;; ADDITIONAL SECTION:
ns01.dns.lab.           3600    IN      A       192.168.50.10
ns02.dns.lab.           3600    IN      A       192.168.50.11

;; Query time: 5 msec
;; SERVER: 192.168.50.11#53(192.168.50.11)
;; WHEN: Wed Jun 24 17:21:23 MSK 2020
;; MSG SIZE  rcvd: 127
```

На client2
```
[vagrant@client2 ~]$ host ns01
ns01.dns.lab has address 192.168.50.10
[vagrant@client2 ~]$ host ns02
ns02.dns.lab has address 192.168.50.11
[vagrant@client2 ~]$ host web1
web1.dns.lab has address 192.168.50.15
[vagrant@client2 ~]$ host web2
web2.dns.lab has address 192.168.50.16
[vagrant@client2 ~]$
[vagrant@client2 ~]$
[vagrant@client2 ~]$ dig @ns01 web1.dns.lab

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> @ns01 web1.dns.lab
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 56601
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;web1.dns.lab.                  IN      A

;; ANSWER SECTION:
web1.dns.lab.           3600    IN      A       192.168.50.15

;; AUTHORITY SECTION:
dns.lab.                3600    IN      NS      ns01.dns.lab.
dns.lab.                3600    IN      NS      ns02.dns.lab.

;; ADDITIONAL SECTION:
ns01.dns.lab.           3600    IN      A       192.168.50.10
ns02.dns.lab.           3600    IN      A       192.168.50.11

;; Query time: 0 msec
;; SERVER: 192.168.50.10#53(192.168.50.10)
;; WHEN: Wed Jun 24 17:23:18 MSK 2020
;; MSG SIZE  rcvd: 127

[vagrant@client2 ~]$ dig @ns02 web2.dns.lab

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> @ns02 web2.dns.lab
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28944
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;web2.dns.lab.                  IN      A

;; ANSWER SECTION:
web2.dns.lab.           3600    IN      A       192.168.50.16

;; AUTHORITY SECTION:
dns.lab.                3600    IN      NS      ns02.dns.lab.
dns.lab.                3600    IN      NS      ns01.dns.lab.

;; ADDITIONAL SECTION:
ns01.dns.lab.           3600    IN      A       192.168.50.10
ns02.dns.lab.           3600    IN      A       192.168.50.11

;; Query time: 0 msec
;; SERVER: 192.168.50.11#53(192.168.50.11)
;; WHEN: Wed Jun 24 17:23:41 MSK 2020
;; MSG SIZE  rcvd: 127

```
</details>

### Новая зона newdns.lab

Создаю конфиг зоны:
```
$TTL 3600
$ORIGIN newdns.lab.
@               IN      SOA     ns01.newdns.lab. root.newdns.lab. (
                            1706202001 ; serial
                            3600       ; refresh (1 hour)
                            600        ; retry (10 minutes)
                            86400      ; expire (1 day)
                            600        ; minimum (10 minutes)
                        )

                IN      NS      ns01.newdns.lab.
                IN      NS      ns02.newdns.lab.

; DNS Servers
ns01            IN      A       192.168.50.10
ns02            IN      A       192.168.50.11

; All other records
www             IN      A       192.168.50.15
www             IN      A       192.168.50.16
```
В двух последних строках настраивается round-robin dns для двух хостов с одним именем.

<details>
<summary> ### Проверка </summary>

Т.к. пока деления на view нет, то ответы будут одинаковые со всех хостов и достаточно проверить с какого-нибудь одного

```
[vagrant@client ~]$  dig @ns01 www.newdns.lab +short
192.168.50.16
192.168.50.15
[vagrant@client ~]$  dig @ns01 www.newdns.lab +short
192.168.50.15
192.168.50.16
[vagrant@client ~]$  dig @ns01 www.newdns.lab +short
192.168.50.16
192.168.50.15
[vagrant@client ~]$  dig @ns01 www.newdns.lab +short
192.168.50.15
192.168.50.16
```

Совершая несколько одинаковых запросов подряд и каждый раз получая немного иной результат, убеждаюсь, что round-robin отрабатывает как и ожидалось.

</details>


### Настройка split-dns

Для первой части задачи наобходимо настроить view

Для начала прописываю acl в named.conf обоих ns, обозначая доступ в каждый view указанных хостам. В том числе можно указывать и маски, группируя хосты по подсетям. А также можно использовать ключ.
```
acl "view1" {
    127.0.0.1/32; //ns01
    192.168.50.10/32; //ns01
    192.168.50.11/32; //ns02
    192.168.50.15/32; //client
};

acl "view2" {
    192.168.50.16/32; //client2
};
```

<details>
<summary> Далее, необходимо создать каждый view, группируя в них зоны </summary>
В качестве примера участок named.conf с мастера

```
view "view1" {
    match-clients { "view1"; };

    // root zone
    zone "." IN {
        type hint;
        file "named.ca";
    };

    // zones like localhost
    include "/etc/named.rfc1912.zones";
    // root's DNSKEY
    include "/etc/named.root.key";

    // lab's zone
    zone "dns.lab" {
        type master;
        allow-transfer { key "zonetransfer.key"; };
        file "/etc/named/named.dns.lab";
    };

    // lab's zone reverse
    zone "50.168.192.in-addr.arpa" {
        type master;
        allow-transfer { key "zonetransfer.key"; };
        file "/etc/named/named.dns.lab.rev";
    };

    // lab's ddns zone
    zone "ddns.lab" {
        type master;
        allow-transfer { key "zonetransfer.key"; };
        file "/etc/named/named.ddns.lab";
    };

    // newdns zone
    zone "newdns.lab" {
        type master;
        allow-transfer { key "zonetransfer.key"; };
        file "/etc/named/named.newdns.lab";
    };

    // newdns ddns zone
    zone "newddns.lab" {
        type master;
        file "/etc/named/named.newddns.lab";
    };
};

view "view2" {
    match-clients { "view2"; };

    // zones like localhost
    include "/etc/named.rfc1912.zones";
    // root's DNSKEY
    include "/etc/named.root.key";

    // lab's zone
    zone "dns.lab" {
        type master;
        allow-transfer { key "zonetransfer.key"; };
        file "/etc/named/named.dns.lab";
    };

    // lab's zone reverse
    zone "50.168.192.in-addr.arpa" {
        type master;
        allow-transfer { key "zonetransfer.key"; };
        file "/etc/named/named.dns.lab.rev";
    };

    // lab's ddns zone
    zone "ddns.lab" {
        type master;
        allow-transfer { key "zonetransfer.key"; };
        file "/etc/named/named.ddns.lab";
    };

};

```

</details>

Для второй части задачи придется удалить из зоны dns.lab запись о хосте web2, создав для этого дополнительный файл зоны для view1. Для view2 будет работать прежний файл зоны.


<details>
<summary> ### Проверка </summary>

На client

```
[vagrant@client ~]$ host web1
web1.dns.lab has address 192.168.50.15

[vagrant@client ~]$ host web2
Host web2 not found: 3(NXDOMAIN)

[vagrant@client ~]$ host www
www.newdns.lab has address 192.168.50.15
www.newdns.lab has address 192.168.50.16
```

На client2

```
[vagrant@client2 ~]$ host web1
web1.dns.lab has address 192.168.50.15

[vagrant@client2 ~]$ host web2
web2.dns.lab has address 192.168.50.16

[vagrant@client2 ~]$ host www
Host www not found: 3(NXDOMAIN)
```

</details>


### \* Проверяю состояние selinux на всех хостах

```
[vagrant@ns01 ~]$ getenforce
Enforcing

[vagrant@ns02 ~]$ getenforce
Enforcing

[vagrant@client ~]$ getenforce
Enforcing

[vagrant@client2 ~]$ getenforce
Enforcing

```

## Итоги

- Все задачи выполнены.
- selinux работает
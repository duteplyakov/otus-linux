**Задание**

- Поднять три виртуалки
- Объединить их разными vlan
1. Поднять OSPF между машинами на базе Quagga
2. Изобразить ассиметричный роутинг
3. Сделать один из линков "дорогим", но чтобы при этом роутинг был симметричным

Топология сети:

![alt text](./network_topology.png)

**Выполнение задания**

***1. Поднять OSPF между машинами на базе Quagga***

На всех роутерах включим forwarding пакетов между интерфейсами, а также зададим "мягкий" режим фильтрации пакетов на всех интерфейсах (необходимо для функционирования ассиметричного роутинга, когда пакет с ответом, уходит не с того интерфейса, на который пришел пакет-запрос):
```
[root@r1 ~]# echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/ip_forwarding.conf
[root@r1 ~]# echo "net.ipv4.conf.all.rp_filter = 2" >> /etc/sysctl.d/ip_forwarding.conf
[root@r1 ~]# systemctl restart network
```

На всех роутерах для назначения дополнительного статического IP-адреса на loopback-интерфейс создадим субинтерфейс `lo:2`. Сделаем это с помощью конфигурационного файла `/etc/sysconfig/network-scripts/ifcfg-lo.2`:
```
[root@r1 ~]# cat > /etc/sysconfig/network-scripts/ifcfg-lo.2 <<EOF
DEVICE=lo:2
IPADDR=10.0.0.1
PREFIX=32
NETWORK=10.0.0.1
ONBOOT=yes
EOF

[root@r1 ~]# systemctl restart network
```

Установим `quagga` и `tcpdump` на r1:
```
[root@r1 ~]# yum install -y quagga
[root@r1 ~]# yum install -y tcpdump
```

Назначим интерфейсы на **r1** в соответсвующие зоны, включим `masquerade` и установим `quagga` и `tcpdump` на r2 и r3:
```
[root@r1 ~]# systemctl enable --now firewalld
[root@r1 ~]# firewall-cmd --change-zone=eth0 --zone=external --permanent
[root@r1 ~]# firewall-cmd --change-zone=eth1 --zone=internal --permanent 
[root@r1 ~]# firewall-cmd --change-zone=eth2 --zone=internal --permanent
[root@r1 ~]# firewall-cmd --zone=external --add-masquerade --permanent
[root@r1 ~]# firewall-cmd --reload

[root@r2 ~]# yum install -y quagga
[root@r2 ~]# yum install -y tcpdump
[root@r3 ~]# yum install -y quagga
[root@r3 ~]# yum install -y tcpdump
```
Удалим дефолтный маршрут на r2 и r3, созданный Vagrant'ом, чтобы позже получить его от r1 через ospf:
```
[root@r2 ~]# echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
[root@r2 ~]# systemctl restart network
[root@r3 ~]# echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
[root@r3 ~]# systemctl restart network
```

Для корректной работы OSPF необходимо создать файл `/etc/quagga/ospfd.conf` с правами для `quagga:quaggavt`. Это нужно для работы демона ospfd и возможности управляющей утилите zebra писать в конфигурационные файлы. Также нужно задать  разрешения selinux с помощью переключателя `zebra_write_config`:
```
[root@r1 ~]# touch /etc/quagga/ospfd.conf
[root@r1 ~]# chown quagga:quaggavt /etc/quagga/ospfd.conf
[root@r1 ~]# setsebool -P zebra_write_config 1
[root@r1 ~]# systemctl enable --now zebra
[root@r1 ~]# systemctl enable --now ospfd
```

Также необходимо разрешить протокол 89 в firewall'е:
```
[root@r1 ~]# firewall-cmd --zone=internal --add-protocol=ospf --permanent
[root@r1 ~]# firewall-cmd --reload

[root@r2 ~]# systemctl enable --now firewalld
[root@r2 ~]# firewall-cmd --add-protocol=ospf --permanent
[root@r2 ~]# firewall-cmd --reload

[root@r3 ~]# systemctl enable --now firewalld
[root@r3 ~]# firewall-cmd --add-protocol=ospf --permanent
[root@r3 ~]# firewall-cmd --reload
```

Для конфигурирования программных маршрутизаторов используется утилита `vtysh`. Натроим с её помощью процессы OSPF на роутерах:
```
#На роутере r1:

[root@r1 ~]# vtysh

Hello, this is Quagga (version 0.99.22.4).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

r1# conf t
r1(config)# router ospf 
r1(config-router)# router-id 10.0.0.1
r1(config-router)# passive-interface  default  
r1(config-router)# no passive-interface  eth1
r1(config-router)# no passive-interface  eth2
r1(config-router)# network  10.0.0.1/32 area 0
r1(config-router)# network  172.16.1.0/24 area 0
r1(config-router)# network  172.16.2.0/24 area 0
r1(config-router)# default-information  originate
r1(config-router)# do write
Building Configuration...
Configuration saved to /etc/quagga/zebra.conf
Configuration saved to /etc/quagga/ospfd.conf
[OK]

#На роутере r2:

[root@r2 ~]# vtysh 

Hello, this is Quagga (version 0.99.22.4).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

r2# conf t
r2(config)# router ospf 
r2(config-router)# router-id  10.0.0.2
r2(config-router)# passive-interface  default  
r2(config-router)# no passive-interface  eth1
r2(config-router)# no passive-interface  eth2
r2(config-router)# network  10.0.0.2/32 area 0
r2(config-router)# network  172.16.1.0/24 area 0
r2(config-router)# network  172.16.3.0/24 area 0
r2(config-router)# do write
Building Configuration...
Configuration saved to /etc/quagga/zebra.conf
Configuration saved to /etc/quagga/ospfd.conf
[OK]

#На роутере r3:

[root@r3 ~]# vtysh 

Hello, this is Quagga (version 0.99.22.4).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

r3# conf t
r3(config)# router ospf 
r3(config-router)# router-id  10.0.0.3
r3(config-router)# passive-interface  default  
r3(config-router)# no passive-interface  eth1
r3(config-router)# no passive-interface  eth2
r3(config-router)# network  10.0.0.3/32 area 0
r3(config-router)# network  172.16.2.0/24 area 0
r3(config-router)# network  172.16.3.0/24 area 0
r3(config-router)# do write
Building Configuration...
Configuration saved to /etc/quagga/zebra.conf
Configuration saved to /etc/quagga/ospfd.conf
[OK]
```

Проверим, что по протоколу OSPF прилетели все нужные нам маршруты (в том числе дефолтный маршрут в "Интернет" через роутер `r1` на `r2` и `r3`):
```
#На роутере r1:
[root@r1 ~]# ip r
default via 10.0.2.2 dev eth0 proto dhcp metric 100 
10.0.0.2 via 172.16.1.2 dev eth1 proto zebra metric 20 
10.0.0.3 via 172.16.2.3 dev eth2 proto zebra metric 20 
10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15 metric 100 
172.16.1.0/24 dev eth1 proto kernel scope link src 172.16.1.1 metric 101 
172.16.2.0/24 dev eth2 proto kernel scope link src 172.16.2.1 metric 102 
172.16.3.0/24 proto zebra metric 20 
	nexthop via 172.16.1.2 dev eth1 weight 1 
	nexthop via 172.16.2.3 dev eth2 weight 1 

#На роутере r2:
[root@r2 ~]# ip r
default via 172.16.1.1 dev eth1 proto zebra metric 10 
10.0.0.1 via 172.16.1.1 dev eth1 proto zebra metric 20 
10.0.0.3 via 172.16.3.3 dev eth2 proto zebra metric 20 
10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15 metric 100 
172.16.1.0/24 dev eth1 proto kernel scope link src 172.16.1.2 metric 101 
172.16.2.0/24 proto zebra metric 20 
	nexthop via 172.16.1.1 dev eth1 weight 1 
	nexthop via 172.16.3.3 dev eth2 weight 1 
172.16.3.0/24 dev eth2 proto kernel scope link src 172.16.3.2 metric 102

#На роутере r3:
[root@r3 ~]# ip r
default via 172.16.2.1 dev eth1 proto zebra metric 10 
10.0.0.1 via 172.16.2.1 dev eth1 proto zebra metric 20 
10.0.0.2 via 172.16.3.2 dev eth2 proto zebra metric 20 
10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15 metric 100 
172.16.1.0/24 proto zebra metric 20 
	nexthop via 172.16.2.1 dev eth1 weight 1 
	nexthop via 172.16.3.2 dev eth2 weight 1 
172.16.2.0/24 dev eth1 proto kernel scope link src 172.16.2.3 metric 101 
172.16.3.0/24 dev eth2 proto kernel scope link src 172.16.3.3 metric 102
```

Содержимое конфигурационных файлов `/etc/quagga/zebra.conf` и `/etc/quagga/ospfd.conf` в дальнейшем будем использовать в шаблонах j2 для ansible. Выглядят эти файлы следующим образом:

<details>
  <summary>На роутере r1:</summary>

```
[root@r1 ~]# cat /etc/quagga/zebra.conf
!
! Zebra configuration saved from vty
!   2020/05/31 17:01:53
!
hostname r1
!
interface eth0
 ipv6 nd suppress-ra
!
interface eth1
 ipv6 nd suppress-ra
!
interface eth2
 ipv6 nd suppress-ra
!
interface lo
!
ip forwarding
!
!
line vty
!
[root@r1 ~]# cat /etc/quagga/ospfd.conf
!
! Zebra configuration saved from vty
!   2020/05/31 17:01:53
!
!
!
!
interface eth0
!
interface eth1
!
interface eth2
!
interface lo
!
router ospf
 ospf router-id 10.0.0.1
 passive-interface default
 no passive-interface eth1
 no passive-interface eth2
 network 10.0.0.1/32 area 0.0.0.0
 network 172.16.1.0/24 area 0.0.0.0
 network 172.16.2.0/24 area 0.0.0.0
 default-information originate
!
line vty
!
```

</details>

<details>
  <summary>На роутере r2:</summary>

```
[root@r2 ~]# cat /etc/quagga/zebra.conf
!
! Zebra configuration saved from vty
!   2020/05/31 17:05:06
!
hostname r2
!
interface eth0
 ipv6 nd suppress-ra
!
interface eth1
 ipv6 nd suppress-ra
!
interface eth2
 ipv6 nd suppress-ra
!
interface lo
!
ip forwarding
!
!
line vty
!
[root@r2 ~]# cat /etc/quagga/ospfd.conf
!
! Zebra configuration saved from vty
!   2020/05/31 17:05:06
!
!
!
!
interface eth0
!
interface eth1
!
interface eth2
!
interface lo
!
router ospf
 ospf router-id 10.0.0.2
 passive-interface default
 no passive-interface eth1
 no passive-interface eth2
 network 10.0.0.2/32 area 0.0.0.0
 network 172.16.1.0/24 area 0.0.0.0
 network 172.16.3.0/24 area 0.0.0.0
!
line vty
!
```

</details>


<details>
  <summary>На роутере r3:</summary>

```
[root@r3 ~]# cat /etc/quagga/zebra.conf
!
! Zebra configuration saved from vty
!   2020/05/31 17:07:05
!
hostname r3
!
interface eth0
 ipv6 nd suppress-ra
!
interface eth1
 ipv6 nd suppress-ra
!
interface eth2
 ipv6 nd suppress-ra
!
interface lo
!
ip forwarding
!
!
line vty
!
[root@r3 ~]# cat /etc/quagga/ospfd.conf
!
! Zebra configuration saved from vty
!   2020/05/31 17:07:05
!
!
!
!
interface eth0
!
interface eth1
!
interface eth2
!
interface lo
!
router ospf
 ospf router-id 10.0.0.3
 passive-interface default
 no passive-interface eth1
 no passive-interface eth2
 network 10.0.0.3/32 area 0.0.0.0
 network 172.16.2.0/24 area 0.0.0.0
 network 172.16.3.0/24 area 0.0.0.0
!
line vty
!
```

</details>

***2. Изобразить ассиметричный роутинг***

Продемонстрируем ассиметричный роутинг на примере роутеров **r1** и **r2**. Маршрут до сетей 10.0.0.3 и 10.0.0.2 соответственно на этих роутерах выглядит следующим образом:
```
#На роутере r2:
[root@r2 ~]# ip route get 10.0.0.3
10.0.0.3 via 172.16.3.3 dev eth2 src 172.16.3.2 

#На роутере r3:
[root@r3 ~]# ip route get 10.0.0.2
10.0.0.2 via 172.16.3.2 dev eth2 src 172.16.3.3
```

Запустим пинги на **r2** до 10.0.0.3 с source-ip-адресом 10.0.0.2 и послушаем траффик с помощью `tcpdump` на интерфейсе `eth2`:
```
[root@r2 ~]# ping -I 10.0.0.2 10.0.0.3
PING 10.0.0.3 (10.0.0.3) from 10.0.0.2 : 56(84) bytes of data.
64 bytes from 10.0.0.3: icmp_seq=1 ttl=64 time=0.796 ms
64 bytes from 10.0.0.3: icmp_seq=2 ttl=64 time=0.996 ms
...

[root@r2 ~]# tcpdump -i eth2 -n
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth2, link-type EN10MB (Ethernet), capture size 262144 bytes
19:34:14.688158 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 9800, seq 67, length 64
19:34:14.688970 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 9800, seq 67, length 64
19:34:15.689659 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 9800, seq 68, length 64
19:34:15.690785 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 9800, seq 68, length 64
...

```
Видим, что `ICMP echo request` уходит с `eth2`, и `ICMP echo reply` приходит на `eth2`.

Теперь повысим стоимость интерфейса `eth2` на **r3**, чтобы OSPF перестроил таблицу маршрутизации, после чего траффик с **r3** к сетям за **r2** пойдет  через **r1**:
```
[root@r3 ~]# vtysh 

Hello, this is Quagga (version 0.99.22.4).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

r3# conf t
r3(config)# int eth2
r3(config-if)# ip ospf  cost  100
```

Проверим, что маршурт до `10.0.0.2` на **r3** обновился:
```
[root@r3 ~]# ip route get 10.0.0.2
10.0.0.2 via 172.16.2.1 dev eth1 src 172.16.2.3 
```

Проверим, как ходит траффик:
```
[root@r2 ~]# ping -I 10.0.0.2 10.0.0.3
PING 10.0.0.3 (10.0.0.3) from 10.0.0.2 : 56(84) bytes of data.
64 bytes from 10.0.0.3: icmp_seq=1 ttl=63 time=1.33 ms
64 bytes from 10.0.0.3: icmp_seq=2 ttl=63 time=1.76 ms
...
[root@r2 ~]# tcpdump -i eth2 -n
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth2, link-type EN10MB (Ethernet), capture size 262144 bytes
19:42:21.023108 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10295, seq 6, length 64
19:42:21.571068 IP 172.16.3.3 > 224.0.0.5: OSPFv2, LS-Update, length 60
19:42:22.024859 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10295, seq 7, length 64
19:42:22.310570 IP 172.16.3.2 > 224.0.0.5: OSPFv2, LS-Ack, length 44
19:42:23.026468 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10295, seq 8, length 64
19:42:24.027556 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10295, seq 9, length 64
19:42:25.028763 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10295, seq 10, length 64
^C

[root@r2 ~]# tcpdump -i eth1 -n
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth1, link-type EN10MB (Ethernet), capture size 262144 bytes
19:43:09.107108 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 10295, seq 54, length 64
19:43:10.108748 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 10295, seq 55, length 64
19:43:11.110338 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 10295, seq 56, length 64
19:43:12.111680 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 10295, seq 57, length 64
^C

```

Видим, что `ICMP echo request` уходит с `eth2`, а `ICMP echo reply` приходит уже на `eth1`.

<details>
  <summary>Конфиги на r3:</summary>

```
[root@r3 ~]# cat /etc/quagga/zebra.conf
!
! Zebra configuration saved from vty
!   2020/05/31 19:58:13
!
hostname r3
!
interface eth0
 ipv6 nd suppress-ra
!
interface eth1
 ipv6 nd suppress-ra
!
interface eth2
 ipv6 nd suppress-ra
!
interface lo
!
ip forwarding
!
!
line vty
!
[root@r3 ~]# cat /etc/quagga/ospfd.conf
!
! Zebra configuration saved from vty
!   2020/05/31 19:58:13
!
!
!
!
interface eth0
!
interface eth1
!
interface eth2
 ip ospf cost 100
!
interface lo
!
router ospf
 ospf router-id 10.0.0.3
 passive-interface default
 no passive-interface eth1
 no passive-interface eth2
 network 10.0.0.3/32 area 0.0.0.0
 network 172.16.2.0/24 area 0.0.0.0
 network 172.16.3.0/24 area 0.0.0.0
!
line vty
!
```

</details>

***3. Сделать один из линков "дорогим", но чтобы при этом роутинг был симметричным***

Чтобы восстановить "симметричность" роутинга, не меняя стоимость "дорогого" интерфейса `eth2`, необходимо выставить стоимость интерфейса `eth1` на **r3** в значение 100, как и у `eth2`:
```
[root@r3 ~]# vtysh 

Hello, this is Quagga (version 0.99.22.4).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

r3# conf t
r3(config)# int eth1
r3(config-if)# ip ospf cost  100
```

Проверим маршурт до `10.0.0.2` на **r3**:
```
[root@r3 ~]# ip route get 10.0.0.2
10.0.0.2 via 172.16.3.2 dev eth2 src 172.16.3.3 
```

Проверим, как ходит траффик:
```
[root@r2 ~]# ping -I 10.0.0.2 10.0.0.3
PING 10.0.0.3 (10.0.0.3) from 10.0.0.2 : 56(84) bytes of data.
64 bytes from 10.0.0.3: icmp_seq=1 ttl=64 time=0.938 ms
64 bytes from 10.0.0.3: icmp_seq=2 ttl=64 time=1.09 ms
...
[root@r2 ~]# tcpdump -i eth2 -n
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth2, link-type EN10MB (Ethernet), capture size 262144 bytes
19:51:02.777599 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10766, seq 8, length 64
19:51:02.778481 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 10766, seq 8, length 64
19:51:03.779388 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10766, seq 9, length 64
19:51:03.780379 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 10766, seq 9, length 64
19:51:04.780920 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10766, seq 10, length 64
19:51:04.781855 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 10766, seq 10, length 64
19:51:05.782804 IP 10.0.0.2 > 10.0.0.3: ICMP echo request, id 10766, seq 11, length 64
19:51:05.783891 IP 10.0.0.3 > 10.0.0.2: ICMP echo reply, id 10766, seq 11, length 64
^C
```

Видим, что `ICMP echo request` и `ICMP echo reply` снова ходят через `eth2`.

**Проверка ДЗ**

1. Выполнить `vagrant up`, в результате чего должен подняться стенд с ассиметричной маршрутизацией, но по факту стенд начинает работать только после повторного выполнения плейбука командой `ansible-playbook playbooks/ospf.yml` - почему так происходит, я не смог понять, возможно это связано со спецификой Vagrant'а. 

После выполнения плейбука на роутере `r3` устанавливается стоимость интерфейса `eth2` в значение 100, поэтому при выполнении команды `ping -I 10.0.0.2 10.0.0.3` на роутере `r2` пакеты `ICMP echo request` уходят с `eth2`, а `ICMP echo reply` приходят уже на `eth1`. Проверить это можно с помощью утилиты `tcpdump` на `r2`.

2. Для восстановления симметричной маршрутизации необходимо повысить до 100 стоимость интерфейса `eth1` на роутере `r3`. Проще всего это сделать с помощью изменения в файле `inventories/host_vars/r3.yml` значения `eth1_cost` на 100. Далее запустить плейбук `playbooks/ospf.yml`. После этого ospf пересчитает маршруты и `ICMP echo request` и `ICMP echo reply` снова будут ходить на роутере `r2` через `eth2`.
































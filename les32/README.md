## Статическая и динамическая маршрутизация, OSPF

Домашнее задание
OSPF

-   Поднять три виртуалки
-   Объединить их разными vlan

1.  Поднять OSPF между машинами на базе Quagga
2.  Изобразить ассиметричный роутинг
3.  Сделать один из линков "дорогим", но чтобы при этом роутинг был симметричным

Запустим и добавим модуль 8021q в автозагрузку:  
`modprobe 8021q`  
`echo 8021q >> /etc/modules-load.d/8021q.conf`

Настроим vlan на router1:  
`cat /etc/sysconfig/network-scripts/ifcfg-eth1.0`  

    DEVICE="eth1.0"
    BOOTPROTO="none"
    ONBOOT="yes"
    IPADDR="10.0.0.1"
    NETMASK=255.255.255.0
    VLAN="yes"
    VLAN_ID=0  

`cat /etc/sysconfig/network-scripts/ifcfg-eth1.10`  

    DEVICE="eth1.10"
    BOOTPROTO="none"
    ONBOOT="yes"
    IPADDR="10.10.0.1"
    NETMASK=255.255.255.0
    VLAN="yes"
    VLAN_ID=10

Рестартуем сеть:  
`systemctl restart NetworkManager`

Разрешим и применим маршрутизацию:  
`cat /etc/sysctl.d/90-override.conf`  

    net.ipv4.ip_forward=1
    net.ipv4.conf.all.arp_filter=0
    net.ipv4.conf.all.rp_filter=1

`sysctl -p /etc/sysctl.d/90-override.conf`  

Остальные роутеры настраиваем аналогично.

* * *

Установим frr:  
`yum install frr`

Настроим запуск демона frr:  
`cat /etc/frr/daemons`  

    ...
    zebra=yes
    ...
    ospfd=yes
    ...

Настроим конфигурацию ospf:  
`cat /etc/frr/ospfd.conf`  

    ! -*- ospf -*-
    !
    ! OSPFd sample configuration file
    !
    !
    hostname router1
    password zebra
    enable password zebra
    !
    interface eth1.0
     description to_router2
     ip address 10.0.0.1/24
     ip ospf dead-interval 10
     ip ospf hello-interval 5
     ip ospf mtu-ignore
     ip ospf network point-to-point
    !
    interface eth1.10
     description to_router3
     ip address 10.10.0.1/24
     ip ospf dead-interval 10
     ip ospf hello-interval	5
     ip ospf mtu-ignore
     ip ospf network point-to-point

    router ospf
      network 10.0.0.0/24 area 0
      network 10.10.0.0/24 area 0
    !
    log stdout

Остальные роутеры настраиваем аналогично.  

Изобразим асимметричный роутинг

Разрешим асимметричный роутинг в ядре:  
`root@router3: echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter`

Запустим на router3 прослушку обоих интерфейсов:  
`root@router3: tcpdump -i eth1.10 icmp`
`root@router3: tcpdump -i eth1.20 icmp`

Запустим c router1 пинг на интерфейс eth1.20 router3  
`root@router1: ping 10.20.0.1`

Если в ядре настроен асимметричный роутинг, то мы увидим что на router3 icmp reply пакеты уходят с одного интерфейса, а icmp echo request приходят на другой.

После этого вернем параметры ядра в норму (`root@router3: echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter`)и сделаем один из линков "дорогим" командами:  
`vtysh`  

    configure terminal
    int eth1.10
    ip ospf cost 1000

Выводы делать долго, но суть понятна.
Теперь весь трафик будет по возможности идти через другой интерфейс.

# Архитектура сетей 

Дано Vagrantfile (https://github.com/erlong15/otus-linux/tree/network (ветка network)) с начальным построением сети

* inetRouter
* centralRouter
* centralServer

тестировалось на virtualbox

Построить следующую архитектуру:
* Сеть office1
    * 192.168.2.0/26 - dev
    * 192.168.2.64/26 - test servers
    * 192.168.2.128/26 - managers
    * 192.168.2.192/26 - office hardware
* Сеть office2
    * 192.168.1.0/25 - dev
    * 192.168.1.128/26 - test servers
    * 192.168.1.192/26 - office hardware
* Сеть central
    * 192.168.0.0/28 - directors
    * 192.168.0.32/28 - office hardware
    * 192.168.0.64/26 - wifi

```text
Office1 ---\
            -----> Central --IRouter --> internet
Office2 ---/
```

Итого должны получится следующие сервера:
* inetRouter
* centralRouter
* office1Router
* office2Router
* centralServer
* office1Server
* office2Server

Теоретическая часть:
* Найти свободные подсети (исполнено)
* Посчитать сколько узлов в каждой подсети, включая свободные (исполнено)
* Указать broadcast адрес для каждой подсети (исполнено)
* Проверить нет ли ошибок при разбиении (исполнено)

Практическая часть:
* Соединить офисы в сеть согласно схеме и настроить роутинг (исполнено)
* Все сервера и роутеры должны ходить в инет черз inetRouter ([исполнено](./0XX.md))
* Все сервера должны видеть друг друга (исполнено)

Замечание:
* у всех новых серверов отключить дефолт на нат (eth0), который вагрант поднимает для связи (как?)
* при нехватке сетевых интерфейсов добавить по несколько адресов на интерфейс (мое примечание: при исключающем маскарадинге и реализованной сетевой связности понадобятся новые подсети для выхода в интернет)

Формат сдачи ДЗ - vagrant + ansible
Критерии оценки:
* Статус "Принято" ставится, если сделана хотя бы часть.
* Задание со звездочкой - выполнить всё.

## Теоретическая часть

### Найти свободные подсети

[Табличный отчет](./001_ipcheck/table.md)


Сегмент сети | его часть | наименование | число IP-адресов
--- | --- | --- | ---
Сеть office1 | 192.168.2.0/26 | dev | 64 
Сеть office1 | 192.168.2.64/26 | test servers | 64 
Сеть office1 | 192.168.2.128/26 | managers | 64 
Сеть office1 | 192.168.2.192/26 | office hardware | 64 
Сеть office2 | 192.168.1.0/25 | dev | 128 
Сеть office2 | 192.168.1.128/26 | test servers | 64 
Сеть office2 | 192.168.1.192/26 | office hardware | 64 
Сеть central | 192.168.0.16/28 | undefined | 16 
Сеть central | 192.168.0.128/25 | undefined | 128 
Сеть central | 192.168.0.48/28 | undefined | 16 
Сеть central | 192.168.0.0/28 | directors | 16 
Сеть central | 192.168.0.32/28 | office hardware | 16 
Сеть central | 192.168.0.64/26 | wifi | 64 


[Скрипт](./001_ipcheck/app.py)

<details><summary>см. Скрипт</summary>

```python3
#  pip3 install ipaddress
import ipaddress
import sys
import os

if __name__ == '__main__':
    # python3 ./026/001_ipcheck/app.py > ./026/001_ipcheck/report.txt
    # python3 ./026/001_ipcheck/app.py md > ./026/001_ipcheck/table.md
    architecture = {
        'Сеть office1': {
            '192.168.2.0/26': 'dev',
            '192.168.2.64/26': 'test servers',
            '192.168.2.128/26': 'managers',
            '192.168.2.192/26': 'office hardware'},
        'Сеть office2': {
            '192.168.1.0/25': 'dev',
            '192.168.1.128/26': 'test servers',
            '192.168.1.192/26': 'office hardware'},
        'Сеть central': {
            '192.168.0.0/28': 'directors',
            '192.168.0.32/28': 'office hardware',
            '192.168.0.64/26': 'wifi'
        }
    }
    # nw = ipaddress.ip_network('192.168.0.128/25')
    # print(nw.network_address)
    # for h in nw.hosts():
    #     print(h)
    # print(nw.broadcast_address)
    # print(nw.num_addresses)
    # print(len(set(nw.hosts())))
    # print(pow(2,32-25))
    # exit(0)
    networks = dict()
    for segment_name, subnetworks in architecture.items():
        networks[segment_name] = dict()
        for subnetwork_ip, subnetwork_name in subnetworks.items():
            subnetwork_obj = ipaddress.ip_network(subnetwork_ip)

            global_network_ip_parent = '.'.join([x for x in subnetwork_ip.split('.')[:3]])
            global_network_ip = global_network_ip_parent + '.0/24'

            networks[segment_name]['global_network_ip_parent'] = global_network_ip_parent
            networks[segment_name]['global_network_ip'] = global_network_ip

            global_network_obj = ipaddress.ip_network(global_network_ip)
            global_network_ip_addresses = set(global_network_obj.hosts())
            global_network_ip_addresses.add(global_network_obj.network_address)
            global_network_ip_addresses.add(global_network_obj.broadcast_address)

            networks[segment_name]['candidates_undefined_ip'] = global_network_ip_addresses
            break
    #
    for segment_name, subnetworks in architecture.items():
        for subnetwork_ip, subnetwork_name in subnetworks.items():

            subnetwork_obj = ipaddress.ip_network(subnetwork_ip)
            subnetwork_ip_addresses = set(subnetwork_obj.hosts())
            subnetwork_ip_addresses.add(subnetwork_obj.network_address)
            subnetwork_ip_addresses.add(subnetwork_obj.broadcast_address)

            for ip_address in subnetwork_ip_addresses:
                if ip_address in networks[segment_name]['candidates_undefined_ip']:
                    networks[segment_name]['candidates_undefined_ip'].remove(ip_address)

        networks[segment_name]['undefined_ipaddresses'] = networks[segment_name]['candidates_undefined_ip']
        del networks[segment_name]['candidates_undefined_ip']
    #
    for segment_name in networks:
        start_ipaddress_obj = None
        last_ipaddress_obj = None
        networks[segment_name]["undefined_subnetworks"] = set()

        for last_number in range(0, 256):
            current_ipaddress_obj = ipaddress.ip_address(
                networks[segment_name]['global_network_ip_parent'] + '.' + str(last_number))
            if start_ipaddress_obj is None and current_ipaddress_obj in networks[segment_name]['undefined_ipaddresses']:
                start_ipaddress_obj = current_ipaddress_obj
                last_ipaddress_obj = current_ipaddress_obj
            if start_ipaddress_obj and current_ipaddress_obj in networks[segment_name]['undefined_ipaddresses']:
                last_ipaddress_obj = current_ipaddress_obj
            if current_ipaddress_obj not in networks[segment_name]['undefined_ipaddresses'] and start_ipaddress_obj:
                address_range = ipaddress.summarize_address_range(start_ipaddress_obj, last_ipaddress_obj)

                for undefined_subnetwork in address_range:
                    networks[segment_name]["undefined_subnetworks"].add(undefined_subnetwork)

                start_ipaddress_obj = None
                last_ipaddress_obj = None

        if start_ipaddress_obj and last_ipaddress_obj:
            address_range = ipaddress.summarize_address_range(start_ipaddress_obj, last_ipaddress_obj)
            for undefined_subnetwork in address_range:
                networks[segment_name]["undefined_subnetworks"].add(undefined_subnetwork)

        for undefined_nw_ip in networks[segment_name]["undefined_subnetworks"]:
            networks[segment_name][str(undefined_nw_ip)] = 'undefined'
        for nw_ip, nw_name in architecture[segment_name].items():
            networks[segment_name][nw_ip] = nw_name
    #     # del networks[network_segment_name]["undefined_subnetworks"]
    #     # del networks[network_segment_name]["undefined_subnet_hosts"]

    if len(sys.argv) == 1:
        print(
            (' '.join([a for a in sys.argv])).replace(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), '.'))
        print()
        import pprint

        pprint.pprint(networks)
        #

        for network in networks:
            for k in (
                    'global_network_ip',
                    "undefined_ipaddresses",
                    "undefined_subnetworks",
                    "global_network_ip_parent"
            ):
                if k in networks[network]:
                    del networks[network][k]

        for network, subnetwork in networks.items():
            network_hosts = set()
            for subnetwork_ip, subnetwork_name in subnetwork.items():
                subnetwork_obj = ipaddress.ip_network(subnetwork_ip)
                subnetwork_hosts = subnetwork_obj.hosts()
                # print(subnetwork_ip)
                # print('\t', subnetwork_obj.network_address)
                network_hosts.add(subnetwork_obj.network_address)
                for h in subnetwork_hosts:
                    # print('\t', h)
                    network_hosts.add(h)
                # if subnetwork_obj.broadcast_address not in network_hosts:
                #     print('\t', subnetwork_obj.broadcast_address)
                network_hosts.add(subnetwork_obj.broadcast_address)
                # print()
            if len(network_hosts) != 256:
                print(f'Network {network} has {len(network_hosts)}, it is not 256 subnetworks distribution')

    if len(sys.argv) == 2 and sys.argv[1] == 'md':
        for network in networks:
            for k in (
                    'global_network_ip',
                    "undefined_ipaddresses",
                    "undefined_subnetworks",
                    "global_network_ip_parent"
            ):
                if k in networks[network]:
                    del networks[network][k]

        print(f'Сегмент сети | его часть | наименование | число IP-адресов')
        print(f'--- | --- | --- | ---')
        for network_name, subnetwork in networks.items():
            for subnetwork_ip, subnetwork_name in subnetwork.items():
                network = ipaddress.ip_network(subnetwork_ip)
                hosts = set(network.hosts())
                hosts.add(network.network_address)
                hosts.add(network.broadcast_address)
                print(
                    f'{network_name} | {subnetwork_ip} | {subnetwork_name} | {len(hosts)} '
                )

    for network in networks:
        for k in (
                'global_network_ip',
                "undefined_ipaddresses",
                "undefined_subnetworks",
                "global_network_ip_parent"
        ):
            if k in networks[network]:
                del networks[network][k]
    import json

    for d in (os.path.basename(os.path.dirname(__file__)), '002_ipcheck', '003_ipcheck', '004_ipcheck'):
        with open(os.path.join(os.path.dirname(os.path.dirname(__file__)), d, 'networks.py'), 'w') as f:
            f.write('networks = {}'.format(json.dumps(networks, ensure_ascii=False, indent=3)))

```

</details>


[Лог скрипта](./001_ipcheck/report.txt)

<details><summary>см. Лог скрипта</summary>

```properties
./001_ipcheck/app.py

{'Сеть central': {'192.168.0.0/28': 'directors',
                  '192.168.0.128/25': 'undefined',
                  '192.168.0.16/28': 'undefined',
                  '192.168.0.32/28': 'office hardware',
                  '192.168.0.48/28': 'undefined',
                  '192.168.0.64/26': 'wifi',
                  'global_network_ip': '192.168.0.0/24',
                  'global_network_ip_parent': '192.168.0',
                  'undefined_ipaddresses': {IPv4Address('192.168.0.16'),
                                            IPv4Address('192.168.0.17'),
                                            IPv4Address('192.168.0.18'),
                                            IPv4Address('192.168.0.19'),
                                            IPv4Address('192.168.0.20'),
                                            IPv4Address('192.168.0.21'),
                                            IPv4Address('192.168.0.22'),
                                            IPv4Address('192.168.0.23'),
                                            IPv4Address('192.168.0.24'),
                                            IPv4Address('192.168.0.25'),
                                            IPv4Address('192.168.0.26'),
                                            IPv4Address('192.168.0.27'),
                                            IPv4Address('192.168.0.28'),
                                            IPv4Address('192.168.0.29'),
                                            IPv4Address('192.168.0.30'),
                                            IPv4Address('192.168.0.31'),
                                            IPv4Address('192.168.0.48'),
                                            IPv4Address('192.168.0.49'),
                                            IPv4Address('192.168.0.50'),
                                            IPv4Address('192.168.0.51'),
                                            IPv4Address('192.168.0.52'),
                                            IPv4Address('192.168.0.53'),
                                            IPv4Address('192.168.0.54'),
                                            IPv4Address('192.168.0.55'),
                                            IPv4Address('192.168.0.56'),
                                            IPv4Address('192.168.0.57'),
                                            IPv4Address('192.168.0.58'),
                                            IPv4Address('192.168.0.59'),
                                            IPv4Address('192.168.0.60'),
                                            IPv4Address('192.168.0.61'),
                                            IPv4Address('192.168.0.62'),
                                            IPv4Address('192.168.0.63'),
                                            IPv4Address('192.168.0.128'),
                                            IPv4Address('192.168.0.129'),
                                            IPv4Address('192.168.0.130'),
                                            IPv4Address('192.168.0.131'),
                                            IPv4Address('192.168.0.132'),
                                            IPv4Address('192.168.0.133'),
                                            IPv4Address('192.168.0.134'),
                                            IPv4Address('192.168.0.135'),
                                            IPv4Address('192.168.0.136'),
                                            IPv4Address('192.168.0.137'),
                                            IPv4Address('192.168.0.138'),
                                            IPv4Address('192.168.0.139'),
                                            IPv4Address('192.168.0.140'),
                                            IPv4Address('192.168.0.141'),
                                            IPv4Address('192.168.0.142'),
                                            IPv4Address('192.168.0.143'),
                                            IPv4Address('192.168.0.144'),
                                            IPv4Address('192.168.0.145'),
                                            IPv4Address('192.168.0.146'),
                                            IPv4Address('192.168.0.147'),
                                            IPv4Address('192.168.0.148'),
                                            IPv4Address('192.168.0.149'),
                                            IPv4Address('192.168.0.150'),
                                            IPv4Address('192.168.0.151'),
                                            IPv4Address('192.168.0.152'),
                                            IPv4Address('192.168.0.153'),
                                            IPv4Address('192.168.0.154'),
                                            IPv4Address('192.168.0.155'),
                                            IPv4Address('192.168.0.156'),
                                            IPv4Address('192.168.0.157'),
                                            IPv4Address('192.168.0.158'),
                                            IPv4Address('192.168.0.159'),
                                            IPv4Address('192.168.0.160'),
                                            IPv4Address('192.168.0.161'),
                                            IPv4Address('192.168.0.162'),
                                            IPv4Address('192.168.0.163'),
                                            IPv4Address('192.168.0.164'),
                                            IPv4Address('192.168.0.165'),
                                            IPv4Address('192.168.0.166'),
                                            IPv4Address('192.168.0.167'),
                                            IPv4Address('192.168.0.168'),
                                            IPv4Address('192.168.0.169'),
                                            IPv4Address('192.168.0.170'),
                                            IPv4Address('192.168.0.171'),
                                            IPv4Address('192.168.0.172'),
                                            IPv4Address('192.168.0.173'),
                                            IPv4Address('192.168.0.174'),
                                            IPv4Address('192.168.0.175'),
                                            IPv4Address('192.168.0.176'),
                                            IPv4Address('192.168.0.177'),
                                            IPv4Address('192.168.0.178'),
                                            IPv4Address('192.168.0.179'),
                                            IPv4Address('192.168.0.180'),
                                            IPv4Address('192.168.0.181'),
                                            IPv4Address('192.168.0.182'),
                                            IPv4Address('192.168.0.183'),
                                            IPv4Address('192.168.0.184'),
                                            IPv4Address('192.168.0.185'),
                                            IPv4Address('192.168.0.186'),
                                            IPv4Address('192.168.0.187'),
                                            IPv4Address('192.168.0.188'),
                                            IPv4Address('192.168.0.189'),
                                            IPv4Address('192.168.0.190'),
                                            IPv4Address('192.168.0.191'),
                                            IPv4Address('192.168.0.192'),
                                            IPv4Address('192.168.0.193'),
                                            IPv4Address('192.168.0.194'),
                                            IPv4Address('192.168.0.195'),
                                            IPv4Address('192.168.0.196'),
                                            IPv4Address('192.168.0.197'),
                                            IPv4Address('192.168.0.198'),
                                            IPv4Address('192.168.0.199'),
                                            IPv4Address('192.168.0.200'),
                                            IPv4Address('192.168.0.201'),
                                            IPv4Address('192.168.0.202'),
                                            IPv4Address('192.168.0.203'),
                                            IPv4Address('192.168.0.204'),
                                            IPv4Address('192.168.0.205'),
                                            IPv4Address('192.168.0.206'),
                                            IPv4Address('192.168.0.207'),
                                            IPv4Address('192.168.0.208'),
                                            IPv4Address('192.168.0.209'),
                                            IPv4Address('192.168.0.210'),
                                            IPv4Address('192.168.0.211'),
                                            IPv4Address('192.168.0.212'),
                                            IPv4Address('192.168.0.213'),
                                            IPv4Address('192.168.0.214'),
                                            IPv4Address('192.168.0.215'),
                                            IPv4Address('192.168.0.216'),
                                            IPv4Address('192.168.0.217'),
                                            IPv4Address('192.168.0.218'),
                                            IPv4Address('192.168.0.219'),
                                            IPv4Address('192.168.0.220'),
                                            IPv4Address('192.168.0.221'),
                                            IPv4Address('192.168.0.222'),
                                            IPv4Address('192.168.0.223'),
                                            IPv4Address('192.168.0.224'),
                                            IPv4Address('192.168.0.225'),
                                            IPv4Address('192.168.0.226'),
                                            IPv4Address('192.168.0.227'),
                                            IPv4Address('192.168.0.228'),
                                            IPv4Address('192.168.0.229'),
                                            IPv4Address('192.168.0.230'),
                                            IPv4Address('192.168.0.231'),
                                            IPv4Address('192.168.0.232'),
                                            IPv4Address('192.168.0.233'),
                                            IPv4Address('192.168.0.234'),
                                            IPv4Address('192.168.0.235'),
                                            IPv4Address('192.168.0.236'),
                                            IPv4Address('192.168.0.237'),
                                            IPv4Address('192.168.0.238'),
                                            IPv4Address('192.168.0.239'),
                                            IPv4Address('192.168.0.240'),
                                            IPv4Address('192.168.0.241'),
                                            IPv4Address('192.168.0.242'),
                                            IPv4Address('192.168.0.243'),
                                            IPv4Address('192.168.0.244'),
                                            IPv4Address('192.168.0.245'),
                                            IPv4Address('192.168.0.246'),
                                            IPv4Address('192.168.0.247'),
                                            IPv4Address('192.168.0.248'),
                                            IPv4Address('192.168.0.249'),
                                            IPv4Address('192.168.0.250'),
                                            IPv4Address('192.168.0.251'),
                                            IPv4Address('192.168.0.252'),
                                            IPv4Address('192.168.0.253'),
                                            IPv4Address('192.168.0.254'),
                                            IPv4Address('192.168.0.255')},
                  'undefined_subnetworks': {IPv4Network('192.168.0.16/28'),
                                            IPv4Network('192.168.0.48/28'),
                                            IPv4Network('192.168.0.128/25')}},
 'Сеть office1': {'192.168.2.0/26': 'dev',
                  '192.168.2.128/26': 'managers',
                  '192.168.2.192/26': 'office hardware',
                  '192.168.2.64/26': 'test servers',
                  'global_network_ip': '192.168.2.0/24',
                  'global_network_ip_parent': '192.168.2',
                  'undefined_ipaddresses': set(),
                  'undefined_subnetworks': set()},
 'Сеть office2': {'192.168.1.0/25': 'dev',
                  '192.168.1.128/26': 'test servers',
                  '192.168.1.192/26': 'office hardware',
                  'global_network_ip': '192.168.1.0/24',
                  'global_network_ip_parent': '192.168.1',
                  'undefined_ipaddresses': set(),
                  'undefined_subnetworks': set()}}

```

</details>


### Посчитать сколько узлов в каждой подсети, включая свободные

[Табличный отчет](./002_ipcheck/table.md)


Сегмент сети | имя подсети | IP-адресация | число IP-адресов
--- | --- | --- | ---
Сеть office1 | dev | 192.168.2.0/26 | 64 
Сеть office1 | test servers | 192.168.2.64/26 | 64 
Сеть office1 | managers | 192.168.2.128/26 | 64 
Сеть office1 | office hardware | 192.168.2.192/26 | 64 
Сеть office2 | dev | 192.168.1.0/25 | 128 
Сеть office2 | test servers | 192.168.1.128/26 | 64 
Сеть office2 | office hardware | 192.168.1.192/26 | 64 
Сеть central | undefined | 192.168.0.16/28 | 16 
Сеть central | undefined | 192.168.0.128/25 | 128 
Сеть central | undefined | 192.168.0.48/28 | 16 
Сеть central | directors | 192.168.0.0/28 | 16 
Сеть central | office hardware | 192.168.0.32/28 | 16 
Сеть central | wifi | 192.168.0.64/26 | 64 


[Скрипт](./002_ipcheck/app.py)

<details><summary>см. Скрипт</summary>

```python3
from networks import networks
import ipaddress

if __name__ == '__main__':
    # python3 ./002_ipcheck/app.py > ./002_ipcheck/table.md
    hosts = dict()
    print(f'Сегмент сети | имя подсети | IP-адресация | число IP-адресов')
    print(f'--- | --- | --- | ---')
    for segment_name, subnetworks in networks.items():
        for subnetwork_ip, subnetwork_name in subnetworks.items():
            subnetwork_obj = ipaddress.ip_network(subnetwork_ip)
            print(f'{segment_name} | {subnetwork_name} | {subnetwork_ip} | {subnetwork_obj.num_addresses} ')

```

</details>


### Указать broadcast адрес для каждой подсети

[Табличный отчет](./003_ipcheck/table.md)


Сегмент сети | имя подсети | IP-адресация | broadcast-IP
--- | --- | --- | ---
Сеть office1 | dev | 192.168.2.0/26 | 192.168.2.63 
Сеть office1 | test servers | 192.168.2.64/26 | 192.168.2.127 
Сеть office1 | managers | 192.168.2.128/26 | 192.168.2.191 
Сеть office1 | office hardware | 192.168.2.192/26 | 192.168.2.255 
Сеть office2 | dev | 192.168.1.0/25 | 192.168.1.127 
Сеть office2 | test servers | 192.168.1.128/26 | 192.168.1.191 
Сеть office2 | office hardware | 192.168.1.192/26 | 192.168.1.255 
Сеть central | undefined | 192.168.0.16/28 | 192.168.0.31 
Сеть central | undefined | 192.168.0.128/25 | 192.168.0.255 
Сеть central | undefined | 192.168.0.48/28 | 192.168.0.63 
Сеть central | directors | 192.168.0.0/28 | 192.168.0.15 
Сеть central | office hardware | 192.168.0.32/28 | 192.168.0.47 
Сеть central | wifi | 192.168.0.64/26 | 192.168.0.127 


[Скрипт](./003_ipcheck/app.py)

<details><summary>см. Скрипт</summary>

```python3
from networks import networks
import ipaddress

if __name__ == '__main__':
    # python3 ./003_ipcheck/app.py > ./003_ipcheck/table.md
    hosts = dict()
    print(f'Сегмент сети | имя подсети | IP-адресация | broadcast-IP')
    print(f'--- | --- | --- | ---')
    for segment_name, subnetworks in networks.items():
        for subnetwork_ip, subnetwork_name in subnetworks.items():
            subnetwork_obj = ipaddress.ip_network(subnetwork_ip)
            print(f'{segment_name} | {subnetwork_name} | {subnetwork_ip} | {subnetwork_obj.broadcast_address} ')

```

</details>


### Проверить нет ли ошибок при разбиении

[MD-отчет](./004_ipcheck/report.md)


Пересечения отсутствуют


[Скрипт](./004_ipcheck/app.py)

<details><summary>см. Скрипт</summary>

```python3
from networks import networks
import ipaddress
import sys

if __name__ == '__main__':

    # python3 ./004_ipcheck/app.py md > ./004_ipcheck/report.md
    # python3 ./004_ipcheck/app.py > ./004_ipcheck/report.txt

    all_ips = dict()

    for segment_name, subnetworks in networks.items():
        for subnetwork_ip, subnetwork_name in subnetworks.items():
            subnetwork_obj = ipaddress.ip_network(subnetwork_ip)
            subnetwork_ip_addresses = set(subnetwork_obj.hosts())
            subnetwork_ip_addresses.add(subnetwork_obj.network_address)
            subnetwork_ip_addresses.add(subnetwork_obj.broadcast_address)
            for ip in subnetwork_ip_addresses:
                if ip not in all_ips:
                    all_ips[ip] = set()
                all_ips[ip].add(f'{segment_name}: {subnetwork_ip} - {subnetwork_name}')

    if len(sys.argv) == 1:
        print('IP', 'входит в подсети')
        for ip in all_ips:
            print(ip, all_ips[ip])

    if len(sys.argv) == 2 and sys.argv[1] == 'md':
        intersections_of_netqorks_was_detected = False
        for ip, ip_subnetworks in filter(lambda x: len(x[1]) > 1, all_ips.items()):
            print(f'Внимание: IP {ip} входит в несколько разбиений: {ip_subnetworks}')
            intersections_of_netqorks_was_detected = True
        if not intersections_of_netqorks_was_detected:
            print(f'Пересечения отсутствуют')


```

</details>


[Лог скрипта](./004_ipcheck/report.txt)

<details><summary>см. Лог скрипта</summary>

```properties
IP входит в подсети
192.168.2.16 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.0 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.18 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.40 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.50 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.36 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.2 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.43 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.53 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.6 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.55 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.37 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.39 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.17 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.30 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.14 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.26 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.33 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.19 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.45 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.47 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.61 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.34 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.44 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.15 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.22 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.63 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.31 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.59 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.21 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.20 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.41 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.4 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.8 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.51 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.24 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.57 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.9 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.13 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.29 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.38 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.35 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.48 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.49 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.46 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.10 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.12 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.54 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.58 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.52 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.27 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.56 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.23 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.62 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.60 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.42 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.11 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.25 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.32 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.1 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.28 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.7 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.5 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.3 {'Сеть office1: 192.168.2.0/26 - dev'}
192.168.2.64 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.115 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.99 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.81 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.73 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.96 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.105 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.72 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.79 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.117 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.70 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.67 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.85 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.109 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.106 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.122 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.102 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.69 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.66 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.113 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.126 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.89 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.86 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.111 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.127 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.95 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.114 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.68 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.100 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.103 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.76 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.91 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.90 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.112 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.82 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.77 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.87 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.108 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.119 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.98 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.118 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.71 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.83 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.88 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.107 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.75 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.80 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.93 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.123 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.125 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.65 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.120 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.101 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.97 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.110 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.74 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.121 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.92 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.124 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.94 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.116 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.78 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.104 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.84 {'Сеть office1: 192.168.2.64/26 - test servers'}
192.168.2.129 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.137 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.149 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.163 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.182 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.130 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.142 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.188 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.135 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.144 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.152 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.175 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.177 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.150 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.173 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.170 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.134 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.136 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.167 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.140 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.148 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.160 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.166 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.138 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.169 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.131 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.128 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.174 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.190 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.145 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.157 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.153 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.186 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.159 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.143 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.141 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.146 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.162 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.158 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.184 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.181 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.189 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.172 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.171 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.191 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.178 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.154 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.164 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.183 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.168 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.161 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.176 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.185 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.165 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.179 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.139 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.133 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.147 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.156 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.155 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.180 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.187 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.132 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.151 {'Сеть office1: 192.168.2.128/26 - managers'}
192.168.2.198 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.209 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.211 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.206 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.238 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.241 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.240 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.192 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.249 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.210 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.214 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.223 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.245 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.233 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.227 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.225 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.254 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.218 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.203 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.235 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.216 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.255 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.201 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.221 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.248 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.196 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.243 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.226 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.222 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.232 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.199 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.244 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.234 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.252 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.224 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.247 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.251 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.239 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.215 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.193 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.220 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.205 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.213 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.229 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.236 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.237 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.231 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.194 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.208 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.212 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.242 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.250 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.204 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.253 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.219 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.228 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.197 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.217 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.195 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.202 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.200 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.230 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.207 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.2.246 {'Сеть office1: 192.168.2.192/26 - office hardware'}
192.168.1.126 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.57 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.74 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.29 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.4 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.10 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.19 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.38 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.110 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.87 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.23 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.107 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.103 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.61 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.65 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.27 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.78 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.59 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.50 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.119 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.43 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.51 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.101 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.46 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.28 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.60 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.71 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.44 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.111 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.42 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.102 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.11 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.22 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.49 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.6 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.91 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.88 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.122 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.97 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.18 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.62 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.31 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.84 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.15 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.39 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.95 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.98 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.100 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.14 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.21 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.54 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.69 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.26 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.72 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.83 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.105 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.66 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.58 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.67 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.48 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.118 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.2 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.109 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.40 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.33 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.5 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.80 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.113 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.64 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.114 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.17 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.30 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.0 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.73 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.117 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.8 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.121 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.92 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.24 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.112 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.99 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.93 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.55 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.56 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.68 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.53 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.89 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.12 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.90 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.79 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.124 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.3 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.16 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.106 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.116 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.32 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.37 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.82 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.120 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.81 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.7 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.85 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.96 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.25 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.36 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.41 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.125 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.123 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.34 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.115 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.52 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.104 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.1 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.127 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.35 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.76 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.13 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.75 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.94 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.9 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.45 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.86 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.47 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.63 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.70 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.20 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.77 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.108 {'Сеть office2: 192.168.1.0/25 - dev'}
192.168.1.167 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.133 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.132 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.182 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.188 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.172 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.186 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.176 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.137 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.168 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.147 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.150 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.175 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.189 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.160 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.131 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.190 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.154 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.130 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.149 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.135 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.142 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.151 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.164 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.162 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.158 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.129 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.144 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.155 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.134 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.143 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.161 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.165 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.185 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.191 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.156 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.166 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.178 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.183 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.184 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.136 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.159 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.174 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.173 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.140 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.180 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.187 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.152 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.148 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.141 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.169 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.181 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.139 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.146 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.170 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.157 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.171 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.145 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.177 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.179 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.138 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.163 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.128 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.153 {'Сеть office2: 192.168.1.128/26 - test servers'}
192.168.1.205 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.219 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.255 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.247 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.206 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.230 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.227 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.210 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.232 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.199 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.208 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.240 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.254 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.234 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.211 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.229 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.218 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.252 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.249 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.237 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.243 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.226 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.217 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.224 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.241 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.212 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.235 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.216 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.225 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.215 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.220 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.197 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.222 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.207 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.244 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.223 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.245 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.213 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.196 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.236 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.231 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.200 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.214 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.238 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.251 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.253 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.221 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.201 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.204 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.198 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.202 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.239 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.194 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.233 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.193 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.195 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.203 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.228 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.250 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.246 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.242 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.209 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.192 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.1.248 {'Сеть office2: 192.168.1.192/26 - office hardware'}
192.168.0.16 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.19 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.31 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.21 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.28 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.30 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.17 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.27 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.25 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.29 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.23 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.18 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.26 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.20 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.24 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.22 {'Сеть central: 192.168.0.16/28 - undefined'}
192.168.0.175 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.173 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.132 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.232 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.247 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.201 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.141 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.239 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.161 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.230 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.240 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.130 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.145 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.158 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.241 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.213 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.134 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.218 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.208 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.217 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.142 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.167 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.249 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.177 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.228 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.143 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.222 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.188 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.160 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.237 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.176 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.242 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.207 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.135 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.221 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.133 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.229 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.224 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.234 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.226 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.171 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.195 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.204 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.200 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.152 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.209 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.198 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.236 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.233 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.184 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.154 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.137 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.153 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.246 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.202 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.245 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.178 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.140 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.166 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.196 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.136 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.146 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.223 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.214 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.253 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.170 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.220 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.182 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.235 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.244 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.197 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.168 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.255 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.194 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.219 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.165 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.206 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.149 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.162 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.128 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.147 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.203 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.144 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.231 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.190 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.179 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.180 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.212 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.215 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.172 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.216 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.199 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.129 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.191 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.254 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.174 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.192 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.248 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.250 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.186 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.252 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.138 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.155 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.225 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.163 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.151 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.189 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.205 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.193 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.251 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.238 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.139 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.187 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.164 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.131 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.159 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.210 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.148 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.157 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.183 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.243 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.169 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.181 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.185 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.211 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.156 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.227 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.150 {'Сеть central: 192.168.0.128/25 - undefined'}
192.168.0.60 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.53 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.57 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.55 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.48 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.51 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.50 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.54 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.62 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.58 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.63 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.56 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.59 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.52 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.61 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.49 {'Сеть central: 192.168.0.48/28 - undefined'}
192.168.0.13 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.10 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.12 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.5 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.14 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.9 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.3 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.1 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.0 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.8 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.2 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.11 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.7 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.15 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.6 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.4 {'Сеть central: 192.168.0.0/28 - directors'}
192.168.0.42 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.34 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.32 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.33 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.36 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.47 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.39 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.43 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.45 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.37 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.40 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.38 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.44 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.46 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.35 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.41 {'Сеть central: 192.168.0.32/28 - office hardware'}
192.168.0.116 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.71 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.118 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.120 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.69 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.106 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.80 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.95 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.82 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.86 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.104 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.112 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.111 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.92 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.83 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.97 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.70 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.78 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.77 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.110 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.119 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.84 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.96 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.101 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.102 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.105 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.64 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.65 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.75 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.87 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.108 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.117 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.67 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.113 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.126 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.89 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.81 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.88 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.127 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.93 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.98 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.66 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.103 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.115 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.124 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.72 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.100 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.123 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.74 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.85 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.68 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.109 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.79 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.73 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.125 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.94 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.99 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.90 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.91 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.122 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.114 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.76 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.107 {'Сеть central: 192.168.0.64/26 - wifi'}
192.168.0.121 {'Сеть central: 192.168.0.64/26 - wifi'}

```

</details>


## Практическая часть

### Соединить офисы в сеть согласно схеме и настроить роутинг

В исходный [Vagrantfile](./erlong15_vm/Vagrantfile) внес правки

<details><summary>см. Vagrantfile</summary>

```properties
# -*- mode: ruby -*-
# vim: set ft=ruby :
# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
:inetRouter => {
        :box_name => "centos/7",
        #:public => {:ip => '10.10.10.1', :adapter => 1},
        :net => [
                   {ip: '192.168.255.1', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "router-net"},
                ]
  },
  :centralRouter => {
        :box_name => "centos/7",
        :net => [
                   {ip: '192.168.255.2', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "router-net"},
                   {ip: '192.168.0.1', adapter: 3, netmask: "255.255.255.240", virtualbox__intnet: "dir-net"},
                   {ip: '192.168.0.33', adapter: 4, netmask: "255.255.255.240", virtualbox__intnet: "hw-net"},
                   {ip: '192.168.0.65', adapter: 5, netmask: "255.255.255.192", virtualbox__intnet: "mgt-net"},
                ]
  },
  
  :centralServer => {
        :box_name => "centos/7",
        :net => [
                   {ip: '192.168.0.2', adapter: 2, netmask: "255.255.255.240", virtualbox__intnet: "dir-net"},
                   {adapter: 3, auto_config: false, virtualbox__intnet: true},
                   {adapter: 4, auto_config: false, virtualbox__intnet: true},
                ]
  },
  
}

Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|

    config.vm.define boxname do |box|

        box.vm.box = boxconfig[:box_name]
        box.vm.host_name = boxname.to_s

        box.vm.provision "shell", run: "always", inline: <<-SHELL
            yum install -y traceroute
            yum install -y nano
        SHELL

        config.vm.provider "virtualbox" do |v|
            v.memory = 256
            v.cpus = 1
        end

        boxconfig[:net].each do |ipconf|
          box.vm.network "private_network", ipconf
        end
        
        if boxconfig.key?(:public)
          box.vm.network "public_network", boxconfig[:public]
        end

        box.vm.provision "shell", inline: <<-SHELL
          mkdir -p ~root/.ssh
                cp ~vagrant/.ssh/auth* ~root/.ssh
        SHELL
        
        case boxname.to_s
        when "inetRouter"
          box.vm.provision "shell", run: "always", inline: <<-SHELL
            sysctl net.ipv4.conf.all.forwarding=1
            iptables -t nat -A POSTROUTING ! -d 192.168.0.0/16 -o eth0 -j MASQUERADE
            SHELL
        when "centralRouter"
          box.vm.provision "shell", run: "always", inline: <<-SHELL
            sysctl net.ipv4.conf.all.forwarding=1
            echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 
            echo "GATEWAY=192.168.255.1" >> /etc/sysconfig/network-scripts/ifcfg-eth1
            systemctl restart network
            SHELL
        when "centralServer"
          box.vm.provision "shell", run: "always", inline: <<-SHELL
            echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 
            echo "GATEWAY=192.168.0.1" >> /etc/sysconfig/network-scripts/ifcfg-eth1
            systemctl restart network
            SHELL
        end

      end

  end
  
  
end


```

</details>


т.к. 

```text
  Bringing machine 'office2Server' up with 'virtualbox' provider...
  ==> inetRouter: Box 'centos/6' could not be found. Attempting to find and install...
      inetRouter: Box Provider: virtualbox
      inetRouter: Box Version: >= 0
  The box 'centos/6' could not be found or
  could not be accessed in the remote catalog. If this is a private
  box on HashiCorp's Vagrant Cloud, please verify you're logged in via
  `vagrant login`. Also, please double-check the name. The expanded
  URL and error message are shown below:
  
  URL: ["https://vagrantcloud.com/centos/6"]
  Error: The requested URL returned error: 404
```


Реализованная схема подключения описана в [Vagrantfile](./vm/Vagrantfile)

<details><summary>см. Vagrantfile</summary>

```properties
# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
    :inetRouter => {
        :box_name => "centos/7",
        #:public => {:ip => '10.10.10.1', :adapter => 1},
        :net => [
            {ip: '192.168.255.1',   adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "central-router-net"},
        ]
    },
    :centralRouter => {
        :box_name => "centos/7",
        :net => [
            {ip: '192.168.255.2',   adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "central-router-net"},
            {ip: '192.168.0.1',     adapter: 3, netmask: "255.255.255.240", virtualbox__intnet: "central-dir-net"},
            {ip: '192.168.0.33',    adapter: 4, netmask: "255.255.255.240", virtualbox__intnet: "central-hw-net"},
            {ip: '192.168.0.65',    adapter: 5, netmask: "255.255.255.192", virtualbox__intnet: "central-mgt-net"},
        ]
    },

    :centralServer => {
        :box_name => "centos/7",
        :net => [
            {ip: '192.168.0.2',     adapter: 2, netmask: "255.255.255.240", virtualbox__intnet: "central-dir-net"},
        ]
    },

    :office1Router => {
        :box_name => "centos/7",
        :net => [
            {ip: '192.168.0.34',    adapter: 2, netmask: "255.255.255.240", virtualbox__intnet: "central-hw-net"},
            {ip: '192.168.2.1',     adapter: 3, netmask: "255.255.255.192", virtualbox__intnet: "office-1-dev-net"},
            {ip: '192.168.2.65',    adapter: 4, netmask: "255.255.255.192", virtualbox__intnet: "office-1-test-servers-net"},
            {ip: '192.168.2.129',   adapter: 5, netmask: "255.255.255.192", virtualbox__intnet: "office-1-managers-net"},
            {ip: '192.168.2.193',   adapter: 6, netmask: "255.255.255.192", virtualbox__intnet: "office-1-hardware-net"},
        ]
    },

    :office1Server => {
        :box_name => "centos/7",
        :net => [
            {ip: '192.168.2.194',   adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "office-1-hardware-net"},
        ]
    },

    :office2Router => {
        :box_name => "centos/7",
        :net => [
            {ip: '192.168.0.35',    adapter: 2, netmask: "255.255.255.240", virtualbox__intnet: "central-hw-net"},
            {ip: '192.168.1.1',     adapter: 3, netmask: "255.255.255.128", virtualbox__intnet: "office-2-dev-net"},
            {ip: '192.168.1.129',   adapter: 4, netmask: "255.255.255.192", virtualbox__intnet: "office-2-test-servers-net"},
            {ip: '192.168.1.193',   adapter: 5, netmask: "255.255.255.192", virtualbox__intnet: "office-2-hardware-net"},
        ]
    },

    :office2Server => {
        :box_name => "centos/7",
        :net => [
            {ip: '192.168.1.194',   adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "office-2-hardware-net"},
        ]
    },
}

Vagrant.configure("2") do |config|

    MACHINES.each do |boxname, boxconfig|

        config.vm.define boxname do |box|
            box.vm.provision "shell", run: "always", inline: <<-SHELL

                systemctl stop NetworkManager
                systemctl disable NetworkManager
                systemctl enable network.service
                systemctl start network.service

                yum install -y traceroute
                # yum install -y nano
            SHELL

            config.vm.provider "virtualbox" do |v|
                v.memory = 256
                v.cpus = 1
            end

            box.vm.box = boxconfig[:box_name]
            box.vm.host_name = boxname.to_s

            boxconfig[:net].each do |ipconf|
                box.vm.network "private_network", ipconf
            end

            if boxconfig.key?(:public)
                box.vm.network "public_network", boxconfig[:public]
            end

            box.vm.provision "shell", inline: <<-SHELL
                mkdir -p ~root/.ssh
                cp ~vagrant/.ssh/auth* ~root/.ssh
            SHELL

        end
    end
end


```

</details>


![](./scheme.png)

Задействовал https://github.com/haidaraM/vagrant-to-ansible-inventory

[импорт vagrant хостов в хосты ansible-inventory](./vm/v2a.py)

<details><summary>см. импорт vagrant хостов в хосты ansible-inventory</summary>

```python3
from vagranttoansible import vagranttoansible

# python3 v2a.py -o ../ansible/inventories/hosts
# vagranttoansible.DEFAULT_LINE_FORMAT = "[{host}]\n" \
#                                        "{host} " \
#                                        "ansible_user={user} " \
#                                        "ansible_host={ssh_hostname} " \
#                                        "ansible_port={ssh_port} " \
#                                        "ansible_private_key_file={private_file}"
vagranttoansible.cli()

```

</details>


```shell
pwd
  /home/b/pycharm_projects_2021_2/otus_linux/026/vm

python3 v2a.py -o ../ansible/inventories/hosts
```

В ДЗ я применил хранение настроек в переменной, для однотипной задачи прописывания шлюзов на интерфейсах

[Параметры шлюзов](./ansible/roles/routing/vars/main.yml)

<details><summary>см. Параметры шлюзов</summary>

```properties
networks_hosts:
  inetRouter:
    default_default_gateway:
      interface: ''
      gw: ''
    routes:
      - { interface: eth1, nw: 192.168.0.0/16, via: 192.168.255.2 }
  centralRouter:
    default_gateway:
      interface: eth1
      gw: 192.168.255.1
    routes:
      - { interface: eth3, nw: 192.168.2.0/24, via: 192.168.0.34 }
      - { interface: eth3, nw: 192.168.1.0/24, via: 192.168.0.35 }
  centralServer:
    default_gateway:
      interface: eth1
      gw: 192.168.0.1
    routes: []
  office1Router:
    default_gateway:
      interface: eth1
      gw: 192.168.0.33
    routes: []
  office1Server:
    default_gateway:
      interface: eth1
      gw: 192.168.2.193
    routes: []
  office2Router:
    default_gateway:
      interface: eth1
      gw: 192.168.0.33
    routes: []
  office2Server:
    default_gateway:
      interface: eth1
      gw: 192.168.1.193
    routes: []

```

</details>


Задача, использующая специальную ansible-переменную `inventory_hostname`, "знающую" для какого инвентори-хоста работает в данный момент плейбук.

[Задача](./ansible/roles/routing/tasks/main.yml)

<details><summary>см. Задача</summary>

```properties
---
- name: /etc/sysconfig/network | "NOZEROCONF=yes" | I don't want 169.254.0.0/16 network at default
  shell: |
    echo "NOZEROCONF=yes" > /etc/sysconfig/network
    exit 0
  ignore_errors: false

# /etc/sysconfig/static-routes - Legacy static-route support not available: /sbin/route not found
- name: /etc/sysconfig/network-scripts/route-* | delete route files
  shell: |
    rm -f /etc/sysconfig/network-scripts/route-*
    exit 0
  ignore_errors: false

- name: /etc/sysconfig/network-scripts/route-* | create needed route files
  shell: |
    touch /etc/sysconfig/network-scripts/route-{{ item['interface'] }}
    exit 0
  loop: "{{ networks_hosts[inventory_hostname]['routes'] }}"
  ignore_errors: false

- name: /etc/sysconfig/network-scripts/route-* | set route
  lineinfile:
    insertafter: EOF
    dest: /etc/sysconfig/network-scripts/route-{{ item.interface }}
    line: "{{ item.nw }} via {{ item.via }}"
  loop: "{{ networks_hosts[inventory_hostname]['routes'] }}"
  notify:
    - systemctl-restart-network

- name: /etc/sysconfig/network-scripts/ifcfg-ethX | content
  command: /bin/cat /etc/sysconfig/network-scripts/ifcfg-{{ default_gateway['interface'] }}
  when: (default_gateway['interface'] is defined and default_gateway['interface'] != '') and not (default_gateway['interface'] == None)
  vars:
    default_gateway: "{{ networks_hosts[inventory_hostname]['default_gateway'] }}"
  register: ifcfg_ethX_content
  tags:
    - deploy
    - ifcfg-ethX-default-gw

- name: /etc/sysconfig/network-scripts/ifcfg-ethX | GATEWAY=<ip> | setup if did not set
  lineinfile:
    insertafter: EOF
    dest: /etc/sysconfig/network-scripts/ifcfg-{{ default_gateway['interface'] }}
    line: "GATEWAY={{ default_gateway['gw'] }}"
  when: (default_gateway['interface'] is defined and default_gateway['interface'] != '') and not (default_gateway['interface'] == None) and not ( ifcfg_ethX_content is search("GATEWAY=") )
  vars:
    default_gateway: "{{ networks_hosts[inventory_hostname]['default_gateway'] }}"
  notify:
    - systemctl-restart-network
  tags:
    - deploy
    - ifcfg-ethX-default-gw

- name: /etc/sysconfig/network-scripts/ifcfg-ethX | GATEWAY=<ip> | replace
  replace:
    path:  /etc/sysconfig/network-scripts/ifcfg-{{ default_gateway['interface'] }}
    regexp: 'GATEWAY=[\w\.]*'
    replace: "GATEWAY={{ default_gateway['gw'] }}"
  when: (default_gateway['interface'] is defined and default_gateway['interface'] != '') and not (default_gateway['interface'] == None) and ( ifcfg_ethX_content is search("GATEWAY=") )
  vars:
    default_gateway: "{{ networks_hosts[inventory_hostname]['default_gateway'] }}"
  notify:
    - systemctl-restart-network
  tags:
    - deploy
    - ifcfg-ethX-default-gw
```

</details>


Аналогично в рамках демонстрации работоспособности применит и `loop` и `inventory_hostname` 

[Задача](./ansible/roles/test_001_network_connectivity/tasks/main.yml)

<details><summary>см. Задача</summary>

```properties
---
- name: test | demostration
  debug:
    msg: "I am {{ inventory_hostname }}"

- name: test | traceroute foreign host
  shell: traceroute {{ item }}
  loop: "{{ to }}"
  ignore_errors: false
  register: traceroute_content

#- name: test | traceroute foreign host
#  debug:
#    msg: "{{ traceroute_content['results']}}"

- name: test | traceroute foreign host
  local_action:
    module: lineinfile
    dest: "../../files/tests-reports/{{ inventory_hostname }} - {{ item['cmd'] }}.txt"
    line: "{{ item['stdout'] }}"
    create: yes
  loop: "{{ traceroute_content['results'] }}"
  changed_when: true
```

</details>


Я отказался от NetworkManager в пользу классики, так как с ним у меня возникли непонятки по маршрутам в NAT

```shell
systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl enable network.service
systemctl start network.service
```

### Ansible

```shell
ansible-playbook playbooks/forwarding-on.yml > ../files/ansible-running/forwarding-on.txt
```
[forwarding-on.txt](./026/files/ansible-running/forwarding-on.txt)

<details><summary>см. forwarding-on.txt</summary>

```properties

PLAY [Playbook of "net.ipv4.conf.all.forwarding = 1"] **************************

TASK [Gathering Facts] *********************************************************
ok: [inetRouter]
ok: [office1Router]
ok: [centralRouter]
ok: [office2Router]

TASK [../roles/forwarding-on : /etc/sysctl.conf | content] *********************
changed: [inetRouter]
changed: [office1Router]
changed: [centralRouter]
changed: [office2Router]

TASK [../roles/forwarding-on : /etc/sysctl.conf | forwarding = 1 | if does not exist] ***
changed: [centralRouter]
changed: [office1Router]
changed: [inetRouter]
changed: [office2Router]

TASK [../roles/forwarding-on : /etc/sysctl.conf | forwarding = 1 | if forwarding = 0] ***
ok: [inetRouter]
ok: [office2Router]
ok: [centralRouter]
ok: [office1Router]

RUNNING HANDLER [../roles/forwarding-on : systemctl-restart-network] ***********
changed: [inetRouter]
changed: [office2Router]
changed: [centralRouter]
changed: [office1Router]

PLAY RECAP *********************************************************************
centralRouter              : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
inetRouter                 : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
office1Router              : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
office2Router              : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


```

</details>


```shell
ansible-playbook playbooks/routing.yml > ../files/ansible-running/routing.txt
```
[routing.txt](./files/ansible-running/routing.txt)

<details><summary>см. routing.txt</summary>

```properties

PLAY [Playbook of ethX gateway config] *****************************************

TASK [Gathering Facts] *********************************************************
ok: [inetRouter]
ok: [centralServer]
ok: [centralRouter]
ok: [office1Server]
ok: [office1Router]
ok: [office2Server]
ok: [office2Router]

TASK [../roles/routing : /etc/sysconfig/network | "NOZEROCONF=yes" | I don't want 169.254.0.0/16 network at default] ***
changed: [office1Server]
changed: [centralServer]
changed: [centralRouter]
changed: [office1Router]
changed: [inetRouter]
changed: [office2Server]
changed: [office2Router]

TASK [../roles/routing : /etc/sysconfig/network-scripts/route-* | delete route files] ***
changed: [centralRouter]
changed: [office1Server]
changed: [inetRouter]
changed: [office1Router]
changed: [centralServer]
changed: [office2Router]
changed: [office2Server]

TASK [../roles/routing : /etc/sysconfig/network-scripts/route-* | create needed route files] ***
changed: [inetRouter] => (item={'interface': 'eth1', 'nw': '192.168.0.0/16', 'via': '192.168.255.2'})
changed: [centralRouter] => (item={'interface': 'eth3', 'nw': '192.168.2.0/24', 'via': '192.168.0.34'})
changed: [centralRouter] => (item={'interface': 'eth3', 'nw': '192.168.1.0/24', 'via': '192.168.0.35'})

TASK [../roles/routing : /etc/sysconfig/network-scripts/route-* | set route] ***
changed: [inetRouter] => (item={'interface': 'eth1', 'nw': '192.168.0.0/16', 'via': '192.168.255.2'})
changed: [centralRouter] => (item={'interface': 'eth3', 'nw': '192.168.2.0/24', 'via': '192.168.0.34'})
changed: [centralRouter] => (item={'interface': 'eth3', 'nw': '192.168.1.0/24', 'via': '192.168.0.35'})

TASK [../roles/routing : /etc/sysconfig/network-scripts/ifcfg-ethX | content] ***
fatal: [inetRouter]: FAILED! => {"msg": "The conditional check '(default_gateway['interface'] is defined and default_gateway['interface'] != '') and not (default_gateway['interface'] == None)' failed. The error was: error while evaluating conditional ((default_gateway['interface'] is defined and default_gateway['interface'] != '') and not (default_gateway['interface'] == None)): {{ networks_hosts[inventory_hostname]['default_gateway'] }}: 'dict object' has no attribute 'default_gateway'\n\nThe error appears to be in '/home/b/pycharm_projects_2021_2/otus_linux/026/ansible/roles/routing/tasks/main.yml': line 31, column 3, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n\n- name: /etc/sysconfig/network-scripts/ifcfg-ethX | content\n  ^ here\n"}
changed: [centralRouter]
changed: [office2Router]
changed: [office1Router]
changed: [centralServer]
changed: [office1Server]
changed: [office2Server]

TASK [../roles/routing : /etc/sysconfig/network-scripts/ifcfg-ethX | GATEWAY=<ip> | setup if did not set] ***
skipping: [centralRouter]
skipping: [centralServer]
skipping: [office1Router]
skipping: [office1Server]
skipping: [office2Router]
skipping: [office2Server]

TASK [../roles/routing : /etc/sysconfig/network-scripts/ifcfg-ethX | GATEWAY=<ip> | replace] ***
ok: [office1Server]
ok: [office2Router]
ok: [centralRouter]
ok: [office1Router]
ok: [centralServer]
changed: [office2Server]

RUNNING HANDLER [../roles/routing : systemctl-restart-network] *****************
changed: [office2Server]
changed: [centralRouter]

PLAY RECAP *********************************************************************
centralRouter              : ok=8    changed=6    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
centralServer              : ok=5    changed=3    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   
inetRouter                 : ok=5    changed=4    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
office1Router              : ok=5    changed=3    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   
office1Server              : ok=5    changed=3    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   
office2Router              : ok=5    changed=3    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   
office2Server              : ok=6    changed=5    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   


```

</details>


```shell
ansible-playbook playbooks/internet-router.yml > ../files/ansible-running/internet-router.txt
```
[internet-router.txt](./files/ansible-running/internet-router.txt)

<details><summary>см. internet-router.txt</summary>

```properties

PLAY [Playbook of internet-node server initialization] *************************

TASK [Gathering Facts] *********************************************************
ok: [inetRouter]

TASK [../roles/internet-router : iptables masquerading] ************************
changed: [inetRouter]

PLAY RECAP *********************************************************************
inetRouter                 : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


```

</details>


```shell
ansible-playbook playbooks/network-hosts.yml > ../files/ansible-running/network-hosts.txt
```
[network-hosts.txt](./files/ansible-running/network-hosts.txt)

<details><summary>см. network-hosts.txt</summary>

```properties

PLAY [Playbook of network hosts initialization] ********************************

TASK [Gathering Facts] *********************************************************
ok: [centralRouter]
ok: [centralServer]
ok: [office1Router]
ok: [inetRouter]
ok: [office1Server]
ok: [office2Server]
ok: [office2Router]

TASK [../roles/network-hosts : /etc/sysconfig/network-scripts/ifcfg-eth0 | content] ***
changed: [office1Router]
changed: [inetRouter]
changed: [office1Server]
changed: [centralServer]
changed: [centralRouter]
changed: [office2Router]
changed: [office2Server]

TASK [../roles/network-hosts : /etc/sysconfig/network-scripts/ifcfg-eth0 | DEFROUTE=no | if did not set] ***
changed: [inetRouter]
changed: [office1Router]
changed: [office1Server]
changed: [centralServer]
changed: [centralRouter]
changed: [office2Router]
changed: [office2Server]

TASK [../roles/network-hosts : /etc/sysconfig/network-scripts/ifcfg-eth0 | DEFROUTE=no | if "yes"] ***
skipping: [inetRouter]
skipping: [centralRouter]
skipping: [centralServer]
skipping: [office1Router]
skipping: [office1Server]
skipping: [office2Router]
skipping: [office2Server]

TASK [../roles/network-hosts : /etc/sysconfig/network-scripts/ifcfg-eth1 | content] ***
changed: [inetRouter]
changed: [office1Router]
changed: [centralServer]
changed: [centralRouter]
changed: [office1Server]
changed: [office2Server]
changed: [office2Router]

TASK [../roles/network-hosts : /etc/sysconfig/network-scripts/ifcfg-eth1 | DEFROUTE=yes  | if did not set] ***
changed: [inetRouter]
changed: [office1Router]
changed: [office1Server]
changed: [centralRouter]
changed: [centralServer]
changed: [office2Router]
changed: [office2Server]

TASK [../roles/network-hosts : /etc/sysconfig/network-scripts/ifcfg-eth1 | DEFROUTE=yes | if "no"] ***
skipping: [inetRouter]
skipping: [centralRouter]
skipping: [centralServer]
skipping: [office1Router]
skipping: [office1Server]
skipping: [office2Router]
skipping: [office2Server]

RUNNING HANDLER [../roles/network-hosts : systemctl-restart-network] ***********
changed: [office1Server]
changed: [inetRouter]
changed: [centralServer]
changed: [centralRouter]
changed: [office2Server]
changed: [office1Router]
changed: [office2Router]

PLAY RECAP *********************************************************************
centralRouter              : ok=6    changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
centralServer              : ok=6    changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
inetRouter                 : ok=6    changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
office1Router              : ok=6    changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
office1Server              : ok=6    changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
office2Router              : ok=6    changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
office2Server              : ok=6    changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   


```

</details>


## Проверка работоспособности шлюзов

Выход в Интернет через `inetRouter` я не сделал, но при текщих связях с запрещенным маскарадингом необходимо сделать виртуальную сеть `eth1:0`, например, с адресацией 192.169.0.0. И на `inetRouter` сделать NAT на нее (https://jakeroid.com/ru/blog/nastraivaem-nat-v-linux.html).

Произвожу проверку внутрисетевой связности от "сервера" к "серверу", используя заранее установленный пакет `traceroute`:

```shell
traceroute 192.168.255.1 # internetRouter
traceroute 192.168.255.2 # centralRouter
traceroute 192.168.0.2   # centralServer
traceroute 192.168.2.194 # office1Server
traceroute 192.168.1.194 # office1Server
```

Обернуто в Anible

```shell
ansible-playbook playbooks/test_001_network_connectivity.yml > ../files/ansible-running/test_001_network_connectivity.txt
```

[ansible test_001_network_connectivity](./files/ansible-running/test_001_network_connectivity.txt)

<details><summary>см. ansible test_001_network_connectivity</summary>

```properties

PLAY [Playbook of tests] *******************************************************

TASK [Gathering Facts] *********************************************************
ok: [inetRouter]
ok: [centralServer]
ok: [centralRouter]
ok: [office1Server]
ok: [office1Router]
ok: [office2Server]
ok: [office2Router]

TASK [../roles/test_001_network_connectivity : test | demostration] ************
ok: [inetRouter] => {
    "msg": "I am inetRouter"
}
ok: [centralRouter] => {
    "msg": "I am centralRouter"
}
ok: [centralServer] => {
    "msg": "I am centralServer"
}
ok: [office1Router] => {
    "msg": "I am office1Router"
}
ok: [office1Server] => {
    "msg": "I am office1Server"
}
ok: [office2Router] => {
    "msg": "I am office2Router"
}
ok: [office2Server] => {
    "msg": "I am office2Server"
}

TASK [../roles/test_001_network_connectivity : test | traceroute foreign host] ***
changed: [centralRouter] => (item=192.168.255.1)
changed: [inetRouter] => (item=192.168.255.1)
changed: [office1Router] => (item=192.168.255.1)
changed: [centralServer] => (item=192.168.255.1)
changed: [centralRouter] => (item=192.168.255.2)
changed: [inetRouter] => (item=192.168.255.2)
changed: [office1Server] => (item=192.168.255.1)
changed: [office1Router] => (item=192.168.255.2)
changed: [centralServer] => (item=192.168.255.2)
changed: [centralRouter] => (item=192.168.0.2)
changed: [centralServer] => (item=192.168.0.2)
changed: [inetRouter] => (item=192.168.0.2)
changed: [office1Server] => (item=192.168.255.2)
changed: [office1Router] => (item=192.168.0.2)
changed: [centralRouter] => (item=192.168.2.194)
changed: [office1Router] => (item=192.168.2.194)
changed: [centralServer] => (item=192.168.2.194)
changed: [inetRouter] => (item=192.168.2.194)
changed: [centralRouter] => (item=192.168.1.194)
changed: [office1Server] => (item=192.168.0.2)
changed: [office1Server] => (item=192.168.2.194)
changed: [office1Router] => (item=192.168.1.194)
changed: [office2Router] => (item=192.168.255.1)
changed: [centralServer] => (item=192.168.1.194)
changed: [inetRouter] => (item=192.168.1.194)
changed: [office2Router] => (item=192.168.255.2)
changed: [office2Server] => (item=192.168.255.1)
changed: [office2Router] => (item=192.168.0.2)
changed: [office1Server] => (item=192.168.1.194)
changed: [office2Server] => (item=192.168.255.2)
changed: [office2Router] => (item=192.168.2.194)
changed: [office2Router] => (item=192.168.1.194)
changed: [office2Server] => (item=192.168.0.2)
changed: [office2Server] => (item=192.168.2.194)
changed: [office2Server] => (item=192.168.1.194)

TASK [../roles/test_001_network_connectivity : test | traceroute foreign host] ***
changed: [office1Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:20.310962', 'stdout': 'traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.33)  4.605 ms  3.171 ms  3.049 ms\n 2  192.168.255.1 (192.168.255.1)  2.827 ms  2.771 ms  2.554 ms', 'cmd': 'traceroute 192.168.255.1', 'rc': 0, 'start': '2021-08-16 00:41:00.254038', 'stderr': '', 'delta': '0:00:20.056924', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.1', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.33)  4.605 ms  3.171 ms  3.049 ms', ' 2  192.168.255.1 (192.168.255.1)  2.827 ms  2.771 ms  2.554 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.1', 'ansible_loop_var': 'item'})
changed: [centralServer -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:20.385664', 'stdout': 'traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.1)  0.606 ms  0.225 ms  1.358 ms\n 2  192.168.255.1 (192.168.255.1)  1.219 ms  2.725 ms  0.668 ms', 'cmd': 'traceroute 192.168.255.1', 'rc': 0, 'start': '2021-08-16 00:41:00.339319', 'stderr': '', 'delta': '0:00:20.046345', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.1', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.1)  0.606 ms  0.225 ms  1.358 ms', ' 2  192.168.255.1 (192.168.255.1)  1.219 ms  2.725 ms  0.668 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.1', 'ansible_loop_var': 'item'})
changed: [centralRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:10.339980', 'stdout': 'traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets\n 1  gateway (192.168.255.1)  0.439 ms  0.344 ms  0.136 ms', 'cmd': 'traceroute 192.168.255.1', 'rc': 0, 'start': '2021-08-16 00:41:00.300604', 'stderr': '', 'delta': '0:00:10.039376', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.1', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets', ' 1  gateway (192.168.255.1)  0.439 ms  0.344 ms  0.136 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.1', 'ansible_loop_var': 'item'})
changed: [inetRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:10.411250', 'stdout': 'traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets\n 1  inetRouter (192.168.255.1)  0.059 ms  0.022 ms  0.022 ms', 'cmd': 'traceroute 192.168.255.1', 'rc': 0, 'start': '2021-08-16 00:41:00.381212', 'stderr': '', 'delta': '0:00:10.030038', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.1', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets', ' 1  inetRouter (192.168.255.1)  0.059 ms  0.022 ms  0.022 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.1', 'ansible_loop_var': 'item'})
changed: [office1Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:30.367709', 'stdout': 'traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets\n 1  gateway (192.168.2.193)  0.565 ms  0.666 ms  0.387 ms\n 2  192.168.0.33 (192.168.0.33)  1.431 ms  1.112 ms  0.773 ms\n 3  192.168.255.1 (192.168.255.1)  1.819 ms  1.291 ms  1.644 ms', 'cmd': 'traceroute 192.168.255.1', 'rc': 0, 'start': '2021-08-16 00:41:00.300344', 'stderr': '', 'delta': '0:00:30.067365', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.1', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets', ' 1  gateway (192.168.2.193)  0.565 ms  0.666 ms  0.387 ms', ' 2  192.168.0.33 (192.168.0.33)  1.431 ms  1.112 ms  0.773 ms', ' 3  192.168.255.1 (192.168.255.1)  1.819 ms  1.291 ms  1.644 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.1', 'ansible_loop_var': 'item'})
changed: [centralServer -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:30.994546', 'stdout': 'traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets\n 1  192.168.255.2 (192.168.255.2)  0.343 ms  0.286 ms  0.266 ms', 'cmd': 'traceroute 192.168.255.2', 'rc': 0, 'start': '2021-08-16 00:41:20.963034', 'stderr': '', 'delta': '0:00:10.031512', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets', ' 1  192.168.255.2 (192.168.255.2)  0.343 ms  0.286 ms  0.266 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.2', 'ansible_loop_var': 'item'})
changed: [office1Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:30.933462', 'stdout': 'traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets\n 1  192.168.255.2 (192.168.255.2)  0.457 ms  0.585 ms  0.872 ms', 'cmd': 'traceroute 192.168.255.2', 'rc': 0, 'start': '2021-08-16 00:41:20.902987', 'stderr': '', 'delta': '0:00:10.030475', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets', ' 1  192.168.255.2 (192.168.255.2)  0.457 ms  0.585 ms  0.872 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.2', 'ansible_loop_var': 'item'})
changed: [centralRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:21.024158', 'stdout': 'traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets\n 1  centralRouter (192.168.255.2)  0.041 ms  0.017 ms  0.018 ms', 'cmd': 'traceroute 192.168.255.2', 'rc': 0, 'start': '2021-08-16 00:41:10.992725', 'stderr': '', 'delta': '0:00:10.031433', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets', ' 1  centralRouter (192.168.255.2)  0.041 ms  0.017 ms  0.018 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.2', 'ansible_loop_var': 'item'})
changed: [inetRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:21.075077', 'stdout': 'traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets\n 1  192.168.255.2 (192.168.255.2)  0.581 ms  0.315 ms  0.234 ms', 'cmd': 'traceroute 192.168.255.2', 'rc': 0, 'start': '2021-08-16 00:41:11.048725', 'stderr': '', 'delta': '0:00:10.026352', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets', ' 1  192.168.255.2 (192.168.255.2)  0.581 ms  0.315 ms  0.234 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.2', 'ansible_loop_var': 'item'})
changed: [centralServer -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:41.615078', 'stdout': 'traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets\n 1  centralServer (192.168.0.2)  0.034 ms  0.012 ms  0.012 ms', 'cmd': 'traceroute 192.168.0.2', 'rc': 0, 'start': '2021-08-16 00:41:31.586349', 'stderr': '', 'delta': '0:00:10.028729', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.0.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets', ' 1  centralServer (192.168.0.2)  0.034 ms  0.012 ms  0.012 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.0.2', 'ansible_loop_var': 'item'})
changed: [office1Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:50.978109', 'stdout': 'traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets\n 1  gateway (192.168.2.193)  0.457 ms  0.210 ms  0.213 ms\n 2  192.168.255.2 (192.168.255.2)  1.592 ms  0.454 ms  0.984 ms', 'cmd': 'traceroute 192.168.255.2', 'rc': 0, 'start': '2021-08-16 00:41:30.925104', 'stderr': '', 'delta': '0:00:20.053005', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets', ' 1  gateway (192.168.2.193)  0.457 ms  0.210 ms  0.213 ms', ' 2  192.168.255.2 (192.168.255.2)  1.592 ms  0.454 ms  0.984 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.2', 'ansible_loop_var': 'item'})
changed: [office1Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:51.576426', 'stdout': 'traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.33)  0.393 ms  0.128 ms  0.222 ms\n 2  192.168.0.2 (192.168.0.2)  0.735 ms  0.592 ms  0.441 ms', 'cmd': 'traceroute 192.168.0.2', 'rc': 0, 'start': '2021-08-16 00:41:31.527497', 'stderr': '', 'delta': '0:00:20.048929', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.0.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.33)  0.393 ms  0.128 ms  0.222 ms', ' 2  192.168.0.2 (192.168.0.2)  0.735 ms  0.592 ms  0.441 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.0.2', 'ansible_loop_var': 'item'})
changed: [centralRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:31.644111', 'stdout': 'traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets\n 1  192.168.0.2 (192.168.0.2)  0.598 ms  0.855 ms  0.707 ms', 'cmd': 'traceroute 192.168.0.2', 'rc': 0, 'start': '2021-08-16 00:41:21.611043', 'stderr': '', 'delta': '0:00:10.033068', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.0.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets', ' 1  192.168.0.2 (192.168.0.2)  0.598 ms  0.855 ms  0.707 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.0.2', 'ansible_loop_var': 'item'})
changed: [inetRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:41.668056', 'stdout': 'traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets\n 1  192.168.255.2 (192.168.255.2)  0.367 ms  0.157 ms  0.197 ms\n 2  192.168.0.2 (192.168.0.2)  0.753 ms  0.597 ms  0.783 ms', 'cmd': 'traceroute 192.168.0.2', 'rc': 0, 'start': '2021-08-16 00:41:21.633791', 'stderr': '', 'delta': '0:00:20.034265', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.0.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets', ' 1  192.168.255.2 (192.168.255.2)  0.367 ms  0.157 ms  0.197 ms', ' 2  192.168.0.2 (192.168.0.2)  0.753 ms  0.597 ms  0.783 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.0.2', 'ansible_loop_var': 'item'})
changed: [office1Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:21.575704', 'stdout': 'traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets\n 1  gateway (192.168.2.193)  0.291 ms  0.306 ms  0.175 ms\n 2  192.168.0.33 (192.168.0.33)  1.949 ms  1.862 ms  1.738 ms\n 3  192.168.0.2 (192.168.0.2)  1.605 ms  3.228 ms  3.103 ms', 'cmd': 'traceroute 192.168.0.2', 'rc': 0, 'start': '2021-08-16 00:41:51.520143', 'stderr': '', 'delta': '0:00:30.055561', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.0.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets', ' 1  gateway (192.168.2.193)  0.291 ms  0.306 ms  0.175 ms', ' 2  192.168.0.33 (192.168.0.33)  1.949 ms  1.862 ms  1.738 ms', ' 3  192.168.0.2 (192.168.0.2)  1.605 ms  3.228 ms  3.103 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.0.2', 'ansible_loop_var': 'item'})
changed: [office1Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:02.171018', 'stdout': 'traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets\n 1  192.168.2.194 (192.168.2.194)  0.334 ms  0.203 ms  0.231 ms', 'cmd': 'traceroute 192.168.2.194', 'rc': 0, 'start': '2021-08-16 00:41:52.137061', 'stderr': '', 'delta': '0:00:10.033957', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.2.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets', ' 1  192.168.2.194 (192.168.2.194)  0.334 ms  0.203 ms  0.231 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.2.194', 'ansible_loop_var': 'item'})
changed: [centralServer -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:12.246383', 'stdout': 'traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.1)  0.772 ms  0.605 ms  0.463 ms\n 2  192.168.0.34 (192.168.0.34)  2.123 ms  2.000 ms  1.876 ms\n 3  192.168.2.194 (192.168.2.194)  4.119 ms  4.117 ms  4.006 ms', 'cmd': 'traceroute 192.168.2.194', 'rc': 0, 'start': '2021-08-16 00:41:42.188815', 'stderr': '', 'delta': '0:00:30.057568', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.2.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.1)  0.772 ms  0.605 ms  0.463 ms', ' 2  192.168.0.34 (192.168.0.34)  2.123 ms  2.000 ms  1.876 ms', ' 3  192.168.2.194 (192.168.2.194)  4.119 ms  4.117 ms  4.006 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.2.194', 'ansible_loop_var': 'item'})
changed: [centralRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:41:52.231006', 'stdout': 'traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets\n 1  192.168.0.34 (192.168.0.34)  0.350 ms  0.224 ms  0.168 ms\n 2  192.168.2.194 (192.168.2.194)  1.126 ms  0.944 ms  0.810 ms', 'cmd': 'traceroute 192.168.2.194', 'rc': 0, 'start': '2021-08-16 00:41:32.187749', 'stderr': '', 'delta': '0:00:20.043257', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.2.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets', ' 1  192.168.0.34 (192.168.0.34)  0.350 ms  0.224 ms  0.168 ms', ' 2  192.168.2.194 (192.168.2.194)  1.126 ms  0.944 ms  0.810 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.2.194', 'ansible_loop_var': 'item'})
changed: [inetRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:12.267844', 'stdout': 'traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets\n 1  192.168.255.2 (192.168.255.2)  0.303 ms  0.174 ms  0.200 ms\n 2  192.168.0.34 (192.168.0.34)  0.465 ms  0.301 ms  0.537 ms\n 3  192.168.2.194 (192.168.2.194)  1.332 ms  1.612 ms  1.667 ms', 'cmd': 'traceroute 192.168.2.194', 'rc': 0, 'start': '2021-08-16 00:41:42.210206', 'stderr': '', 'delta': '0:00:30.057638', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.2.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets', ' 1  192.168.255.2 (192.168.255.2)  0.303 ms  0.174 ms  0.200 ms', ' 2  192.168.0.34 (192.168.0.34)  0.465 ms  0.301 ms  0.537 ms', ' 3  192.168.2.194 (192.168.2.194)  1.332 ms  1.612 ms  1.667 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.2.194', 'ansible_loop_var': 'item'})
changed: [office1Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:32.781381', 'stdout': 'traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.33)  0.373 ms  0.139 ms  0.360 ms\n 2  192.168.0.35 (192.168.0.35)  0.956 ms  0.825 ms  0.916 ms\n 3  192.168.1.194 (192.168.1.194)  1.012 ms  0.906 ms  0.980 ms', 'cmd': 'traceroute 192.168.1.194', 'rc': 0, 'start': '2021-08-16 00:42:02.722654', 'stderr': '', 'delta': '0:00:30.058727', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.1.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.33)  0.373 ms  0.139 ms  0.360 ms', ' 2  192.168.0.35 (192.168.0.35)  0.956 ms  0.825 ms  0.916 ms', ' 3  192.168.1.194 (192.168.1.194)  1.012 ms  0.906 ms  0.980 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.1.194', 'ansible_loop_var': 'item'})
changed: [office1Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:32.163066', 'stdout': 'traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets\n 1  office1Server (192.168.2.194)  0.033 ms  0.013 ms  0.011 ms', 'cmd': 'traceroute 192.168.2.194', 'rc': 0, 'start': '2021-08-16 00:42:22.133521', 'stderr': '', 'delta': '0:00:10.029545', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.2.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets', ' 1  office1Server (192.168.2.194)  0.033 ms  0.013 ms  0.011 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.2.194', 'ansible_loop_var': 'item'})
changed: [centralServer -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:43.040588', 'stdout': 'traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.1)  0.385 ms  0.392 ms  0.433 ms\n 2  192.168.0.35 (192.168.0.35)  0.764 ms  0.481 ms  2.139 ms\n 3  192.168.1.194 (192.168.1.194)  3.806 ms  3.876 ms  4.037 ms', 'cmd': 'traceroute 192.168.1.194', 'rc': 0, 'start': '2021-08-16 00:42:12.975189', 'stderr': '', 'delta': '0:00:30.065399', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.1.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.1)  0.385 ms  0.392 ms  0.433 ms', ' 2  192.168.0.35 (192.168.0.35)  0.764 ms  0.481 ms  2.139 ms', ' 3  192.168.1.194 (192.168.1.194)  3.806 ms  3.876 ms  4.037 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.1.194', 'ansible_loop_var': 'item'})
changed: [centralRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:12.813231', 'stdout': 'traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets\n 1  192.168.0.35 (192.168.0.35)  0.396 ms  0.177 ms  0.239 ms\n 2  192.168.1.194 (192.168.1.194)  0.576 ms  1.326 ms  1.702 ms', 'cmd': 'traceroute 192.168.1.194', 'rc': 0, 'start': '2021-08-16 00:41:52.771541', 'stderr': '', 'delta': '0:00:20.041690', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.1.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets', ' 1  192.168.0.35 (192.168.0.35)  0.396 ms  0.177 ms  0.239 ms', ' 2  192.168.1.194 (192.168.1.194)  0.576 ms  1.326 ms  1.702 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.1.194', 'ansible_loop_var': 'item'})
changed: [inetRouter -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:43.070995', 'stdout': 'traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets\n 1  192.168.255.2 (192.168.255.2)  0.750 ms  0.409 ms  0.611 ms\n 2  192.168.0.35 (192.168.0.35)  0.677 ms  2.075 ms  1.891 ms\n 3  192.168.1.194 (192.168.1.194)  1.741 ms  1.550 ms  2.098 ms', 'cmd': 'traceroute 192.168.1.194', 'rc': 0, 'start': '2021-08-16 00:42:13.017781', 'stderr': '', 'delta': '0:00:30.053214', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.1.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets', ' 1  192.168.255.2 (192.168.255.2)  0.750 ms  0.409 ms  0.611 ms', ' 2  192.168.0.35 (192.168.0.35)  0.677 ms  2.075 ms  1.891 ms', ' 3  192.168.1.194 (192.168.1.194)  1.741 ms  1.550 ms  2.098 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.1.194', 'ansible_loop_var': 'item'})
changed: [office2Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:34.100990', 'stdout': 'traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.33)  1.466 ms  1.203 ms  1.049 ms\n 2  192.168.255.1 (192.168.255.1)  2.737 ms  2.605 ms  2.623 ms', 'cmd': 'traceroute 192.168.255.1', 'rc': 0, 'start': '2021-08-16 00:42:14.047804', 'stderr': '', 'delta': '0:00:20.053186', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.1', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.33)  1.466 ms  1.203 ms  1.049 ms', ' 2  192.168.255.1 (192.168.255.1)  2.737 ms  2.605 ms  2.623 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.1', 'ansible_loop_var': 'item'})
changed: [office1Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:43:12.787627', 'stdout': 'traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets\n 1  gateway (192.168.2.193)  0.302 ms  0.282 ms  0.198 ms\n 2  192.168.0.33 (192.168.0.33)  0.510 ms  0.724 ms  0.781 ms\n 3  192.168.0.35 (192.168.0.35)  1.914 ms  2.336 ms  2.469 ms\n 4  192.168.1.194 (192.168.1.194)  2.784 ms  2.577 ms  2.517 ms', 'cmd': 'traceroute 192.168.1.194', 'rc': 0, 'start': '2021-08-16 00:42:32.718025', 'stderr': '', 'delta': '0:00:40.069602', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.1.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets', ' 1  gateway (192.168.2.193)  0.302 ms  0.282 ms  0.198 ms', ' 2  192.168.0.33 (192.168.0.33)  0.510 ms  0.724 ms  0.781 ms', ' 3  192.168.0.35 (192.168.0.35)  1.914 ms  2.336 ms  2.469 ms', ' 4  192.168.1.194 (192.168.1.194)  2.784 ms  2.577 ms  2.517 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.1.194', 'ansible_loop_var': 'item'})
changed: [office2Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:43:03.959520', 'stdout': 'traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets\n 1  gateway (192.168.1.193)  0.301 ms  0.378 ms  0.410 ms\n 2  192.168.0.33 (192.168.0.33)  1.285 ms  1.067 ms  1.521 ms\n 3  192.168.255.1 (192.168.255.1)  1.946 ms  1.781 ms  1.877 ms', 'cmd': 'traceroute 192.168.255.1', 'rc': 0, 'start': '2021-08-16 00:42:33.896543', 'stderr': '', 'delta': '0:00:30.062977', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.1', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets', ' 1  gateway (192.168.1.193)  0.301 ms  0.378 ms  0.410 ms', ' 2  192.168.0.33 (192.168.0.33)  1.285 ms  1.067 ms  1.521 ms', ' 3  192.168.255.1 (192.168.255.1)  1.946 ms  1.781 ms  1.877 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.1', 'ansible_loop_var': 'item'})
changed: [office2Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:42:44.697383', 'stdout': 'traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets\n 1  192.168.255.2 (192.168.255.2)  0.438 ms  0.171 ms  0.199 ms', 'cmd': 'traceroute 192.168.255.2', 'rc': 0, 'start': '2021-08-16 00:42:34.661601', 'stderr': '', 'delta': '0:00:10.035782', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets', ' 1  192.168.255.2 (192.168.255.2)  0.438 ms  0.171 ms  0.199 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.2', 'ansible_loop_var': 'item'})
changed: [office2Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:43:24.552031', 'stdout': 'traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets\n 1  gateway (192.168.1.193)  0.526 ms  0.437 ms  0.280 ms\n 2  192.168.255.2 (192.168.255.2)  0.610 ms  1.632 ms  1.503 ms', 'cmd': 'traceroute 192.168.255.2', 'rc': 0, 'start': '2021-08-16 00:43:04.504091', 'stderr': '', 'delta': '0:00:20.047940', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.255.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets', ' 1  gateway (192.168.1.193)  0.526 ms  0.437 ms  0.280 ms', ' 2  192.168.255.2 (192.168.255.2)  0.610 ms  1.632 ms  1.503 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.255.2', 'ansible_loop_var': 'item'})
changed: [office2Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:43:05.291940', 'stdout': 'traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.33)  0.360 ms  0.211 ms  0.191 ms\n 2  192.168.0.2 (192.168.0.2)  1.127 ms  0.961 ms  0.839 ms', 'cmd': 'traceroute 192.168.0.2', 'rc': 0, 'start': '2021-08-16 00:42:45.242593', 'stderr': '', 'delta': '0:00:20.049347', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.0.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.33)  0.360 ms  0.211 ms  0.191 ms', ' 2  192.168.0.2 (192.168.0.2)  1.127 ms  0.961 ms  0.839 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.0.2', 'ansible_loop_var': 'item'})
changed: [office2Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:43:55.151610', 'stdout': 'traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets\n 1  gateway (192.168.1.193)  0.399 ms  0.355 ms  0.140 ms\n 2  192.168.0.33 (192.168.0.33)  2.133 ms  1.993 ms  1.857 ms\n 3  192.168.0.2 (192.168.0.2)  2.262 ms  2.506 ms  2.353 ms', 'cmd': 'traceroute 192.168.0.2', 'rc': 0, 'start': '2021-08-16 00:43:25.089985', 'stderr': '', 'delta': '0:00:30.061625', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.0.2', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets', ' 1  gateway (192.168.1.193)  0.399 ms  0.355 ms  0.140 ms', ' 2  192.168.0.33 (192.168.0.33)  2.133 ms  1.993 ms  1.857 ms', ' 3  192.168.0.2 (192.168.0.2)  2.262 ms  2.506 ms  2.353 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.0.2', 'ansible_loop_var': 'item'})
changed: [office2Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:43:35.908612', 'stdout': 'traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets\n 1  gateway (192.168.0.33)  0.525 ms  0.293 ms  0.322 ms\n 2  192.168.0.34 (192.168.0.34)  0.447 ms  0.337 ms  0.784 ms\n 3  192.168.2.194 (192.168.2.194)  1.036 ms  0.882 ms  0.865 ms', 'cmd': 'traceroute 192.168.2.194', 'rc': 0, 'start': '2021-08-16 00:43:05.849949', 'stderr': '', 'delta': '0:00:30.058663', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.2.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets', ' 1  gateway (192.168.0.33)  0.525 ms  0.293 ms  0.322 ms', ' 2  192.168.0.34 (192.168.0.34)  0.447 ms  0.337 ms  0.784 ms', ' 3  192.168.2.194 (192.168.2.194)  1.036 ms  0.882 ms  0.865 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.2.194', 'ansible_loop_var': 'item'})
changed: [office2Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:44:35.758761', 'stdout': 'traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets\n 1  gateway (192.168.1.193)  0.364 ms  0.204 ms  0.191 ms\n 2  192.168.0.33 (192.168.0.33)  1.246 ms  1.064 ms  0.894 ms\n 3  192.168.0.34 (192.168.0.34)  0.754 ms  3.425 ms  3.292 ms\n 4  192.168.2.194 (192.168.2.194)  3.158 ms  3.321 ms  3.064 ms', 'cmd': 'traceroute 192.168.2.194', 'rc': 0, 'start': '2021-08-16 00:43:55.683567', 'stderr': '', 'delta': '0:00:40.075194', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.2.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets', ' 1  gateway (192.168.1.193)  0.364 ms  0.204 ms  0.191 ms', ' 2  192.168.0.33 (192.168.0.33)  1.246 ms  1.064 ms  0.894 ms', ' 3  192.168.0.34 (192.168.0.34)  0.754 ms  3.425 ms  3.292 ms', ' 4  192.168.2.194 (192.168.2.194)  3.158 ms  3.321 ms  3.064 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.2.194', 'ansible_loop_var': 'item'})
changed: [office2Router -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:43:46.485576', 'stdout': 'traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets\n 1  192.168.1.194 (192.168.1.194)  0.558 ms  0.441 ms  0.188 ms', 'cmd': 'traceroute 192.168.1.194', 'rc': 0, 'start': '2021-08-16 00:43:36.459276', 'stderr': '', 'delta': '0:00:10.026300', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.1.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets', ' 1  192.168.1.194 (192.168.1.194)  0.558 ms  0.441 ms  0.188 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.1.194', 'ansible_loop_var': 'item'})
changed: [office2Server -> localhost] => (item={'changed': True, 'end': '2021-08-16 00:44:46.323952', 'stdout': 'traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets\n 1  office2Server (192.168.1.194)  0.040 ms  0.014 ms  0.012 ms', 'cmd': 'traceroute 192.168.1.194', 'rc': 0, 'start': '2021-08-16 00:44:36.297040', 'stderr': '', 'delta': '0:00:10.026912', 'invocation': {'module_args': {'creates': None, 'executable': None, '_uses_shell': True, 'strip_empty_ends': True, '_raw_params': 'traceroute 192.168.1.194', 'removes': None, 'argv': None, 'warn': False, 'chdir': None, 'stdin_add_newline': True, 'stdin': None}}, 'stdout_lines': ['traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets', ' 1  office2Server (192.168.1.194)  0.040 ms  0.014 ms  0.012 ms'], 'stderr_lines': [], 'failed': False, 'item': '192.168.1.194', 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
centralRouter              : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
centralServer              : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
inetRouter                 : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
office1Router              : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
office1Server              : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
office2Router              : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
office2Server              : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


```

</details>


#### inetRouter


<details><summary>см. traceroute 192.168.255.1</summary>

```properties
traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets
 1  inetRouter (192.168.255.1)  0.059 ms  0.022 ms  0.022 ms

```

</details>


<details><summary>см. traceroute 192.168.255.2</summary>

```properties
traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets
 1  192.168.255.2 (192.168.255.2)  0.581 ms  0.315 ms  0.234 ms

```

</details>


<details><summary>см. traceroute 192.168.0.2</summary>

```properties
traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets
 1  192.168.255.2 (192.168.255.2)  0.367 ms  0.157 ms  0.197 ms
 2  192.168.0.2 (192.168.0.2)  0.753 ms  0.597 ms  0.783 ms

```

</details>


<details><summary>см. traceroute 192.168.2.194</summary>

```properties
traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets
 1  192.168.255.2 (192.168.255.2)  0.303 ms  0.174 ms  0.200 ms
 2  192.168.0.34 (192.168.0.34)  0.465 ms  0.301 ms  0.537 ms
 3  192.168.2.194 (192.168.2.194)  1.332 ms  1.612 ms  1.667 ms

```

</details>


<details><summary>см. traceroute 192.168.1.194</summary>

```properties
traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets
 1  192.168.255.2 (192.168.255.2)  0.750 ms  0.409 ms  0.611 ms
 2  192.168.0.35 (192.168.0.35)  0.677 ms  2.075 ms  1.891 ms
 3  192.168.1.194 (192.168.1.194)  1.741 ms  1.550 ms  2.098 ms

```

</details>


#### centralRouter

<details><summary>см. traceroute 192.168.255.1</summary>

```properties
traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets
 1  gateway (192.168.255.1)  0.439 ms  0.344 ms  0.136 ms

```

</details>


<details><summary>см. traceroute 192.168.255.2</summary>

```properties
traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets
 1  centralRouter (192.168.255.2)  0.041 ms  0.017 ms  0.018 ms

```

</details>


<details><summary>см. traceroute 192.168.0.2</summary>

```properties
traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets
 1  192.168.0.2 (192.168.0.2)  0.598 ms  0.855 ms  0.707 ms

```

</details>


<details><summary>см. traceroute 192.168.2.194</summary>

```properties
traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets
 1  192.168.0.34 (192.168.0.34)  0.350 ms  0.224 ms  0.168 ms
 2  192.168.2.194 (192.168.2.194)  1.126 ms  0.944 ms  0.810 ms

```

</details>


<details><summary>см. traceroute 192.168.1.194</summary>

```properties
traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets
 1  192.168.0.35 (192.168.0.35)  0.396 ms  0.177 ms  0.239 ms
 2  192.168.1.194 (192.168.1.194)  0.576 ms  1.326 ms  1.702 ms

```

</details>


#### centralServer

<details><summary>см. traceroute 192.168.255.1</summary>

```properties
traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets
 1  gateway (192.168.0.1)  0.606 ms  0.225 ms  1.358 ms
 2  192.168.255.1 (192.168.255.1)  1.219 ms  2.725 ms  0.668 ms

```

</details>


<details><summary>см. traceroute 192.168.255.2</summary>

```properties
traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets
 1  192.168.255.2 (192.168.255.2)  0.343 ms  0.286 ms  0.266 ms

```

</details>


<details><summary>см. traceroute 192.168.0.2</summary>

```properties
traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets
 1  centralServer (192.168.0.2)  0.034 ms  0.012 ms  0.012 ms

```

</details>


<details><summary>см. traceroute 192.168.2.194</summary>

```properties
traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets
 1  gateway (192.168.0.1)  0.772 ms  0.605 ms  0.463 ms
 2  192.168.0.34 (192.168.0.34)  2.123 ms  2.000 ms  1.876 ms
 3  192.168.2.194 (192.168.2.194)  4.119 ms  4.117 ms  4.006 ms

```

</details>


<details><summary>см. traceroute 192.168.1.194</summary>

```properties
traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets
 1  gateway (192.168.0.1)  0.385 ms  0.392 ms  0.433 ms
 2  192.168.0.35 (192.168.0.35)  0.764 ms  0.481 ms  2.139 ms
 3  192.168.1.194 (192.168.1.194)  3.806 ms  3.876 ms  4.037 ms

```

</details>


#### office1Router

<details><summary>см. traceroute 192.168.255.1</summary>

```properties
traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets
 1  gateway (192.168.0.33)  4.605 ms  3.171 ms  3.049 ms
 2  192.168.255.1 (192.168.255.1)  2.827 ms  2.771 ms  2.554 ms

```

</details>


<details><summary>см. traceroute 192.168.255.2</summary>

```properties
traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets
 1  192.168.255.2 (192.168.255.2)  0.457 ms  0.585 ms  0.872 ms

```

</details>


<details><summary>см. traceroute 192.168.0.2</summary>

```properties
traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets
 1  gateway (192.168.0.33)  0.393 ms  0.128 ms  0.222 ms
 2  192.168.0.2 (192.168.0.2)  0.735 ms  0.592 ms  0.441 ms

```

</details>


<details><summary>см. traceroute 192.168.2.194</summary>

```properties
traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets
 1  192.168.2.194 (192.168.2.194)  0.334 ms  0.203 ms  0.231 ms

```

</details>


<details><summary>см. traceroute 192.168.1.194</summary>

```properties
traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets
 1  gateway (192.168.0.33)  0.373 ms  0.139 ms  0.360 ms
 2  192.168.0.35 (192.168.0.35)  0.956 ms  0.825 ms  0.916 ms
 3  192.168.1.194 (192.168.1.194)  1.012 ms  0.906 ms  0.980 ms

```

</details>


#### office1Server


<details><summary>см. traceroute 192.168.255.1</summary>

```properties
traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets
 1  gateway (192.168.2.193)  0.565 ms  0.666 ms  0.387 ms
 2  192.168.0.33 (192.168.0.33)  1.431 ms  1.112 ms  0.773 ms
 3  192.168.255.1 (192.168.255.1)  1.819 ms  1.291 ms  1.644 ms

```

</details>


<details><summary>см. traceroute 192.168.255.2</summary>

```properties
traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets
 1  gateway (192.168.2.193)  0.457 ms  0.210 ms  0.213 ms
 2  192.168.255.2 (192.168.255.2)  1.592 ms  0.454 ms  0.984 ms

```

</details>


<details><summary>см. traceroute 192.168.0.2</summary>

```properties
traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets
 1  gateway (192.168.2.193)  0.291 ms  0.306 ms  0.175 ms
 2  192.168.0.33 (192.168.0.33)  1.949 ms  1.862 ms  1.738 ms
 3  192.168.0.2 (192.168.0.2)  1.605 ms  3.228 ms  3.103 ms

```

</details>

<details><summary>см. traceroute 192.168.2.194</summary>

```properties
traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets
 1  office1Server (192.168.2.194)  0.033 ms  0.013 ms  0.011 ms

```

</details>

<details><summary>см. traceroute 192.168.1.194</summary>

```properties
traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets
 1  gateway (192.168.2.193)  0.302 ms  0.282 ms  0.198 ms
 2  192.168.0.33 (192.168.0.33)  0.510 ms  0.724 ms  0.781 ms
 3  192.168.0.35 (192.168.0.35)  1.914 ms  2.336 ms  2.469 ms
 4  192.168.1.194 (192.168.1.194)  2.784 ms  2.577 ms  2.517 ms

```

</details>


#### office2Router

<details><summary>см. traceroute 192.168.255.1</summary>

```properties
traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets
 1  gateway (192.168.0.33)  1.466 ms  1.203 ms  1.049 ms
 2  192.168.255.1 (192.168.255.1)  2.737 ms  2.605 ms  2.623 ms

```

</details>


<details><summary>см. traceroute 192.168.255.2</summary>

```properties
traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets
 1  192.168.255.2 (192.168.255.2)  0.438 ms  0.171 ms  0.199 ms

```

</details>


<details><summary>см. traceroute 192.168.0.2</summary>

```properties
traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets
 1  gateway (192.168.0.33)  0.360 ms  0.211 ms  0.191 ms
 2  192.168.0.2 (192.168.0.2)  1.127 ms  0.961 ms  0.839 ms

```

</details>


<details><summary>см. traceroute 192.168.2.194</summary>

```properties
traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets
 1  gateway (192.168.0.33)  0.525 ms  0.293 ms  0.322 ms
 2  192.168.0.34 (192.168.0.34)  0.447 ms  0.337 ms  0.784 ms
 3  192.168.2.194 (192.168.2.194)  1.036 ms  0.882 ms  0.865 ms

```

</details>


<details><summary>см. traceroute 192.168.1.194</summary>

```properties
traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets
 1  192.168.1.194 (192.168.1.194)  0.558 ms  0.441 ms  0.188 ms

```

</details>


#### office2Server

<details><summary>см. traceroute 192.168.255.1</summary>

```properties
traceroute to 192.168.255.1 (192.168.255.1), 30 hops max, 60 byte packets
 1  gateway (192.168.1.193)  0.301 ms  0.378 ms  0.410 ms
 2  192.168.0.33 (192.168.0.33)  1.285 ms  1.067 ms  1.521 ms
 3  192.168.255.1 (192.168.255.1)  1.946 ms  1.781 ms  1.877 ms

```

</details>


<details><summary>см. traceroute 192.168.255.2</summary>

```properties
traceroute to 192.168.255.2 (192.168.255.2), 30 hops max, 60 byte packets
 1  gateway (192.168.1.193)  0.526 ms  0.437 ms  0.280 ms
 2  192.168.255.2 (192.168.255.2)  0.610 ms  1.632 ms  1.503 ms

```

</details>


<details><summary>см. traceroute 192.168.0.2</summary>

```properties
traceroute to 192.168.0.2 (192.168.0.2), 30 hops max, 60 byte packets
 1  gateway (192.168.1.193)  0.399 ms  0.355 ms  0.140 ms
 2  192.168.0.33 (192.168.0.33)  2.133 ms  1.993 ms  1.857 ms
 3  192.168.0.2 (192.168.0.2)  2.262 ms  2.506 ms  2.353 ms

```

</details>


<details><summary>см. traceroute 192.168.2.194</summary>

```properties
traceroute to 192.168.2.194 (192.168.2.194), 30 hops max, 60 byte packets
 1  gateway (192.168.1.193)  0.364 ms  0.204 ms  0.191 ms
 2  192.168.0.33 (192.168.0.33)  1.246 ms  1.064 ms  0.894 ms
 3  192.168.0.34 (192.168.0.34)  0.754 ms  3.425 ms  3.292 ms
 4  192.168.2.194 (192.168.2.194)  3.158 ms  3.321 ms  3.064 ms

```

</details>


<details><summary>см. traceroute 192.168.1.194</summary>

```properties
traceroute to 192.168.1.194 (192.168.1.194), 30 hops max, 60 byte packets
 1  office2Server (192.168.1.194)  0.040 ms  0.014 ms  0.012 ms

```

</details>


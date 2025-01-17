# Домашнее задание №15
# Практика с SELinux
## Условие

Практика с SELinux  
Цель: Тренируем умение работать с SELinux: диагностировать проблемы и модифицировать политики SELinux для корректной работы приложений, если это требуется.  
1. Запустить nginx на нестандартном порту 3-мя разными способами:  
- переключатели setsebool;  
- добавление нестандартного порта в имеющийся тип;  
- формирование и установка модуля SELinux.  
К сдаче:  
- README с описанием каждого решения (скриншоты и демонстрация приветствуются).  

2. Обеспечить работоспособность приложения при включенном selinux.  
- Развернуть приложенный стенд  
https://github.com/mbfx/otus-linux-adm/tree/master/selinux_dns_problems  
- Выяснить причину неработоспособности механизма обновления зоны (см. README);  
- Предложить решение (или решения) для данной проблемы;  
- Выбрать одно из решений для реализации, предварительно обосновав выбор;  
- Реализовать выбранное решение и продемонстрировать его работоспособность.  
К сдаче:  
- README с анализом причины неработоспособности, возможными способами решения и обоснованием выбора одного из них;  
- Исправленный стенд или демонстрация работоспособной системы скриншотами и описанием.  

## Запустить nginx на нестандартном порту 3-мя разными способами:

Для выполнения задания сменил в nginx.conf стандартный порт 80 на 5287
Логи связанные с работой SELinux расположены /var/log/audit/audit.log, так как данный лог не удобочитаемый, можно воспользоваться утилитами audit2why или sealert, которые также предлагают варианты решения проблемы.

### setsebool

    setsebool -P nis_enabled 1

Данная утилита устанавливает текущее значение для одного переключателя или целого списка переключателей SELinux.  
Так как данная команда включает переключатель NIS (Network Information System), не совсем понятно, что конкретно  
активируется в системе вместе с unreserved_port_t. Возможность включить только unreserved_port_t не нашел.

### Добавление нестандартного порта в имеющийся тип

    semanage port -a -t http_port_t -p tcp 5287

С помощью команды **semanage port -l | grep http** можно просмотреть список портов

### Формирование и установка модуля SELinux

    ausearch -c 'nginx' --raw | audit2allow -M my-nginx
    semodule -i my-nginx.pp

## Обеспечить работоспособность приложения при включенном selinux.

При попытке обновить зону *ddns.lab* с помощью *nsupdate* возникает ошибка *SERVFAIL*
Если перевести SELinux на ВМ ns01 в режим permissive, с помощью команды **setenforce 0**, данная ошибка не воспроизводится. Соответственно можно сделать вывод, что проблема в некорректных настройках, несовместимыми с политиками SELinux.  
Также это подтверждается при проверке */var/log/audit/audit.log*, для удобства можно воспользоваться утилитами audit2why или sealert (необходимо запускать из под root на ВМ ns01).

    audit2why < /var/log/audit/audit.log

    sealert -a /var/log/audit/audit.log

С помощью рекомендаций, которые даются в выводе *sealert* данную ошибку устранить не удалось.  

В руководстве по RedHat SELinux [Ссылка](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/selinux_users_and_administrators_guide/sect-managing_confined_services-bind-configuration_examples) говорится о том, что файлы, созданные в этом каталоге /var/named/dynamic/ или скопированные в него, наследуют разрешения Linux, которые позволяют named писать в них.
Заменил в *named.conf* и *playbook.yml* **/etc/named/dynamic** на **/var/named/dynamic** и заново развернул ВМ с измененными настройками. Данное решение принесло положительный результат, ошибка больше не воспроизводится.

Пытался изменить контекст файлов, без переноса, с помощью утилит chcon, semanage fcontext и restorecon. В итоге контекст изменить не получилось.

Для выполнения домашнего задания необходимо скачать из данного репозитория GitHub каталог Lesson_12 и перейти в него, далее необходимо выполнить в терминале

    vagrant up
    vagrant ssh client
    nsupdate -k /etc/named.zonetransfer.key
    > server 192.168.50.10
    > zone ddns.lab
    > update add www.ddns.lab. 60 A 192.168.50.15
    > send
    > quit
    
    dig +noall +answer www.ddns.lab

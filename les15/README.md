# Пользователи и группы. Авторизация и аутентификация. Linux-PAM.

__Домашнее задание__:
* Запретить всем пользователям, кроме группы admin логин в выходные (суббота и воскресенье), без учета праздников.
* Дать конкретному пользователю права работать с докером и возможность рестартить докер сервис

## Запрет входа

[Демонстрация работоспособности.](#001)

### Коротко о реализации запрета входа

Согласно [теории](http://linux-pam.org/Linux-PAM-html/sag-pam_time.html) алгоритм такой:
* получить всех пользователей с (указанной в качестве основной) группой `admin`
* добавить в `/etc/security/time.conf` записи вида
  
```text
# <пользователи группы admin> - это перечисление 
# вида `admin001&admin002&admin003`


# Нижеследующее дает разрешение использования по времени
# `AlSaSu` (всегда, кроме субботы и воскресенья) 
# службы `login`
# для пользователей не admin-группы
login;*;!<пользователи группы admin>;AlSaSu


# Нижеследующее не дает каких-либо иных разрешений 
# использования по время службы `login`
# для пользователей не admin-группы
login;*;!<пользователи группы admin>;!Al  
```
Для демонстрации добавил `sshd`.
  
### Реализация запрета входа

```shell
vagrant up
vagrant ssh
sudo su
# создадим демонстрационных пользователей
sudo useradd admin # <-- автоматом в группе `admin`
sudo useradd moderator -g admin # <-- то есть в группе `admin` не один только пользователь `admin`
sudo useradd user001 # <-- не в группе `admin`
sudo useradd user002 # <-- не в группе `admin`
sudo useradd user003 # <-- не в группе `admin`
# всем одинаковый пароль
echo "test" | sudo passwd admin --stdin
echo "test" | sudo passwd moderator --stdin
echo "test" | sudo passwd user001 --stdin
echo "test" | sudo passwd user002 --stdin
echo "test" | sudo passwd sudo --stdin

# топорно, но
# это просто защита от повторного запуска
# sed - инициирует 'pam_time.so'
if grep -q 'pam_time.so' /etc/pam.d/sshd
then
  echo "'pam_time.so' already exists in '/etc/pam.d/sshd'";
else
  sed -i 's@pam_nologin.so@pam_nologin.so\naccount    required     pam_time.so@g' /etc/pam.d/sshd;
fi
# просто проверка на добавленный 'pam_time.so'
if grep -q 'account    required     pam_time.so' /etc/pam.d/sshd
then
  echo "Add module 'pam_time.so' to '/etc/pam.d/sshd' - DONE";
fi

# The times field is used to indicate the times at which this rule applies.
# The format here is a logic list of day/time-range entries.
# The days are specified by a sequence of two character entries,
# MoTuSa for example is Monday Tuesday and Saturday.
# Note that repeated days are unset MoMo = no day, and MoWk = all weekdays bar Monday.
# The two character combinations accepted are Mo Tu We Th Fr Sa Su Wk Wd Al,
# the last two being week-end days and all 7 days of the week respectively.
# As a final example, AlFr means all days except Friday.

# топорно, но
# это просто защита от повторного запуска
# в '/etc/security/time.conf' будут добавлены искомые правила
#    # otus homework 015 conclusion
#    sshd;*;!admin&moderator;AlSaSu   <--- добавил для демонстрации
#    sshd;*;!admin&moderator;!Al      <--- добавил для демонстрации
#    login;*;!admin&moderator;AlSaSu
#    login;*;!admin&moderator;!Al

if grep -q '# otus homework 015 conclusion' /etc/security/time.conf
then
  echo "'otus homework 015 conclusion' already exists in '/etc/security/time.conf'";
else
  echo "# otus homework 015 conclusion" >> /etc/security/time.conf;
  awk -F':' '{print $1":"$4}' /etc/passwd | \
  grep `awk -F':' '/^admin:/{print $3}' /etc/group` | \
    awk -F':' '{print $1}' | \
      sed ':b;$!{N;bb};s/\n/\&/g' | \
        awk '{print "sshd;*;!"$0";AlSaSu\nsshd;*;!"$0";!Al\nlogin;*;!"$0";AlSaSu\nlogin;*;!"$0";!Al"}' \
          >> /etc/security/time.conf
fi

```

### Демонстрация запрета входа
<a name="001"></a>

```shell
[root@hw015 vagrant]# ssh moderator@localhost   <-- Пользователь moderator в группе admin.
moderator@localhost's password: 
Last login: Tue Apr 19 09:06:59 2022 from ::1   <-- Пользователь moderator аутентифицирован.
[moderator@les15 ~]$ exit
logout
Connection to localhost closed.
[root@les15 vagrant]# ssh admin@localhost       <-- Пользователь admin в группе admin.
admin@localhost's password: 
Last login: Tue Apr 19 09:06:30 2022 from ::1   <-- Пользователь admin аутентифицирован.
[admin@les15 ~]$ exit
logout
Connection to localhost closed.
[root@les15 vagrant]# ssh user001@localhost     <-- Пользователь user001 НЕ в группе admin.
user001@localhost's password: 
Authentication failed.                          <-- Пароль введен корректно, иначе бы было иное сообщение.
                                                    Пользователь user001 НЕ аутентифицирован, так как 
                                                    воскресенье и он не в группе admin.
                     
```

__Важное замечание__: cмена основной группы пользователя на admin-группу, равно как и добавление пользователя в admin-группу не означают автоматическое разрешение в `/etc/security/time.conf`. 

```shell                               
[root@hw015 vagrant]# id user001
uid=1003(user001) gid=1003(user001) groups=1003(user001) <-- Не `admin`
[root@hw015 vagrant]# usermod -g admin user001           <-- Меняем основную группу `user001` на `admin`
[root@hw015 vagrant]# id user001
uid=1003(user001) gid=1001(admin) groups=1001(admin)     <-- Да, сменили 
[root@hw015 vagrant]# ssh user001@localhost 
user001@localhost's password:                       
Authentication failed.                                   <-- Пользователь user001 НЕ аутентифицирован
[root@hw015 vagrant]# 
```

Необходимо убрать ранее сгенерированный блок конфигурации `/etc/security/time.conf` и реинициализировать его, как указанно выше.



# les14 - Docker, docker image, docker container
# Docker

Dockerfile
- Создайте свой кастомный образ nginx на базе alpine. 
- После запуска nginx должен отдавать кастомную страницу (достаточно изменить дефолтную страницу nginx)
- Определите разницу между контейнером и образом
- Вывод опишите в домашнем задании. 
- Ответьте на вопрос: Можно ли в контейнере собрать ядро?
- Собранный образ необходимо запушить в docker hub и дать ссылку на ваш репозиторий.

Docker-compose. Задание со * (звездочкой)
- Создайте кастомные образы nginx и php, объедините их в docker-compose.
- После запуска nginx должен показывать php info.
- Все собранные образы должны быть в docker hub

## Работа с Dockerfile

### Установка окружения

```shell
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker USER
sudo chown USER /var/run/docker.sock
```

### Dockerfile

```shell
FROM alpine:3.14.0 
RUN apk add nginx
# Замена дефолтной конфигурации nginx, отдающую всегда "404"
COPY host/default.conf /etc/nginx/http.d/
# Страница приветствия сайта содержит
# "I was copy into docker :)"
COPY host/index.html /var/www/default/html/
# Запуск nginx не в режиме демона, чтоб не было Exit(0)
# А как иначе?
CMD ["nginx", "-g", "daemon off;"]
```

### Запуск

```shell
docker build -t nginx_app_image .

docker images
    REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
    nginx_app_image   latest    be31271f964b   7 seconds ago   9.18MB
    alpine            latest    d4ff818577bc   3 weeks ago     5.6MB

docker run -d --name nginx_app_container -p 8081:80 nginx_app_image

docker ps
    CONTAINER ID   IMAGE             COMMAND                  CREATED         STATUS         PORTS                                   NAMES
   5be36067651c   nginx_app_image   "nginx -g 'daemon of…"   27 minutes ago   Up 27 minutes   0.0.0.0:8081->80/tcp   nginx_app_container
```

Проверка с целевой

```shell
curl localhost:8081
    I'm from docker image of nginx-node :)
```

### На заметку

Зачистка

```shell
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
```

Доступ внутрь
```shell
docker exec -it nginx_app_container /bin/sh
```

### Определите разницу между контейнером и образом

Образ содержит приложение со всем его окружением, но не содержит данных и не "знает" о взаимодействии, в частности, порт взаимодействия.

Контейнеры запускают образ с указанием параметров связи с "внешним" миром, в частности, монтирую директории с данными дают TCP-порты для взаимодействия.

### Можно ли в контейнере собрать ядро?

Собрать можно, но если не использовать монтирование данных на внешнем мире, то после перезапуска контрейнера все сотрется. Но, кажется, можно из контейнера собрать образ.

### Docker Hub

https://hub.docker.com/repository/docker/duteplyakov/nginx

```shell
docker tag nginx_app_image ilya2otus/nginx

[sotnik@sotnik2001 ~] $ docker push duteplyakov/nginx
Using default tag: latest
The push refers to repository [docker.io/duteplyakov/nginx]
7e4e5f5b763c: Preparing 
4fc242d58285: Preparing 
denied: requested access to the resource is denied


```
## Docker-compose

### Переход с предыдущего приложения

Предыдущее приложение в `docker-compose`

```shell
cd ../dockercompose.stanalone/

tree -af
    .
    ├── ./docker-compose.yml    <-- Это нововведение
    └── ./nginx                 <-- Это в прямом смысле файлы прошлого пункта `Dockerfile`
        ├── ./nginx/Dockerfile
        └── ./nginx/host
            ├── ./nginx/host/default.conf
            └── ./nginx/host/index.html
    2 directories, 4 files

cat ./docker-compose.yml 
    version: "3"
    
    services:
      nginx_node:
        image: image_nginx_node
        build: nginx/
        ports:
          - "8081:80"

docker-compose build
    Building nginx_node
    Step 1/5 : FROM alpine:3.14.0
    3.14.0: Pulling from library/alpine
    5843afab3874: Pull complete
    Digest: sha256:234cb88d3020898631af0ccbbcca9a66ae7306ecd30c9720690858c1b007d2a0
    Status: Downloaded newer image for alpine:3.14.0
     ---> d4ff818577bc
    Step 2/5 : RUN apk add nginx
     ---> Running in 41946b631816
    fetch https://dl-cdn.alpinelinux.org/alpine/v3.14/main/x86_64/APKINDEX.tar.gz
    fetch https://dl-cdn.alpinelinux.org/alpine/v3.14/community/x86_64/APKINDEX.tar.gz
    (1/2) Installing pcre (8.44-r0)
    (2/2) Installing nginx (1.20.1-r3)
    Executing nginx-1.20.1-r3.pre-install
    Executing nginx-1.20.1-r3.post-install
    Executing busybox-1.33.1-r2.trigger
    OK: 7 MiB in 16 packages
    Removing intermediate container 41946b631816
     ---> 3a96654f5ca3
    Step 3/5 : COPY host/default.conf /etc/nginx/http.d/
     ---> f6af8b6b9e3a
    Step 4/5 : COPY host/index.html /var/www/default/html/
     ---> c51a3849f750
    Step 5/5 : CMD ["nginx", "-g", "daemon off;"]
     ---> Running in 69876af64ee8
    Removing intermediate container 69876af64ee8
     ---> cf328d7dd5bc
    Successfully built cf328d7dd5bc
    Successfully tagged image_nginx_node:latest

docker-compose up -d 
    Creating network "dockercomposestanalone_default" with the default driver
    Creating dockercomposestanalone_nginx_node_1 ... done

curl localhost:8081
    I'm from docker image of nginx-node :)b
```
### Реализация итогового варианта

```shell
tree -af
    .
    ├── ./docker-compose.yml
    ├── ./nginx             <-- нода с `nginx`
    │   ├── ./nginx/Dockerfile
    │   ├── ./nginx/host
    │   │   ├── ./nginx/host/default.conf
    │   │   └── ./nginx/host/index.html
    │   └── ./nginx/var-logs-nginx <-- это автоматически монтируемая с образа директория
    │       ├── ./nginx/var-logs-nginx/access.log
    │       └── ./nginx/var-logs-nginx/error.log
    └── ./php               <-- нода с `php-fpm` работающего по TCP-протоколу
        ├── ./php/Dockerfile
        ├── ./php/host
        │   └── ./php/host/index.php
        └── ./php/var-logs-php7 <-- это автоматически монтируемая с образа директория
            └── ./php/var-logs-php7/error.log
    6 directories, 9 files

cat docker-compose.yml 
    version: "2"    <-- ВНИМАНИЕ: Иначе ERROR: The Compose file './docker-compose.yml' is invalid because:
                        networks.internal.ipam.config value Additional properties are not allowed ('gateway' was unexpected)
    services:
      nginx_node:
        image: image_nginx
        container_name: container_nginx
        build: nginx/
        ports:
          - "8081:80"
        volumes:
          - "./var-logs-nginx:/var/log/nginx"
        networks:
          internal:
            ipv4_address: 172.16.1.2    <-- IP, с которого будут идти запросы к PHP-FPM
                                            Он также с целью безопасности зафиксирован 
                                            как единственный клиент PHP-FPM
      php_node:
        image: image_php
        container_name: container_php
        build: php/
        ports:
          - "9000:9000"
        volumes:
          - "./var-logs-php7:/var/log/php7"
        networks:
          internal:
            ipv4_address: 172.16.1.7     <-- IP сервиса PHP-FPM
    networks:
        internal:
          driver: bridge
          ipam:
            driver: default
            config:
              -
                subnet: 172.16.1.0/24
                gateway: 172.16.1.1
```

#### Nginx-нода

```shell
cat nginx/Dockerfile <-- файл не менялся
    FROM alpine:3.14.0
    RUN apk add nginx
    # Замена дефолтной конфигурации nginx, отдающую всегда "404"
    COPY host/default.conf /etc/nginx/http.d/
    # Страница приветствия сайта
    COPY host/index.html /var/www/default/html/
    # Запуск nginx не в режиме демона, чтоб не было Exit(0)
    CMD ["nginx", "-g", "daemon off;"]

cat nginx/host/default.conf 
    server {
        listen 80 default_server;
    
        root /var/www/default/html/;
        index index.html index.htm;           <-- Статика на Nginx-ноде
    
        server_name 172.16.1.2;               <-- Зафиксировали
        location ~ \.php$ {
            fastcgi_pass 172.16.1.7:9000;     <-- Вот сюда будет обращаться Nginx за PHP файлами и динамикой
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_buffers 256 128k;
            fastcgi_connect_timeout 300s;
            fastcgi_send_timeout 300s;
            fastcgi_read_timeout 300s;
            include fastcgi_params;
        }
    }
    
cat nginx/host/index.html 
    I'm fom docker image of nginx-node :)
```

#### PHP-FPM нода

```shell
cat php/Dockerfile 
    FROM alpine:3.14.0
    RUN apk add php
    RUN apk add php-fpm
    # 172.16.1.7:9000 - Где работает php-fpm 
    RUN sed -i "s@127.0.0.1:9000@172.16.1.7:9000@g" /etc/php7/php-fpm.d/www.conf
    # В целях безопасности только 172.16.1.2 может обратиться к php-fpm
    RUN sed -i "s@;listen.allowed_clients = 127.0.0.1@listen.allowed_clients = 172.16.1.2@g" /etc/php7/php-fpm.d/www.conf
    # Тут будет phpinfo
    COPY host/index.php /var/www/default/html/
    # Запуск НЕ в режиме демона
    CMD ["/usr/sbin/php-fpm7", "-F", "-c", "/etc/php7/php-fpm.conf"]
 
cat php/host/index.php 
    <?php phpinfo(); ?>
```

### Проверка работоспособности

```shell
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q)

docker-compose build
    ...
    
docker images
    REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
    image_php     latest    409badea838a   2 seconds ago    27.6MB
    image_nginx   latest    ee41ee14549f   13 seconds ago   9.18MB
    alpine        3.14.0    d4ff818577bc   3 weeks ago      5.6MB

docker-compose up -d 
    Creating container_php   ... done
    Creating container_nginx ... done

docker ps
    CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                                       NAMES
    b2d3b2f68f43   image_nginx   "nginx -g 'daemon of…"   15 seconds ago   Up 13 seconds   0.0.0.0:8081->80/tcp, :::8081->80/tcp       container_nginx
    7e1ccf951336   image_php     "/usr/sbin/php-fpm7 …"   15 seconds ago   Up 13 seconds   0.0.0.0:9000->9000/tcp, :::9000->9000/tcp   container_php

curl localhost:8081
    I'm fom docker image of nginx-node :)

curl -I localhost:8081/index.php
    HTTP/1.1 200 OK
    Server: nginx
    Date: Thu, 08 Jul 2021 22:59:21 GMT
    Content-Type: text/html; charset=UTF-8
    Connection: keep-alive
    X-Powered-By: PHP/7.4.21 <-- PHP

curl localhost:8081/index.php
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml"><head>
    <style type="text/css">
    body {background-color: #fff; color: #222; font-family: sans-serif;}
    pre {margin: 0; font-family: monospace;}
    ...

docker tag image_nginx ilya2otus/image_nginx --> https://hub.docker.com/repository/docker/ilya2otus/image_nginx 
docker push ilya2otus/image_nginx

docker tag image_php ilya2otus/image_php     --> https://hub.docker.com/repository/docker/ilya2otus/image_php
docker push ilya2otus/image_php
```





- Ссылки на образы

> https://hub.docker.com/repository/docker/duteplyakov/nginx  
> https://hub.docker.com/repository/docker/duteplyakov/php-fpm

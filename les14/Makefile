.PHONY: deploy_all

deploy_all: build deploy

# Build

build: build_nginx build_php-fpm

build_nginx:
	cd nginx && docker build -t duteplyakov/nginx:v2 .

build_php-fpm:
	cd php-fpm && docker build -t duteplyakov/php-fpm:v1 .


# Push

push: push_nginx push_php-fpm 

push_nginx:
	docker push duteplyakov/nginx:v2

push_php-fpm:
	docker push duteplyakov/php-fpm:v1


# Deploy

deploy:
	docker-compose up -d

# Destroy

destroy:
	docker-compose down

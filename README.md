# learning-docker
doc for training docker 
## Basic Docker command

แสดง version ของ docker
```sh
docker version
```
แสดงคำสั่งแบบย่อ
```sh
docker -v
```
```sh
docker run nginx
```
```sh
docker run -d nginx
```
```sh
docker run -d --name web nginx
```

docker run -d --name $container_name -p $host_port:$container_port $container_image:$tag_version
> สามารถหาข้อมูเรื่องดังกล่าวจาก docker hub

```
docker run -d --name web1 -p 8888:80 nginx:1.24 
```

### check container status running or stop
```
docker ps
```

```
docker ps -a
```

```
docker stop web1
```

```
docker start web1
```

```
docker logs web1
```

```
docker logs -f web1
```

```
docker logs -n 10 web1
```

```
docker exec web1 date
```

```
docker exec web1 whoami
```

```
docker exec web1 uname -a
```

docker rm $container_name

## Example1
```
docker run --name web-ex1 -d -p 8081:80 nginx
```
```
docker ps
```
```
docker stop web-ex1
```
```
docker ps -a web-ex1
```
```
docker start web-ex1
```
```
docker logs web-ex1
```
```
docker logs -f web-ex1
```
```
docker ps
```
```
docker stop web-ex1
```
```
docker ps -a
```
```
docker rm web-ex1
```
```
docker ps -a
```
## Example2
```
docker run --rm --name web-ex2 -d -p 8082:80 nginx
```
```
docker ps
```
```
docker stop web-ex1
```
```
docker ps -a web-ex1
```
## Example3
```
docker run --name web-ex3 -d -p 8083:80 nginx
```
```
docker exec -it web-ex3 /bin/sh
```
```
bash
cd /usr/share/nginx/html/
date
today=`date`
echo "<h1>$today</h1>" > index.html
exit
exit
```
```
docker stop web-ex3
```
```
docker start web-ex3
```
```
docker rm web-ex3
```
```
docker run --rm --name web-ex3 -d -p 8083:80 nginx
```
> หลังจากใช้งานคำสั่งเดิมแล้วจะพบว่าไม่มีการเก็บข้อมูลที่ได้ทำการแก้ไขก่อนหน้านี้
```
docker stop web-ex3
docker ps -a
```
```
docker run --rm --name web-ex3 -d -p 8083:80 -v $(pwd)/pokemon/type1/:/usr/share/nginx/html nginx
```
> ได้ทำการ mapping directory /pokemon/type1/ ไปยัง directory /usr/share/nginx/html 
```
docker stop web-ex3
docker run --rm --name web-ex3 -d -p 8083:80 -v $(pwd)/pokemon/type1/:/usr/share/nginx/html nginx
```
> หลังจากทำลาย container และสร้างใหม่จะพบว่าข้อมูลยังคงอยูาเหมือนเดิม
```
docker stop web-ex3
```
## Example4
```
docker run --rm --name web-ex4 -d -p 8084:80 -v volex4:/usr/share/nginx/html nginx
```
```
docker cp pokemon/type1/ web-ex4:/usr/share/nginx/html
```
```
docker exec -it web-ex4 ls /usr/share/nginx/html/type1
```
> ทำการตรวจสอบไฟล์ใน directory /usr/share/nginx/html/ 
```
docker stop web-ex4
```
```
docker run --rm --name web-ex4 -d -p 8084:80 -v volex4:/usr/share/nginx/html nginx
```
```
docker stop web-ex4
```
```
docker volume ls
docker volume rm volex4
```
```
docker run --rm --name web-ex4 -d -p 8084:80 -v vol4:/usr/share/nginx/html nginx
docker exec -it web-ex4 ls /usr/share/nginx/html/
```
```
docker stop web-ex4
docker volume rm vol4
```
## Example5
```sh
docker run --name wp-mysql -e MYSQL_USER=wpadmin -e MYSQL_DATABASE=wordpress -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=password -v vol5:/var/lib/mysql -d mysql:5.7
```
```
docker run --name phpmyadmin -d --link wp-mysql:db -e PMA_HOST=wp-mysql -e PMA_ARBITRARY=1 -p 8055:80 phpmyadmin/phpmyadmin 
```
```
docker run --name mywp --link wp-mysql:mysql -p 8085:80 -e WORDPRESS_DB_HOST=wp-mysql -e WORDPRESS_DB_USER=wpadmin -e WORDPRESS_DB_PASSWORD=pa
ssword -e WORDPRESS_DB_NAME=wordpress -d wordpress
```
```
docker stop mywp
docker rm mywp
docker stop phpmyadmin
docker rm phpmyadmin
docker stop wp-mysql
docker rm wp-mysql
docker volume rm vol5
```
## Docker Compose
```
docker compose version
```
```
mkdir wordpress
cd wordpress
touch docker-compose.yaml
```
```yaml
version: '3.1'

services:

  wordpress:
    image: wordpress
    restart: always
    ports:
      - 8090:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wpdb
      WORDPRESS_DB_PASSWORD: password
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - wordpress:/var/www/html
    depends_on:
      - db

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wpdb
      MYSQL_PASSWORD: password
      MYSQL_ROOT_PASSWORD: password
    volumes:
      - db:/var/lib/mysql

volumes:
  wordpress:
  db:

networks:
    default:
        external: true
        name: wpnet
```
```sh
docker network create wpnet
```
```sh
docker compose up -d
```
```sh
docker compose down
```
```sh
docker compose up -d
docker compose down -v
docker compose up -d
```
```sh 
docker compose logs
docker compose logs wordpress
docker compose logs db
```

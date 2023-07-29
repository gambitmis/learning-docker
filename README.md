# learning-docker
doc for training docker 
## Basic Docker command

แสดง version ของ docker
```
docker version
```
แสดงคำสั่งแบบย่อ
```
docker -v
```

```
docker run nginx
```

```
docker run -d nginx
```

```
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
> หลังจากทำลาย container และสร้างใหม่จะพบว่าข้อมูลยังคงอยูาเหมือนเดิมgit 
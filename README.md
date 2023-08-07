# learning-docker
doc for training docker 
## Basic Docker command

แสดง version ของ docker
```sh
docker version
```
<details><summary>Result</summary><p>

```javascript
 Client: Docker Engine - Community
 Version:           23.0.2
 API version:       1.42
 Go version:        go1.19.7
 Git commit:        569dd73
 Built:             Mon Mar 27 16:16:18 2023
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          23.0.2
  API version:      1.42 (minimum version 1.12)
  Go version:       go1.19.7
  Git commit:       219f21b
  Built:            Mon Mar 27 16:16:18 2023
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.20
  GitCommit:        2806fc1057397dbaeefbea0e4e17bddfbd388f38
 runc:
  Version:          1.1.5
  GitCommit:        v1.1.5-0-gf19387a
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```
</p></details>
<br> 
แสดงคำสั่งแบบย่อ
<br>

```sh
docker -v
``` 
<details><summary>Result</summary><p>

```javascript
Docker version 23.0.2, build 569dd73
```

</p></details><br>

```sh
docker run nginx
```
<details><summary>Result</summary><p>

```javascript
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/04 08:31:10 [notice] 1#1: using the "epoll" event method
2023/08/04 08:31:10 [notice] 1#1: nginx/1.25.1
2023/08/04 08:31:10 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2023/08/04 08:31:10 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/04 08:31:10 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/04 08:31:10 [notice] 1#1: start worker processes
2023/08/04 08:31:10 [notice] 1#1: start worker process 29
2023/08/04 08:31:10 [notice] 1#1: start worker process 30
2023/08/04 08:31:19 [notice] 1#1: signal 28 (SIGWINCH) received
```
</p></details><br>

```sh
docker run -d nginx
```
<details><summary>Result</summary><p>

```
f40813c01a0bef4f054316618d67a3815af1b387a71559d6625e09b08686fe86
```

</p></details><br>

```sh
docker run -d --name web nginx
```
<details><summary>Result</summary><p>

```javascript
b54da587b90e2ab7ac110d3c68501efbac07860c29468647dbfbcef9a81c017a
```

</p></details><br>

docker run -d --name $container_name -p $host_port:$container_port $container_image:$tag_version
> สามารถหาข้อมูเรื่องดังกล่าวจาก docker hub

```
docker run -d --name web1 -p 8888:80 nginx:1.24 
```

<details><summary>Result</summary><p>

```javascript
Unable to find image 'nginx:1.24' locally
1.24: Pulling from library/nginx
1d5252f66ea9: Pull complete 
042c30816db6: Pull complete 
d9df362538bd: Pull complete 
964e3b6bbd01: Pull complete 
cf66a9512a90: Pull complete 
223ad801e10f: Pull complete 
Digest: sha256:57e42e00530faa65e8acf98c3cf7bf6794093a9841c8a676b6d2fd0a9ba7262f
Status: Downloaded newer image for nginx:1.24
ab01ec5c4718976c6623dc1dcdd6bcf6838a16303f75dbefe76fcd7dca80355a
```

</p></details><br>

### check container status running or stop
```
docker ps
```

<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED              STATUS              PORTS                                       NAMES
ab01ec5c4718   nginx:1.24              "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:8888->80/tcp, :::8888->80/tcp       web1
```

</p></details><br>


```
docker ps -a
```

<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED              STATUS              PORTS                                       NAMES
ab01ec5c4718   nginx:1.24              "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:8888->80/tcp, :::8888->80/tcp       web1
```

</p></details><br>

```
docker stop web1
```

<details><summary>Result</summary><p>

```javascript
web1
```

</p></details><br>


```
docker start web1
```

<details><summary>Result</summary><p>

```javascript
web1
```

</p></details><br>


```
docker logs web1
```

<details><summary>Result</summary><p>

```javascript
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/04 10:33:58 [notice] 1#1: using the "epoll" event method
2023/08/04 10:33:58 [notice] 1#1: nginx/1.24.0
2023/08/04 10:33:58 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/08/04 10:33:58 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/04 10:33:58 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/04 10:33:58 [notice] 1#1: start worker processes
2023/08/04 10:33:58 [notice] 1#1: start worker process 29
2023/08/04 10:33:58 [notice] 1#1: start worker process 30
2023/08/04 10:37:34 [notice] 1#1: signal 3 (SIGQUIT) received, shutting down
2023/08/04 10:37:34 [notice] 30#30: gracefully shutting down
2023/08/04 10:37:34 [notice] 29#29: gracefully shutting down
2023/08/04 10:37:34 [notice] 30#30: exiting
2023/08/04 10:37:34 [notice] 29#29: exiting
2023/08/04 10:37:34 [notice] 30#30: exit
2023/08/04 10:37:34 [notice] 29#29: exit
2023/08/04 10:37:34 [notice] 1#1: signal 17 (SIGCHLD) received from 30
2023/08/04 10:37:34 [notice] 1#1: worker process 30 exited with code 0
2023/08/04 10:37:34 [notice] 1#1: signal 17 (SIGCHLD) received from 29
2023/08/04 10:37:34 [notice] 1#1: worker process 29 exited with code 0
2023/08/04 10:37:34 [notice] 1#1: exit
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: IPv6 listen already enabled
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/04 10:38:14 [notice] 1#1: using the "epoll" event method
2023/08/04 10:38:14 [notice] 1#1: nginx/1.24.0
2023/08/04 10:38:14 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/08/04 10:38:14 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/04 10:38:14 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/04 10:38:14 [notice] 1#1: start worker processes
2023/08/04 10:38:14 [notice] 1#1: start worker process 22
2023/08/04 10:38:14 [notice] 1#1: start worker process 23
```

</p></details><br>


```
docker logs -f web1
```

<details><summary>Result</summary><p>

```javascript
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/04 10:33:58 [notice] 1#1: using the "epoll" event method
2023/08/04 10:33:58 [notice] 1#1: nginx/1.24.0
2023/08/04 10:33:58 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/08/04 10:33:58 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/04 10:33:58 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/04 10:33:58 [notice] 1#1: start worker processes
2023/08/04 10:33:58 [notice] 1#1: start worker process 29
2023/08/04 10:33:58 [notice] 1#1: start worker process 30
2023/08/04 10:37:34 [notice] 1#1: signal 3 (SIGQUIT) received, shutting down
2023/08/04 10:37:34 [notice] 30#30: gracefully shutting down
2023/08/04 10:37:34 [notice] 29#29: gracefully shutting down
2023/08/04 10:37:34 [notice] 30#30: exiting
2023/08/04 10:37:34 [notice] 29#29: exiting
2023/08/04 10:37:34 [notice] 30#30: exit
2023/08/04 10:37:34 [notice] 29#29: exit
2023/08/04 10:37:34 [notice] 1#1: signal 17 (SIGCHLD) received from 30
2023/08/04 10:37:34 [notice] 1#1: worker process 30 exited with code 0
2023/08/04 10:37:34 [notice] 1#1: signal 17 (SIGCHLD) received from 29
2023/08/04 10:37:34 [notice] 1#1: worker process 29 exited with code 0
2023/08/04 10:37:34 [notice] 1#1: exit
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: IPv6 listen already enabled
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/04 10:38:14 [notice] 1#1: using the "epoll" event method
2023/08/04 10:38:14 [notice] 1#1: nginx/1.24.0
2023/08/04 10:38:14 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/08/04 10:38:14 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/04 10:38:14 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/04 10:38:14 [notice] 1#1: start worker processes
2023/08/04 10:38:14 [notice] 1#1: start worker process 22
2023/08/04 10:38:14 [notice] 1#1: start worker process 23
```

</p></details><br>


```
docker logs -n 10 web1
```

<details><summary>Result</summary><p>

```javascript
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/04 10:38:14 [notice] 1#1: using the "epoll" event method
2023/08/04 10:38:14 [notice] 1#1: nginx/1.24.0
2023/08/04 10:38:14 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/08/04 10:38:14 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/04 10:38:14 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/04 10:38:14 [notice] 1#1: start worker processes
2023/08/04 10:38:14 [notice] 1#1: start worker process 22
2023/08/04 10:38:14 [notice] 1#1: start worker process 23
```

</p></details><br>


```
docker exec web1 date
```
<details><summary>Result</summary><p>

```javascript
root@DGA-NON-IT-021:/home/dgadmin/learning-docker# docker exec web1 date
Fri Aug  4 10:40:14 UTC 2023
```

</p></details><br>

```
docker exec web1 whoami
```
<details><summary>Result</summary><p>

```javascript
root
```

</p></details><br>

```
docker exec web1 uname -a
```
<details><summary>Result</summary><p>

```javascript
Linux ab01ec5c4718 5.4.0-88-generic #99-Ubuntu SMP Thu Sep 23 17:29:00 UTC 2021 x86_64 GNU/Linux
```

</p></details><br>

docker rm $container_name

## Example1
```
docker run --name web-ex1 -d -p 8081:80 nginx
```
<details><summary>Result</summary><p>

```javascript
93a4fb9a158ae2e0774bcc06dd6a00df70c110ef6756635b16ecffd3bcda9932 (#contaoner id)
```

</p></details><br>

```
docker ps
```
<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED              STATUS              PORTS                                       NAMES
93a4fb9a158a   nginx                   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:8081->80/tcp, :::8081->80/tcp       web-ex1
```

</p></details><br>

```
docker stop web-ex1
```
<details><summary>Result</summary><p>

```javascript
web-ex1
```

</p></details><br>

```
docker ps -a | grep web-ex1
```
<details><summary>Result</summary><p>

```javascript
93a4fb9a158a   nginx                   "/docker-entrypoint.…"   7 minutes ago   Exited (0) 4 minutes ago                                               web-ex1
```

</p></details><br>

```
docker start web-ex1
```
<details><summary>Result</summary><p>

```javascript
web-ex1
```

</p></details><br>

```
docker logs web-ex1
```
<details><summary>Result</summary><p>

```javascript
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/07 03:11:47 [notice] 1#1: using the "epoll" event method
2023/08/07 03:11:47 [notice] 1#1: nginx/1.25.1
2023/08/07 03:11:47 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2023/08/07 03:11:47 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/07 03:11:47 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/07 03:11:47 [notice] 1#1: start worker processes
2023/08/07 03:11:47 [notice] 1#1: start worker process 30
2023/08/07 03:11:47 [notice] 1#1: start worker process 31
2023/08/07 03:14:19 [notice] 1#1: signal 3 (SIGQUIT) received, shutting down
2023/08/07 03:14:19 [notice] 31#31: gracefully shutting down
2023/08/07 03:14:19 [notice] 30#30: gracefully shutting down
2023/08/07 03:14:19 [notice] 31#31: exiting
2023/08/07 03:14:19 [notice] 30#30: exiting
2023/08/07 03:14:19 [notice] 31#31: exit
2023/08/07 03:14:19 [notice] 30#30: exit
2023/08/07 03:14:19 [notice] 1#1: signal 17 (SIGCHLD) received from 31
2023/08/07 03:14:19 [notice] 1#1: worker process 31 exited with code 0
2023/08/07 03:14:19 [notice] 1#1: worker process 30 exited with code 0
2023/08/07 03:14:19 [notice] 1#1: exit
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: IPv6 listen already enabled
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/07 03:20:28 [notice] 1#1: using the "epoll" event method
2023/08/07 03:20:28 [notice] 1#1: nginx/1.25.1
2023/08/07 03:20:28 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2023/08/07 03:20:28 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/07 03:20:28 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/07 03:20:28 [notice] 1#1: start worker processes
2023/08/07 03:20:28 [notice] 1#1: start worker process 22
2023/08/07 03:20:28 [notice] 1#1: start worker process 23
```

</p></details><br>

```
docker logs -f web-ex1
```
<details><summary>Result</summary><p>

```javascript
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/07 03:11:47 [notice] 1#1: using the "epoll" event method
2023/08/07 03:11:47 [notice] 1#1: nginx/1.25.1
2023/08/07 03:11:47 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2023/08/07 03:11:47 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/07 03:11:47 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/07 03:11:47 [notice] 1#1: start worker processes
2023/08/07 03:11:47 [notice] 1#1: start worker process 30
2023/08/07 03:11:47 [notice] 1#1: start worker process 31
2023/08/07 03:14:19 [notice] 1#1: signal 3 (SIGQUIT) received, shutting down
2023/08/07 03:14:19 [notice] 31#31: gracefully shutting down
2023/08/07 03:14:19 [notice] 30#30: gracefully shutting down
2023/08/07 03:14:19 [notice] 31#31: exiting
2023/08/07 03:14:19 [notice] 30#30: exiting
2023/08/07 03:14:19 [notice] 31#31: exit
2023/08/07 03:14:19 [notice] 30#30: exit
2023/08/07 03:14:19 [notice] 1#1: signal 17 (SIGCHLD) received from 31
2023/08/07 03:14:19 [notice] 1#1: worker process 31 exited with code 0
2023/08/07 03:14:19 [notice] 1#1: worker process 30 exited with code 0
2023/08/07 03:14:19 [notice] 1#1: exit
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: IPv6 listen already enabled
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/08/07 03:20:28 [notice] 1#1: using the "epoll" event method
2023/08/07 03:20:28 [notice] 1#1: nginx/1.25.1
2023/08/07 03:20:28 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2023/08/07 03:20:28 [notice] 1#1: OS: Linux 5.4.0-88-generic
2023/08/07 03:20:28 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/08/07 03:20:28 [notice] 1#1: start worker processes
2023/08/07 03:20:28 [notice] 1#1: start worker process 22
2023/08/07 03:20:28 [notice] 1#1: start worker process 23
```

</p></details><br>

```
docker ps
```
<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS         PORTS                                       NAMES
93a4fb9a158a   nginx                   "/docker-entrypoint.…"   11 minutes ago   Up 2 minutes   0.0.0.0:8081->80/tcp, :::8081->80/tcp       web-ex1
```

</p></details><br>

```
docker stop web-ex1
```
<details><summary>Result</summary><p>

```javascript
web-ex1
```

</p></details><br>

```
docker ps -a
```
<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS                      PORTS                                       NAMES
93a4fb9a158a   nginx                   "/docker-entrypoint.…"   12 minutes ago   Exited (0) 33 seconds ago                                               web-ex1
```

</p></details><br>

```
docker rm web-ex1
```
<details><summary>Result</summary><p>

```javascript
web-ex1
```

</p></details><br>

```
docker ps -a
```
<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED        STATUS                  PORTS                                       NAMES
```

</p></details><br>

## Example2
```
docker run --rm --name web-ex2 -d -p 8082:80 nginx
```
<details><summary>Result</summary><p>

```javascript
33fc43cb0b5bcece04e7e79979bb39ebabc294ca53fb89ba881a250611e34220
```

</p></details><br>

```
docker ps
```
<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                                       NAMES
33fc43cb0b5b   nginx                   "/docker-entrypoint.…"   21 seconds ago   Up 19 seconds   0.0.0.0:8082->80/tcp, :::8082->80/tcp       web-ex2
```

</p></details><br>

```
docker stop web-ex2
```
<details><summary>Result</summary><p>

```javascript
web-ex2
```

</p></details><br>

```
docker ps -a web-ex2
```
<details><summary>Result</summary><p>

```javascript
33fc43cb0b5b   nginx                   "/docker-entrypoint.…"   7 minutes ago   Exited (0) 4 minutes ago                                               web-ex2
```

</p></details><br>

## Example3
```
docker run --name web-ex3 -d -p 8083:80 nginx
```
<details><summary>Result</summary><p>

```javascript
1c30d67a070ba89b5b8498c536a76924915708a3c259850982fe19a0a6a2874f
```

</p></details><br>

```
docker exec -it web-ex3 /bin/sh
```
<details><summary>Result</summary><p>

```javascript
#
```

</p></details><br>

```
bash
cd /usr/share/nginx/html/
date
today=`date`
echo "<h1>$today</h1>" > index.html
exit
exit
```
<details><summary>Result</summary><p>

```javascript
Mon Aug  7 03:59:24 UTC 2023
```

</p></details><br>

```
docker stop web-ex3
```
<details><summary>Result</summary><p>

```javascript
web-ex3
```

</p></details><br>

```
docker start web-ex3
```
<details><summary>Result</summary><p>

```javascript
web-ex3
```

</p></details><br>

```
docker stop web-ex3
```
<details><summary>Result</summary><p>

```javascript
web-ex3
```

</p></details><br>

```
docker rm web-ex3
```
<details><summary>Result</summary><p>

```javascript
web-ex3
```

</p></details><br>

```
docker run --rm --name web-ex3 -d -p 8083:80 nginx
```
<details><summary>Result</summary><p>

```javascript
ec7be3f0aea7c20edb37c8dbc963da501f34b5f652e1b8f43170a0b3224478f6
```

</p></details><br>

> หลังจากใช้งานคำสั่งเดิมแล้วจะพบว่าไม่มีการเก็บข้อมูลที่ได้ทำการแก้ไขก่อนหน้านี้
```
docker stop web-ex3
docker ps -a
```
<details><summary>Result</summary><p>

```javascript
docker stop web-ex3
web-ex3
root@DGA-NON-IT-021:/home/dgadmin/learning-docker# docker ps -a
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS                    PORTS                                       NAMES
1c30d67a070b   nginx                   "/docker-entrypoint.…"   34 minutes ago   Exited (0) 1 second ago                                               web-ex3
```

</p></details><br>

```
docker run --rm --name web-ex3 -d -p 8083:80 -v $(pwd)/pokemon/type1/:/usr/share/nginx/html nginx
```
<details><summary>Result</summary><p>

```javascript
9a868abb5b56260cee42a182ec595ac4c63ebe0ab8a2e6785d17af299bbdd94a
```

</p></details><br>


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
<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS         PORTS                                       NAMES
7b37cb207bd0   nginx                   "/docker-entrypoint.…"   6 seconds ago   Up 4 seconds   0.0.0.0:8084->80/tcp, :::8084->80/tcp       web-ex4
```

</p></details><br>

```
docker cp pokemon/type1/ web-ex4:/usr/share/nginx/html
```
<details><summary>Result</summary><p>

```javascript
Successfully copied 250.4kB to web-ex4:/usr/share/nginx/htmx4
```

</p></details><br>

```
docker exec -it web-ex4 ls /usr/share/nginx/html/type1
```
<details><summary>Result</summary><p>

```javascript
root@DGA-NON-IT-021:/home/dgadmin/learning-docker# docker exec -it web-ex4 ls /usr/share/nginx/html/type1
dockerfile  index.html  mon1.png  mon2.png  mon3.gif  mon4.gif  pokemon-type.jpg  style1.css
```

</p></details><br>

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
```
<details><summary>Result</summary><p>

```javascript
DRIVER    VOLUME NAME
local     volex4
```

</p></details><br>

```
docker volume rm volex4
```
<details><summary>Result</summary><p>

```javascript
DRIVER    VOLUME NAME
```

</p></details><br>

```
docker run --rm --name web-ex4 -d -p 8084:80 -v vol4:/usr/share/nginx/html nginx
docker exec -it web-ex4 ls /usr/share/nginx/html/
```
<details><summary>Result</summary><p>

```javascript
docker run --rm --name web-ex4 -d -p 8084:80 -v vol4:/usr/share/nginx/html nginx
-ex4 ls /usr/share/nginx/html/1eecccd0d1515eb5983f801632e8d2968ba708ee766eb4c9b65fda44c12205fc

root@DGA-NON-IT-021:/home/dgadmin/learning-docker# docker exec -it web-ex4 ls /usr/share/nginx/html/
50x.html  index.html
```

</p></details><br>

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
docker run --name mywp --link wp-mysql:mysql -p 8085:80 -e WORDPRESS_DB_HOST=wp-mysql -e WORDPRESS_DB_USER=wpadmin -e WORDPRESS_DB_PASSWORD=password -e WORDPRESS_DB_NAME=wordpress -d wordpress
```
<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS              PORTS                                       NAMES
3bb2c69ad3d5   wordpress               "docker-entrypoint.s…"   2 minutes ago   Up About a minute   0.0.0.0:8085->80/tcp, :::8085->80/tcp       mywp
b02982e489f5   phpmyadmin/phpmyadmin   "/docker-entrypoint.…"   4 minutes ago   Up 4 minutes        0.0.0.0:8055->80/tcp, :::8055->80/tcp       phpmyadmin
439db9414555   mysql:5.7               "docker-entrypoint.s…"   6 minutes ago   Up 6 minutes        3306/tcp, 33060/tcp                         wp-mysql
```

</p></details><br>

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
<details><summary>Result</summary><p>

```javascript
Docker Compose version v2.17.2
```

</p></details><br>

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

<details><summary>Result</summary><p>

```javascript
[+] Running 4/4
 ✔ Volume "wordpress_wordpress"     Created                                                                                                                                                                            0.0s 
 ✔ Volume "wordpress_db"            Created                                                                                                                                                                            0.0s 
 ✔ Container wordpress-db-1         Started                                                                                                                                                                            0.8s 
 ✔ Container wordpress-wordpress-1  Started                                                                                                                                                                            1.8s
```

</p></details><br>

```sh 
docker compose logs
docker compose logs wordpress
docker compose logs db
```
<details><summary>Result</summary><p>

```javascript
docker compose logs
docker compose logs dbwordpress-wordpress-1  | WordPress not found in /var/www/html - copying now...
wordpress-wordpress-1  | Complete! WordPress has been successfully copied to /var/www/html
wordpress-wordpress-1  | No 'wp-config.php' found in /var/www/html, but 'WORDPRESS_...' variables supplied; copying 'wp-config-docker.php' (WORDPRESS_DB_HOST WORDPRESS_DB_NAME WORDPRESS_DB_PASSWORD WORDPRESS_DB_USER)
wordpress-wordpress-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.23.0.3. Set the 'ServerName' directive globally to suppress this message
wordpress-wordpress-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.23.0.3. Set the 'ServerName' directive globally to suppress this message
wordpress-wordpress-1  | [Mon Aug 07 05:05:33.435232 2023] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.56 (Debian) PHP/8.0.29 configured -- resuming normal operations
wordpress-wordpress-1  | [Mon Aug 07 05:05:33.435678 2023] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
wordpress-db-1         | 2023-08-07 05:05:29+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 5.7.42-1.el7 started.
wordpress-db-1         | 2023-08-07 05:05:29+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
wordpress-db-1         | 2023-08-07 05:05:30+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 5.7.42-1.el7 started.
wordpress-db-1         | 2023-08-07 05:05:30+00:00 [Note] [Entrypoint]: Initializing database files
wordpress-db-1         | 2023-08-07T05:05:30.428600Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
wordpress-db-1         | 2023-08-07T05:05:30.750914Z 0 [Warning] InnoDB: New log files created, LSN=45790
wordpress-db-1         | 2023-08-07T05:05:30.807077Z 0 [Warning] InnoDB: Creating foreign key constraint system tables.
wordpress-db-1         | 2023-08-07T05:05:30.867811Z 0 [Warning] No existing UUID has been found, so we assume that this is the first time that this server has been started. Generating a new UUID: 081fb341-34e0-11ee-b169-0242ac170002.
wordpress-db-1         | 2023-08-07T05:05:30.872177Z 0 [Warning] Gtid table is not ready to be used. Table 'mysql.gtid_executed' cannot be opened.
wordpress-db-1         | 2023-08-07T05:05:31.176260Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1         | 2023-08-07T05:05:31.176341Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1         | 2023-08-07T05:05:31.177279Z 0 [Warning] CA certificate ca.pem is self signed.
wordpress-db-1         | 2023-08-07T05:05:31.364126Z 1 [Warning] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
wordpress-db-1         | 2023-08-07 05:05:34+00:00 [Note] [Entrypoint]: Database files initialized
wordpress-db-1         | 2023-08-07 05:05:34+00:00 [Note] [Entrypoint]: Starting temporary server
wordpress-db-1         | 2023-08-07 05:05:34+00:00 [Note] [Entrypoint]: Waiting for server startup
wordpress-db-1         | 2023-08-07T05:05:35.059476Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
wordpress-db-1         | 2023-08-07T05:05:35.062648Z 0 [Note] mysqld (mysqld 5.7.42) starting as process 124 ...
wordpress-db-1         | 2023-08-07T05:05:35.069378Z 0 [Note] InnoDB: PUNCH HOLE support available
wordpress-db-1         | 2023-08-07T05:05:35.069406Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
wordpress-db-1         | 2023-08-07T05:05:35.069415Z 0 [Note] InnoDB: Uses event mutexes
wordpress-db-1         | 2023-08-07T05:05:35.069419Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
wordpress-db-1         | 2023-08-07T05:05:35.069423Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
wordpress-db-1         | 2023-08-07T05:05:35.069429Z 0 [Note] InnoDB: Using Linux native AIO
wordpress-db-1         | 2023-08-07T05:05:35.069895Z 0 [Note] InnoDB: Number of pools: 1
wordpress-db-1         | 2023-08-07T05:05:35.070099Z 0 [Note] InnoDB: Using CPU crc32 instructions
wordpress-db-1         | 2023-08-07T05:05:35.074481Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
wordpress-db-1         | 2023-08-07T05:05:35.090497Z 0 [Note] InnoDB: Completed initialization of buffer pool
wordpress-db-1         | 2023-08-07T05:05:35.094044Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
wordpress-db-1         | 2023-08-07T05:05:35.108850Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
wordpress-db-1         | 2023-08-07T05:05:35.122082Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
wordpress-db-1         | 2023-08-07T05:05:35.122406Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
wordpress-db-1         | 2023-08-07T05:05:35.183633Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
wordpress-db-1         | 2023-08-07T05:05:35.185470Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
wordpress-db-1         | 2023-08-07T05:05:35.185494Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
wordpress-db-1         | 2023-08-07T05:05:35.185853Z 0 [Note] InnoDB: Waiting for purge to start
wordpress-db-1         | 2023-08-07T05:05:35.236041Z 0 [Note] InnoDB: 5.7.42 started; log sequence number 2766912
wordpress-db-1         | 2023-08-07T05:05:35.236456Z 0 [Note] Plugin 'FEDERATED' is disabled.
wordpress-db-1         | 2023-08-07T05:05:35.240636Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
wordpress-db-1         | 2023-08-07T05:05:35.243934Z 0 [Note] InnoDB: Buffer pool(s) load completed at 230807  5:05:35
wordpress-db-1         | 2023-08-07T05:05:35.245929Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
wordpress-db-1         | 2023-08-07T05:05:35.245953Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
wordpress-db-1         | 2023-08-07T05:05:35.245960Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1         | 2023-08-07T05:05:35.245986Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1         | 2023-08-07T05:05:35.246956Z 0 [Warning] CA certificate ca.pem is self signed.
wordpress-db-1         | 2023-08-07T05:05:35.247064Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
wordpress-db-1         | 2023-08-07T05:05:35.249678Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
wordpress-db-1         | 2023-08-07T05:05:35.267681Z 0 [Note] Event Scheduler: Loaded 0 events
wordpress-db-1         | 2023-08-07T05:05:35.268085Z 0 [Note] mysqld: ready for connections.
wordpress-db-1         | Version: '5.7.42'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server (GPL)
wordpress-db-1         | 2023-08-07 05:05:35+00:00 [Note] [Entrypoint]: Temporary server started.
wordpress-db-1         | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
wordpress-db-1         | 2023-08-07T05:05:35.958430Z 3 [Note] InnoDB: Stopping purge
wordpress-db-1         | 2023-08-07T05:05:35.964103Z 3 [Note] InnoDB: Resuming purge
wordpress-db-1         | 2023-08-07T05:05:35.967379Z 3 [Note] InnoDB: Stopping purge
wordpress-db-1         | 2023-08-07T05:05:35.971832Z 3 [Note] InnoDB: Resuming purge
wordpress-db-1         | 2023-08-07T05:05:35.975462Z 3 [Note] InnoDB: Stopping purge
wordpress-db-1         | 2023-08-07T05:05:35.980508Z 3 [Note] InnoDB: Resuming purge
wordpress-db-1         | 2023-08-07T05:05:35.987203Z 3 [Note] InnoDB: Stopping purge
wordpress-db-1         | 2023-08-07T05:05:35.990789Z 3 [Note] InnoDB: Resuming purge
wordpress-db-1         | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
wordpress-db-1         | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
wordpress-db-1         | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
wordpress-db-1         | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
wordpress-db-1         | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
wordpress-db-1         | 2023-08-07 05:05:38+00:00 [Note] [Entrypoint]: Creating database wordpress
wordpress-db-1         | 2023-08-07 05:05:38+00:00 [Note] [Entrypoint]: Creating user wpdb
wordpress-db-1         | 2023-08-07 05:05:38+00:00 [Note] [Entrypoint]: Giving user wpdb access to schema wordpress
wordpress-db-1         | 
wordpress-db-1         | 2023-08-07 05:05:38+00:00 [Note] [Entrypoint]: Stopping temporary server
wordpress-db-1         | 2023-08-07T05:05:38.450115Z 0 [Note] Giving 0 client threads a chance to die gracefully
wordpress-db-1         | 2023-08-07T05:05:38.450147Z 0 [Note] Shutting down slave threads
wordpress-db-1         | 2023-08-07T05:05:38.450152Z 0 [Note] Forcefully disconnecting 0 remaining clients
wordpress-db-1         | 2023-08-07T05:05:38.450160Z 0 [Note] Event Scheduler: Purging the queue. 0 events
wordpress-db-1         | 2023-08-07T05:05:38.450217Z 0 [Note] Binlog end
wordpress-db-1         | 2023-08-07T05:05:38.451579Z 0 [Note] Shutting down plugin 'ngram'
wordpress-db-1         | 2023-08-07T05:05:38.451593Z 0 [Note] Shutting down plugin 'partition'
wordpress-db-1         | 2023-08-07T05:05:38.451598Z 0 [Note] Shutting down plugin 'BLACKHOLE'
wordpress-db-1         | 2023-08-07T05:05:38.451603Z 0 [Note] Shutting down plugin 'ARCHIVE'
wordpress-db-1         | 2023-08-07T05:05:38.451606Z 0 [Note] Shutting down plugin 'PERFORMANCE_SCHEMA'
wordpress-db-1         | 2023-08-07T05:05:38.451639Z 0 [Note] Shutting down plugin 'MRG_MYISAM'
wordpress-db-1         | 2023-08-07T05:05:38.451644Z 0 [Note] Shutting down plugin 'MyISAM'
wordpress-db-1         | 2023-08-07T05:05:38.451652Z 0 [Note] Shutting down plugin 'INNODB_SYS_VIRTUAL'
wordpress-db-1         | 2023-08-07T05:05:38.451657Z 0 [Note] Shutting down plugin 'INNODB_SYS_DATAFILES'
wordpress-db-1         | 2023-08-07T05:05:38.451660Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESPACES'
wordpress-db-1         | 2023-08-07T05:05:38.451663Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN_COLS'
wordpress-db-1         | 2023-08-07T05:05:38.451666Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN'
wordpress-db-1         | 2023-08-07T05:05:38.451669Z 0 [Note] Shutting down plugin 'INNODB_SYS_FIELDS'
wordpress-db-1         | 2023-08-07T05:05:38.451673Z 0 [Note] Shutting down plugin 'INNODB_SYS_COLUMNS'
wordpress-db-1         | 2023-08-07T05:05:38.451676Z 0 [Note] Shutting down plugin 'INNODB_SYS_INDEXES'
wordpress-db-1         | 2023-08-07T05:05:38.451679Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESTATS'
wordpress-db-1         | 2023-08-07T05:05:38.451682Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLES'
wordpress-db-1         | 2023-08-07T05:05:38.451685Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_TABLE'
wordpress-db-1         | 2023-08-07T05:05:38.451688Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_CACHE'
wordpress-db-1         | 2023-08-07T05:05:38.451692Z 0 [Note] Shutting down plugin 'INNODB_FT_CONFIG'
wordpress-db-1         | 2023-08-07T05:05:38.451695Z 0 [Note] Shutting down plugin 'INNODB_FT_BEING_DELETED'
wordpress-db-1         | 2023-08-07T05:05:38.451698Z 0 [Note] Shutting down plugin 'INNODB_FT_DELETED'
wordpress-db-1         | 2023-08-07T05:05:38.451702Z 0 [Note] Shutting down plugin 'INNODB_FT_DEFAULT_STOPWORD'
wordpress-db-1         | 2023-08-07T05:05:38.451705Z 0 [Note] Shutting down plugin 'INNODB_METRICS'
wordpress-db-1         | 2023-08-07T05:05:38.451708Z 0 [Note] Shutting down plugin 'INNODB_TEMP_TABLE_INFO'
wordpress-db-1         | 2023-08-07T05:05:38.451711Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_POOL_STATS'
wordpress-db-1         | 2023-08-07T05:05:38.451715Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE_LRU'
wordpress-db-1         | 2023-08-07T05:05:38.451718Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE'
wordpress-db-1         | 2023-08-07T05:05:38.451722Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX_RESET'
wordpress-db-1         | 2023-08-07T05:05:38.451725Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX'
wordpress-db-1         | 2023-08-07T05:05:38.451728Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM_RESET'
wordpress-db-1         | 2023-08-07T05:05:38.451731Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM'
wordpress-db-1         | 2023-08-07T05:05:38.451734Z 0 [Note] Shutting down plugin 'INNODB_CMP_RESET'
wordpress-db-1         | 2023-08-07T05:05:38.451738Z 0 [Note] Shutting down plugin 'INNODB_CMP'
wordpress-db-1         | 2023-08-07T05:05:38.451741Z 0 [Note] Shutting down plugin 'INNODB_LOCK_WAITS'
wordpress-db-1         | 2023-08-07T05:05:38.451744Z 0 [Note] Shutting down plugin 'INNODB_LOCKS'
wordpress-db-1         | 2023-08-07T05:05:38.451747Z 0 [Note] Shutting down plugin 'INNODB_TRX'
wordpress-db-1         | 2023-08-07T05:05:38.451750Z 0 [Note] Shutting down plugin 'InnoDB'
wordpress-db-1         | 2023-08-07T05:05:38.451837Z 0 [Note] InnoDB: FTS optimize thread exiting.
wordpress-db-1         | 2023-08-07T05:05:38.452022Z 0 [Note] InnoDB: Starting shutdown...
wordpress-db-1         | 2023-08-07T05:05:38.552358Z 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
wordpress-db-1         | 2023-08-07T05:05:38.553554Z 0 [Note] InnoDB: Buffer pool(s) dump completed at 230807  5:05:38
wordpress-db-1         | 2023-08-07T05:05:40.065409Z 0 [Note] InnoDB: Shutdown completed; log sequence number 12217874
wordpress-db-1         | 2023-08-07T05:05:40.067494Z 0 [Note] InnoDB: Removed temporary tablespace data file: "ibtmp1"
wordpress-db-1         | 2023-08-07T05:05:40.067518Z 0 [Note] Shutting down plugin 'MEMORY'
wordpress-db-1         | 2023-08-07T05:05:40.067525Z 0 [Note] Shutting down plugin 'CSV'
wordpress-db-1         | 2023-08-07T05:05:40.067531Z 0 [Note] Shutting down plugin 'sha256_password'
wordpress-db-1         | 2023-08-07T05:05:40.067534Z 0 [Note] Shutting down plugin 'mysql_native_password'
wordpress-db-1         | 2023-08-07T05:05:40.067793Z 0 [Note] Shutting down plugin 'binlog'
wordpress-db-1         | 2023-08-07T05:05:40.069534Z 0 [Note] mysqld: Shutdown complete
wordpress-db-1         | 
wordpress-db-1         | 2023-08-07 05:05:40+00:00 [Note] [Entrypoint]: Temporary server stopped
wordpress-db-1         | 
wordpress-db-1         | 2023-08-07 05:05:40+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
wordpress-db-1         | 
wordpress-db-1         | 2023-08-07T05:05:40.666716Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
wordpress-db-1         | 2023-08-07T05:05:40.668697Z 0 [Note] mysqld (mysqld 5.7.42) starting as process 1 ...
wordpress-db-1         | 2023-08-07T05:05:40.673001Z 0 [Note] InnoDB: PUNCH HOLE support available
wordpress-db-1         | 2023-08-07T05:05:40.673038Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
wordpress-db-1         | 2023-08-07T05:05:40.673044Z 0 [Note] InnoDB: Uses event mutexes
wordpress-db-1         | 2023-08-07T05:05:40.673083Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
wordpress-db-1         | 2023-08-07T05:05:40.673093Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
wordpress-db-1         | 2023-08-07T05:05:40.673097Z 0 [Note] InnoDB: Using Linux native AIO
wordpress-db-1         | 2023-08-07T05:05:40.673448Z 0 [Note] InnoDB: Number of pools: 1
wordpress-db-1         | 2023-08-07T05:05:40.673635Z 0 [Note] InnoDB: Using CPU crc32 instructions
wordpress-db-1         | 2023-08-07T05:05:40.677223Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
wordpress-db-1         | 2023-08-07T05:05:40.685702Z 0 [Note] InnoDB: Completed initialization of buffer pool
wordpress-db-1         | 2023-08-07T05:05:40.688381Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
wordpress-db-1         | 2023-08-07T05:05:40.700641Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
wordpress-db-1         | 2023-08-07T05:05:40.713423Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
wordpress-db-1         | 2023-08-07T05:05:40.713552Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
wordpress-db-1         | 2023-08-07T05:05:40.747851Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
wordpress-db-1         | 2023-08-07T05:05:40.749335Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
wordpress-db-1         | 2023-08-07T05:05:40.749384Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
wordpress-db-1         | 2023-08-07T05:05:40.749963Z 0 [Note] InnoDB: 5.7.42 started; log sequence number 12217874
wordpress-db-1         | 2023-08-07T05:05:40.750404Z 0 [Note] Plugin 'FEDERATED' is disabled.
wordpress-db-1         | 2023-08-07T05:05:40.752647Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
wordpress-db-1         | 2023-08-07T05:05:40.762095Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
wordpress-db-1         | 2023-08-07T05:05:40.762161Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
wordpress-db-1         | 2023-08-07T05:05:40.762201Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1         | 2023-08-07T05:05:40.762270Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1         | 2023-08-07T05:05:40.763465Z 0 [Warning] CA certificate ca.pem is self signed.
wordpress-db-1         | 2023-08-07T05:05:40.763586Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
wordpress-db-1         | 2023-08-07T05:05:40.764269Z 0 [Note] Server hostname (bind-address): '*'; port: 3306
wordpress-db-1         | 2023-08-07T05:05:40.765733Z 0 [Note] IPv6 is available.
wordpress-db-1         | 2023-08-07T05:05:40.765824Z 0 [Note]   - '::' resolves to '::';
wordpress-db-1         | 2023-08-07T05:05:40.765906Z 0 [Note] Server socket created on IP: '::'.
wordpress-db-1         | 2023-08-07T05:05:40.766504Z 0 [Note] InnoDB: Buffer pool(s) load completed at 230807  5:05:40
wordpress-db-1         | 2023-08-07T05:05:40.768014Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
wordpress-db-1         | 2023-08-07T05:05:40.784756Z 0 [Note] Event Scheduler: Loaded 0 events
wordpress-db-1         | 2023-08-07T05:05:40.785063Z 0 [Note] mysqld: ready for connections.
wordpress-db-1         | Version: '5.7.42'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
root@DGA-NON-IT-021:/home/dgadmin/learning-docker/wordpress# docker compose logs wordpress
wordpress-wordpress-1  | WordPress not found in /var/www/html - copying now...
wordpress-wordpress-1  | Complete! WordPress has been successfully copied to /var/www/html
wordpress-wordpress-1  | No 'wp-config.php' found in /var/www/html, but 'WORDPRESS_...' variables supplied; copying 'wp-config-docker.php' (WORDPRESS_DB_HOST WORDPRESS_DB_NAME WORDPRESS_DB_PASSWORD WORDPRESS_DB_USER)
wordpress-wordpress-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.23.0.3. Set the 'ServerName' directive globally to suppress this message
wordpress-wordpress-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.23.0.3. Set the 'ServerName' directive globally to suppress this message
wordpress-wordpress-1  | [Mon Aug 07 05:05:33.435232 2023] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.56 (Debian) PHP/8.0.29 configured -- resuming normal operations
wordpress-wordpress-1  | [Mon Aug 07 05:05:33.435678 2023] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
root@DGA-NON-IT-021:/home/dgadmin/learning-docker/wordpress# docker compose logs db
wordpress-db-1  | 2023-08-07 05:05:29+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 5.7.42-1.el7 started.
wordpress-db-1  | 2023-08-07 05:05:29+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
wordpress-db-1  | 2023-08-07 05:05:30+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 5.7.42-1.el7 started.
wordpress-db-1  | 2023-08-07 05:05:30+00:00 [Note] [Entrypoint]: Initializing database files
wordpress-db-1  | 2023-08-07T05:05:30.428600Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
wordpress-db-1  | 2023-08-07T05:05:30.750914Z 0 [Warning] InnoDB: New log files created, LSN=45790
wordpress-db-1  | 2023-08-07T05:05:30.807077Z 0 [Warning] InnoDB: Creating foreign key constraint system tables.
wordpress-db-1  | 2023-08-07T05:05:30.867811Z 0 [Warning] No existing UUID has been found, so we assume that this is the first time that this server has been started. Generating a new UUID: 081fb341-34e0-11ee-b169-0242ac170002.
wordpress-db-1  | 2023-08-07T05:05:30.872177Z 0 [Warning] Gtid table is not ready to be used. Table 'mysql.gtid_executed' cannot be opened.
wordpress-db-1  | 2023-08-07T05:05:31.176260Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1  | 2023-08-07T05:05:31.176341Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1  | 2023-08-07T05:05:31.177279Z 0 [Warning] CA certificate ca.pem is self signed.
wordpress-db-1  | 2023-08-07T05:05:31.364126Z 1 [Warning] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
wordpress-db-1  | 2023-08-07 05:05:34+00:00 [Note] [Entrypoint]: Database files initialized
wordpress-db-1  | 2023-08-07 05:05:34+00:00 [Note] [Entrypoint]: Starting temporary server
wordpress-db-1  | 2023-08-07 05:05:34+00:00 [Note] [Entrypoint]: Waiting for server startup
wordpress-db-1  | 2023-08-07T05:05:35.059476Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
wordpress-db-1  | 2023-08-07T05:05:35.062648Z 0 [Note] mysqld (mysqld 5.7.42) starting as process 124 ...
wordpress-db-1  | 2023-08-07T05:05:35.069378Z 0 [Note] InnoDB: PUNCH HOLE support available
wordpress-db-1  | 2023-08-07T05:05:35.069406Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
wordpress-db-1  | 2023-08-07T05:05:35.069415Z 0 [Note] InnoDB: Uses event mutexes
wordpress-db-1  | 2023-08-07T05:05:35.069419Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
wordpress-db-1  | 2023-08-07T05:05:35.069423Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
wordpress-db-1  | 2023-08-07T05:05:35.069429Z 0 [Note] InnoDB: Using Linux native AIO
wordpress-db-1  | 2023-08-07T05:05:35.069895Z 0 [Note] InnoDB: Number of pools: 1
wordpress-db-1  | 2023-08-07T05:05:35.070099Z 0 [Note] InnoDB: Using CPU crc32 instructions
wordpress-db-1  | 2023-08-07T05:05:35.074481Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
wordpress-db-1  | 2023-08-07T05:05:35.090497Z 0 [Note] InnoDB: Completed initialization of buffer pool
wordpress-db-1  | 2023-08-07T05:05:35.094044Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
wordpress-db-1  | 2023-08-07T05:05:35.108850Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
wordpress-db-1  | 2023-08-07T05:05:35.122082Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
wordpress-db-1  | 2023-08-07T05:05:35.122406Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
wordpress-db-1  | 2023-08-07T05:05:35.183633Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
wordpress-db-1  | 2023-08-07T05:05:35.185470Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
wordpress-db-1  | 2023-08-07T05:05:35.185494Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
wordpress-db-1  | 2023-08-07T05:05:35.185853Z 0 [Note] InnoDB: Waiting for purge to start
wordpress-db-1  | 2023-08-07T05:05:35.236041Z 0 [Note] InnoDB: 5.7.42 started; log sequence number 2766912
wordpress-db-1  | 2023-08-07T05:05:35.236456Z 0 [Note] Plugin 'FEDERATED' is disabled.
wordpress-db-1  | 2023-08-07T05:05:35.240636Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
wordpress-db-1  | 2023-08-07T05:05:35.243934Z 0 [Note] InnoDB: Buffer pool(s) load completed at 230807  5:05:35
wordpress-db-1  | 2023-08-07T05:05:35.245929Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
wordpress-db-1  | 2023-08-07T05:05:35.245953Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
wordpress-db-1  | 2023-08-07T05:05:35.245960Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1  | 2023-08-07T05:05:35.245986Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1  | 2023-08-07T05:05:35.246956Z 0 [Warning] CA certificate ca.pem is self signed.
wordpress-db-1  | 2023-08-07T05:05:35.247064Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
wordpress-db-1  | 2023-08-07T05:05:35.249678Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
wordpress-db-1  | 2023-08-07T05:05:35.267681Z 0 [Note] Event Scheduler: Loaded 0 events
wordpress-db-1  | 2023-08-07T05:05:35.268085Z 0 [Note] mysqld: ready for connections.
wordpress-db-1  | Version: '5.7.42'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server (GPL)
wordpress-db-1  | 2023-08-07 05:05:35+00:00 [Note] [Entrypoint]: Temporary server started.
wordpress-db-1  | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
wordpress-db-1  | 2023-08-07T05:05:35.958430Z 3 [Note] InnoDB: Stopping purge
wordpress-db-1  | 2023-08-07T05:05:35.964103Z 3 [Note] InnoDB: Resuming purge
wordpress-db-1  | 2023-08-07T05:05:35.967379Z 3 [Note] InnoDB: Stopping purge
wordpress-db-1  | 2023-08-07T05:05:35.971832Z 3 [Note] InnoDB: Resuming purge
wordpress-db-1  | 2023-08-07T05:05:35.975462Z 3 [Note] InnoDB: Stopping purge
wordpress-db-1  | 2023-08-07T05:05:35.980508Z 3 [Note] InnoDB: Resuming purge
wordpress-db-1  | 2023-08-07T05:05:35.987203Z 3 [Note] InnoDB: Stopping purge
wordpress-db-1  | 2023-08-07T05:05:35.990789Z 3 [Note] InnoDB: Resuming purge
wordpress-db-1  | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
wordpress-db-1  | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
wordpress-db-1  | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
wordpress-db-1  | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
wordpress-db-1  | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
wordpress-db-1  | 2023-08-07 05:05:38+00:00 [Note] [Entrypoint]: Creating database wordpress
wordpress-db-1  | 2023-08-07 05:05:38+00:00 [Note] [Entrypoint]: Creating user wpdb
wordpress-db-1  | 2023-08-07 05:05:38+00:00 [Note] [Entrypoint]: Giving user wpdb access to schema wordpress
wordpress-db-1  | 
wordpress-db-1  | 2023-08-07 05:05:38+00:00 [Note] [Entrypoint]: Stopping temporary server
wordpress-db-1  | 2023-08-07T05:05:38.450115Z 0 [Note] Giving 0 client threads a chance to die gracefully
wordpress-db-1  | 2023-08-07T05:05:38.450147Z 0 [Note] Shutting down slave threads
wordpress-db-1  | 2023-08-07T05:05:38.450152Z 0 [Note] Forcefully disconnecting 0 remaining clients
wordpress-db-1  | 2023-08-07T05:05:38.450160Z 0 [Note] Event Scheduler: Purging the queue. 0 events
wordpress-db-1  | 2023-08-07T05:05:38.450217Z 0 [Note] Binlog end
wordpress-db-1  | 2023-08-07T05:05:38.451579Z 0 [Note] Shutting down plugin 'ngram'
wordpress-db-1  | 2023-08-07T05:05:38.451593Z 0 [Note] Shutting down plugin 'partition'
wordpress-db-1  | 2023-08-07T05:05:38.451598Z 0 [Note] Shutting down plugin 'BLACKHOLE'
wordpress-db-1  | 2023-08-07T05:05:38.451603Z 0 [Note] Shutting down plugin 'ARCHIVE'
wordpress-db-1  | 2023-08-07T05:05:38.451606Z 0 [Note] Shutting down plugin 'PERFORMANCE_SCHEMA'
wordpress-db-1  | 2023-08-07T05:05:38.451639Z 0 [Note] Shutting down plugin 'MRG_MYISAM'
wordpress-db-1  | 2023-08-07T05:05:38.451644Z 0 [Note] Shutting down plugin 'MyISAM'
wordpress-db-1  | 2023-08-07T05:05:38.451652Z 0 [Note] Shutting down plugin 'INNODB_SYS_VIRTUAL'
wordpress-db-1  | 2023-08-07T05:05:38.451657Z 0 [Note] Shutting down plugin 'INNODB_SYS_DATAFILES'
wordpress-db-1  | 2023-08-07T05:05:38.451660Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESPACES'
wordpress-db-1  | 2023-08-07T05:05:38.451663Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN_COLS'
wordpress-db-1  | 2023-08-07T05:05:38.451666Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN'
wordpress-db-1  | 2023-08-07T05:05:38.451669Z 0 [Note] Shutting down plugin 'INNODB_SYS_FIELDS'
wordpress-db-1  | 2023-08-07T05:05:38.451673Z 0 [Note] Shutting down plugin 'INNODB_SYS_COLUMNS'
wordpress-db-1  | 2023-08-07T05:05:38.451676Z 0 [Note] Shutting down plugin 'INNODB_SYS_INDEXES'
wordpress-db-1  | 2023-08-07T05:05:38.451679Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESTATS'
wordpress-db-1  | 2023-08-07T05:05:38.451682Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLES'
wordpress-db-1  | 2023-08-07T05:05:38.451685Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_TABLE'
wordpress-db-1  | 2023-08-07T05:05:38.451688Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_CACHE'
wordpress-db-1  | 2023-08-07T05:05:38.451692Z 0 [Note] Shutting down plugin 'INNODB_FT_CONFIG'
wordpress-db-1  | 2023-08-07T05:05:38.451695Z 0 [Note] Shutting down plugin 'INNODB_FT_BEING_DELETED'
wordpress-db-1  | 2023-08-07T05:05:38.451698Z 0 [Note] Shutting down plugin 'INNODB_FT_DELETED'
wordpress-db-1  | 2023-08-07T05:05:38.451702Z 0 [Note] Shutting down plugin 'INNODB_FT_DEFAULT_STOPWORD'
wordpress-db-1  | 2023-08-07T05:05:38.451705Z 0 [Note] Shutting down plugin 'INNODB_METRICS'
wordpress-db-1  | 2023-08-07T05:05:38.451708Z 0 [Note] Shutting down plugin 'INNODB_TEMP_TABLE_INFO'
wordpress-db-1  | 2023-08-07T05:05:38.451711Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_POOL_STATS'
wordpress-db-1  | 2023-08-07T05:05:38.451715Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE_LRU'
wordpress-db-1  | 2023-08-07T05:05:38.451718Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE'
wordpress-db-1  | 2023-08-07T05:05:38.451722Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX_RESET'
wordpress-db-1  | 2023-08-07T05:05:38.451725Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX'
wordpress-db-1  | 2023-08-07T05:05:38.451728Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM_RESET'
wordpress-db-1  | 2023-08-07T05:05:38.451731Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM'
wordpress-db-1  | 2023-08-07T05:05:38.451734Z 0 [Note] Shutting down plugin 'INNODB_CMP_RESET'
wordpress-db-1  | 2023-08-07T05:05:38.451738Z 0 [Note] Shutting down plugin 'INNODB_CMP'
wordpress-db-1  | 2023-08-07T05:05:38.451741Z 0 [Note] Shutting down plugin 'INNODB_LOCK_WAITS'
wordpress-db-1  | 2023-08-07T05:05:38.451744Z 0 [Note] Shutting down plugin 'INNODB_LOCKS'
wordpress-db-1  | 2023-08-07T05:05:38.451747Z 0 [Note] Shutting down plugin 'INNODB_TRX'
wordpress-db-1  | 2023-08-07T05:05:38.451750Z 0 [Note] Shutting down plugin 'InnoDB'
wordpress-db-1  | 2023-08-07T05:05:38.451837Z 0 [Note] InnoDB: FTS optimize thread exiting.
wordpress-db-1  | 2023-08-07T05:05:38.452022Z 0 [Note] InnoDB: Starting shutdown...
wordpress-db-1  | 2023-08-07T05:05:38.552358Z 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
wordpress-db-1  | 2023-08-07T05:05:38.553554Z 0 [Note] InnoDB: Buffer pool(s) dump completed at 230807  5:05:38
wordpress-db-1  | 2023-08-07T05:05:40.065409Z 0 [Note] InnoDB: Shutdown completed; log sequence number 12217874
wordpress-db-1  | 2023-08-07T05:05:40.067494Z 0 [Note] InnoDB: Removed temporary tablespace data file: "ibtmp1"
wordpress-db-1  | 2023-08-07T05:05:40.067518Z 0 [Note] Shutting down plugin 'MEMORY'
wordpress-db-1  | 2023-08-07T05:05:40.067525Z 0 [Note] Shutting down plugin 'CSV'
wordpress-db-1  | 2023-08-07T05:05:40.067531Z 0 [Note] Shutting down plugin 'sha256_password'
wordpress-db-1  | 2023-08-07T05:05:40.067534Z 0 [Note] Shutting down plugin 'mysql_native_password'
wordpress-db-1  | 2023-08-07T05:05:40.067793Z 0 [Note] Shutting down plugin 'binlog'
wordpress-db-1  | 2023-08-07T05:05:40.069534Z 0 [Note] mysqld: Shutdown complete
wordpress-db-1  | 
wordpress-db-1  | 2023-08-07 05:05:40+00:00 [Note] [Entrypoint]: Temporary server stopped
wordpress-db-1  | 
wordpress-db-1  | 2023-08-07 05:05:40+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
wordpress-db-1  | 
wordpress-db-1  | 2023-08-07T05:05:40.666716Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
wordpress-db-1  | 2023-08-07T05:05:40.668697Z 0 [Note] mysqld (mysqld 5.7.42) starting as process 1 ...
wordpress-db-1  | 2023-08-07T05:05:40.673001Z 0 [Note] InnoDB: PUNCH HOLE support available
wordpress-db-1  | 2023-08-07T05:05:40.673038Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
wordpress-db-1  | 2023-08-07T05:05:40.673044Z 0 [Note] InnoDB: Uses event mutexes
wordpress-db-1  | 2023-08-07T05:05:40.673083Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
wordpress-db-1  | 2023-08-07T05:05:40.673093Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
wordpress-db-1  | 2023-08-07T05:05:40.673097Z 0 [Note] InnoDB: Using Linux native AIO
wordpress-db-1  | 2023-08-07T05:05:40.673448Z 0 [Note] InnoDB: Number of pools: 1
wordpress-db-1  | 2023-08-07T05:05:40.673635Z 0 [Note] InnoDB: Using CPU crc32 instructions
wordpress-db-1  | 2023-08-07T05:05:40.677223Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
wordpress-db-1  | 2023-08-07T05:05:40.685702Z 0 [Note] InnoDB: Completed initialization of buffer pool
wordpress-db-1  | 2023-08-07T05:05:40.688381Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
wordpress-db-1  | 2023-08-07T05:05:40.700641Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
wordpress-db-1  | 2023-08-07T05:05:40.713423Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
wordpress-db-1  | 2023-08-07T05:05:40.713552Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
wordpress-db-1  | 2023-08-07T05:05:40.747851Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
wordpress-db-1  | 2023-08-07T05:05:40.749335Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
wordpress-db-1  | 2023-08-07T05:05:40.749384Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
wordpress-db-1  | 2023-08-07T05:05:40.749963Z 0 [Note] InnoDB: 5.7.42 started; log sequence number 12217874
wordpress-db-1  | 2023-08-07T05:05:40.750404Z 0 [Note] Plugin 'FEDERATED' is disabled.
wordpress-db-1  | 2023-08-07T05:05:40.752647Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
wordpress-db-1  | 2023-08-07T05:05:40.762095Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
wordpress-db-1  | 2023-08-07T05:05:40.762161Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
wordpress-db-1  | 2023-08-07T05:05:40.762201Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1  | 2023-08-07T05:05:40.762270Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
wordpress-db-1  | 2023-08-07T05:05:40.763465Z 0 [Warning] CA certificate ca.pem is self signed.
wordpress-db-1  | 2023-08-07T05:05:40.763586Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
wordpress-db-1  | 2023-08-07T05:05:40.764269Z 0 [Note] Server hostname (bind-address): '*'; port: 3306
wordpress-db-1  | 2023-08-07T05:05:40.765733Z 0 [Note] IPv6 is available.
wordpress-db-1  | 2023-08-07T05:05:40.765824Z 0 [Note]   - '::' resolves to '::';
wordpress-db-1  | 2023-08-07T05:05:40.765906Z 0 [Note] Server socket created on IP: '::'.
wordpress-db-1  | 2023-08-07T05:05:40.766504Z 0 [Note] InnoDB: Buffer pool(s) load completed at 230807  5:05:40
wordpress-db-1  | 2023-08-07T05:05:40.768014Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
wordpress-db-1  | 2023-08-07T05:05:40.784756Z 0 [Note] Event Scheduler: Loaded 0 events
wordpress-db-1  | 2023-08-07T05:05:40.785063Z 0 [Note] mysqld: ready for connections.
wordpress-db-1  | Version: '5.7.42'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)                                                                                                                                                                        1.8s
```

</p></details><br>


```sh
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ee:latest
```
```sh
version: '3.8'

volumes:
  portainer_data:

networks:
  mgt:
    external: yes

services:
  portainer-ce:
    image: portainer/portainer-ce:latest
    restart: unless-stopped
    ports:
      - 8000:8000
      - 9443:9443
    networks:
      - mgt
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data
```
<details><summary>Result</summary><p>

```javascript
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                                                                                            NAMES
5169b500faf7   portainer/portainer-ee:latest   "/portainer"             32 minutes ago   Up 32 minutes   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp, 9000/tcp   portainer                                                                                                                                                                      1.8s
```

</p></details><br>


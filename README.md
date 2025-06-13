# begin
### root
*https://www.youtube.com/watch?v=e37WuORB0UQ*
```
sudo su root
```
```
nano /etc/ssh/sshd_config
systemctl enable sshd.service
systemctl restart sshd.service

sudo passwd
```

# bash
### install everything by yum
```
yum install <sth>
yum remove <sth>
```

### remove folder
```
rm -rf // rm folder
```

### check PID
```
$ ps ax | grep firefox
2222 ?        S      0:00 /bin/sh /usr/lib/firefox-3.6.9/firefox
2231 ?        Sl   514:36 /usr/lib/firefox-3.6.9/firefox-bin
30290 pts/2    S+     0:00 grep --color

$ kill 2222
```

### run sh file
```
chmod +x install_golang.sh
./install_golang.sh
```

### run file in backgound
```
nohup go run main.go
```

# fix permition ssh
```
[hieut@instance-1 thienbh-lession2]$ sudo usermod -aG docker hieut

[hieut@instance-1 thienbh-lession2]$ sudo usermod -aG root hieut

[hieut@instance-1 thienbh-lession2]$ sudo chmod 777 /var/run/docker.sock
```

# nginx
*https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7*
```
yum install epel-release
yum install nginx

systemctl start nginx
sudo systemctl enable nginx
```
```
sudo nginx -s stop
```

* location nginx file *
```
/etc/nginx/nginx.conf
```

# docker
### install
*https://docs.docker.com/engine/install/centos/*

### remove
*https://www.learn-it-with-examples.com/development/odev-tutorials/docker/uninstallation-docker-from-linux.html*
```
docker run hello-world
yum remove docker-ce
rm -rf /var/lib/docker
```

*Create image and run container*
```
$ docker build -t golang_health_image .
$ docker run -d --name golang_health_container -p 9092:9092 golang_health_image
```

# SSH
### gen ssh key
```
hieut@DESKTOP-M6CBJL7 MINGW64 ~
$ ssh hieut@35.247.146.103
Last login: Thu Mar 28 08:01:32 2019 from 14.161.15.48

[hieut@instance-1 ~]$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/hieut/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/hieut/.ssh/id_rsa.
Your public key has been saved in /home/hieut/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:18rzFmAjRWY+Ox+Dsd/1u88umsrSOHn68PWKEzajhRc hieut@instance-1
The key's randomart image is:
+---[RSA 2048]----+
|         .+      |
|         +.      |
|         .+      |
|        . EB     |
|        S+*++   .|
|        .oB=.+ ..|
|        .O+++.. .|
|        *++=.o...|
|        .**+=o.=*|
+----[SHA256]-----+
```

```
[hieut@instance-1 ~]$ cat /home/hieut/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDuvVmO9M1b+ttHo56dAyimEJ0a25d6hZTvTCDRYrk9lUF3R7VgClBXkUeg0Oo58DyqsQ+slMW1otFuSxzxBGr8jCF2WNswq4UbHfYonQsfKR1XuXrTxCuzTkeAQ+hSKP6Ht3U5ssHZTBYu3zp3NOntGzzkJBrr3z+DKji1+oLsORtIEDmAnWJ7YEE4Vp2IYJRMZ+2aEBBn/VJQBs053hYJ6kJcc0posHmXDGZ4t9MLthTailmeRtljzlkIVvRVNjXGbZkmIafNCWYkVKY6fGSDmriwPaEwgleqLp6NUrK8ewvnLhXHnPu8B/IL+Qs2NMfwzIGo1U6xTC4CM6DC+XFF hieut@instance-1
```

### copy ssh key
```
ssh-copy-id root@103.130.219.127
```

### remote ssh by ssh_key
```
ssh -i deployment_key.txt demo@192.237.248.66
```

### build go project
```
[hieut@instance-1 ~]$ ls

[hieut@instance-1 ~]$ pwd
/home/hieut

[hieut@instance-1 ~]$ mkdir go

[hieut@instance-1 ~]$ cd go

[hieut@instance-1 go]$ git clone git@gitlab.com:lak8s/thienbh-lession2.git
Cloning into 'thienbh-lession2'...
The authenticity of host 'gitlab.com (35.231.145.151)' can't be established.
ECDSA key fingerprint is SHA256:HbW3g8zUjNSksFbqTiUWPWg2Bq1x8xdGUrliXFzSnUw.
ECDSA key fingerprint is MD5:f1:d0:fb:46:73:7a:70:92:5a:ab:5d:ef:43:e2:1c:35.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'gitlab.com,35.231.145.151' (ECDSA) to the list of known hosts.
remote: Enumerating objects: 396, done.
remote: Counting objects: 100% (396/396), done.
remote: Compressing objects: 100% (247/247), done.
remote: Total 396 (delta 147), reused 387 (delta 145)
Receiving objects: 100% (396/396), 1.06 MiB | 266.00 KiB/s, done.
Resolving deltas: 100% (147/147), done.
```
```
[hieut@instance-1 go]$ pwd
/home/hieut/go

[hieut@instance-1 go]$ ls
thienbh-lession2

[hieut@instance-1 go]$ cd thienbh-lession2

[hieut@instance-1 thienbh-lession2]$ ls
batch.sh  Dockerfile  go.mod  go.sum  main.go  README.md  vendor
```

```
[hieut@instance-1 thienbh-lession2]$ chmod +x batch.sh

[hieut@instance-1 thienbh-lession2]$ ./batch.sh
Already up-to-date.
Sending build context to Docker daemon  8.836MB
Step 1/5 : FROM golang:1.11.4-alpine
1.11.4-alpine: Pulling from library/golang
Digest: sha256:198cb8c94b9ee6941ce6d58f29aadb855f64600918ce602cdeacb018ad77d647
Status: Downloaded newer image for golang:1.11.4-alpine
 ---> f56365ec0638
Step 2/5 : WORKDIR /go/src/go-module
 ---> Running in a79c1978c79b
Removing intermediate container a79c1978c79b
 ---> 37942a74e9f2
Step 3/5 : COPY . /go/src/go-module/
 ---> 1e89ec43c82a
Step 4/5 : RUN go build -o main .
 ---> Running in 71552e959d16
Removing intermediate container 71552e959d16
 ---> 03ed76eda55e
Step 5/5 : CMD ["./main"]
 ---> Running in fa3afa40f06a
Removing intermediate container fa3afa40f06a
 ---> 29e2bc8c39f9
Successfully built 29e2bc8c39f9
Successfully tagged golang_health_image:latest
...
...
```

```
[hieut@instance-1 thienbh-lession2]$ curl "localhost:9092/healthcheck"
{"Status":"OK","StatusCode":200,"Msg":"BHT Service Runing"}
```

======================================================================
# public key
```
location public key: /Users/thienbui/.ssh
new ssh key git: https://github.com/settings/ssh/new
```

# copy ssh <-> local
down: ```scp -r root@103.130.219.127:/home/seal/public_html/power3 ./```

up: ```scp -r ./power3 root@103.130.219.127:/home/seal/public_html/```


======================================================================
# Message/email queue
```
exim -bp
exim -Mvh 1nFYdp-0004dn-HN
```

=====
# nohup file go build
```
sudo nohup ./order-v2
```

======================================================================

# gen hex from pem
`xxd -plain private_key_pkcs8.pem > private_key_pkcs8.hex`

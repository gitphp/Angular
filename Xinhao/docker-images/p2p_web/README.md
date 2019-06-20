### 导入镜像
```shell
$ docker pull registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php5.3
```

### 配置文件映射
*  由于我们镜像包内已经做了软连接，直接将httpd.conf和php.ini链接到容器内的/conf 目录下
*  将需要映射的配置文件放到挂载目录volumn/etc中，再映射到 /conf即可
*  httpd.conf如果需要引用env.conf,ssl.conf,xxx.conf等等，请直接在httpd.conf中写绝对路径

```shell
<VirtualHost *:80>
    DocumentRoot "/var/www/html/p2p_web/html"
  <Directory "/var/www/html/p2p_web/html">
      Options FollowSymLinks ExecCGI
      AllowOverride All
      Order allow,deny
      Allow from all
      # Require all granted
      #注意这里引用的是容器内的绝对路径。/conf为容器启动时挂载的目录
      Include /conf/dir.conf
  </Directory>
    #注意这里引用的是容器内的绝对路径。/conf为容器启动时挂载的目录
    Include /conf/env.conf
</VirtualHost>
```

### 启动容器
```shell
$ docker run \
    -it -d --net=none --name p2p_web \
    --privileged \
    -v /mnt/shared/p2p_web:/var/www/html/p2p_web \
    -v /mnt/shared/docker-images/p2p_web/volumn/etc/:/conf \
    -v /etc/hosts:/etc/hosts \
    registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php5.3:latest
```

### 单独给容器指定（分配）地址
```shell
# pipework-eth1 br0 p2p_escrow 192.168.99.25/24@192.168.99.1
# pipework-eth2 br1 p2p_escrow 10.0.2.25/24@10.0.2.1
```
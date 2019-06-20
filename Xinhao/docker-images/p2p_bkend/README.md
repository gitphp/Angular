### 导入镜像
```shell
$ docker pull registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php5.6
```

### 配置文件映射
* 需要映射的配置文件存在 ./volumn 下

### 启动容器(开发模式、SIT测试模式)
```shell
$ docker run \
     -it -d --net=none --name p2p_bkend \
     -v /mnt/shared/p2p_bkend:/var/www/html/p2p_bkend \
     -v /mnt/shared/docker-images/p2p_bkend/volumn/etc:/conf \
     -v /etc/hosts:/etc/hosts \
     registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php7.1:latest
```

### 单独给容器指定（分配）地址
```shell
# pipework-eth1 br0 p2p_escrow 192.168.99.22/24@192.168.99.1
# pipework-eth2 br1 p2p_escrow 10.0.2.22/24@10.0.2.1
```
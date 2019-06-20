### 导入镜像
```shell
$ docker pull registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php7.1
```

### 配置文件映射
* 需要映射的配置文件存在 ./volumn 下


### 启动容器
```shell
$ docker run \
     -it -d --net=none --name p2p_activity \
     --privileged \
     -v /mnt/shared/p2p_activity:/var/www/html/p2p_activity \
     -v /mnt/shared/docker-images/p2p_activity/volumn/etc:/conf \
     -v /etc/hosts:/etc/hosts \
     registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php7.1:latest
```

### 单独给容器指定（分配）地址
```shell
# pipework-eth1 br0 p2p_activity 192.168.99.27/24@192.168.99.1
# pipework-eth2 br1 p2p_activity 10.0.2.27/24@10.0.2.1
```
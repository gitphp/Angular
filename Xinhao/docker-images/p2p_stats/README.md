### 导入镜像
```shell
$ docker pull registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php5.3
```

### 启动容器
```shell
$ docker run \
    -it -d --net=none --name p2p_stats \
    -v /mnt/shared/p2p_stats:/var/www/html/p2p_stats \
    -v /mnt/shared/docker-images/p2p_stats/volumn/etc/:/conf \
    -v /etc/hosts:/etc/hosts \
    registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php5.3:latest
```

### 单独给容器指定（分配）地址
```shell
# pipework-eth1 br0 p2p_stats 192.168.99.23/24@192.168.99.1
# pipework-eth2 br1 p2p_stats 10.0.2.23/24@10.0.2.1
```
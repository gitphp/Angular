### 这个是hub.docker.com官网的镜像

### 导入镜像
```shell
$ docker pull mysql:5.6
# OR
$ docker pull index.tenxcloud.com/docker_library/mysql:5.6
```

### 启动容器(开发模式、SIT测试模式)
```shell
# docker run \
    -it -d --net=none --name mysql_5.6 \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
    -v /mnt/shared/docker-images/mysql_5.6/volumn/var/lib/mysql:/var/lib/mysql \
    index.tenxcloud.com/docker_library/mysql:5.6
```

### 单独给容器指定（分配）地址
```shell
# pipework-eth1 br0 p2p_escrow 192.168.99.199/24@192.168.99.1
# pipework-eth2 br1 p2p_escrow 10.0.2.199/24@10.0.2.1
```
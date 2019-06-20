### 导入镜像
```shell
$ docker pull registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php7.1
```

### 配置文件映射
* 需要映射的配置文件存在 ./volumn 下


### 启动容器
```shell
$ docker run \
     -it -d --net=none --name apigateway \
     -v /mnt/shared/apigateway:/var/www/html/apigateway \
     -v /mnt/shared/docker-images/apigateway/volumn/etc:/conf \
     -v /etc/hosts:/etc/hosts \
     registry-vpc.cn-shenzhen.aliyuncs.com/dolabank/httpd_php7.1:latest     
```

### 单独给容器指定（分配）地址
```shell
$ pipework-eth1 br0 apigateway 192.168.99.26/24@192.168.99.1
$ pipework-eth2 br1 apigateway 10.0.2.26/24@10.0.2.1
```
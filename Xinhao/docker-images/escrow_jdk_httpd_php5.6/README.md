### 构建镜像 (此步骤非必要) 
* 构建前需要先导入基础镜像， [基础镜像位置](../centos/)
```shell
# docker build -t dolabank/escrow_jdk_httpd_php5.6:latest .
```

##### 由于jdk-7u80-linux-x64.tar.gz较大，在本文件夹中并未包含，请自行下载后拷贝进来
```shell
wget --no-check-certificate -O jdk-7u80-linux-x64.tar.gz https://www.reucon.net/cdn/java/jdk-7u80-linux-x64.tar.gz
```
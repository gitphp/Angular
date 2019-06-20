FROM centos:centos6.8
MAINTAINER "chenyoufeng" <youfeng.chen@dolabank.com>
WORKDIR /root/
COPY * ./

# 安装PHP
RUN yum install -y php php-devel php-pear php-mbstring php-mcrypt php-bcmath php-mysql php-xml gcc gcc-c++ autoconf automake mod_ssl libssh2 libssh2-devel php-gd \
    && yum clean all \
    && pecl install Xdebug-2.2.7 \
    && pecl install ssh2-0.13 \
    && pecl install redis-3.1.3 \
    && pecl install ZendOpcache-7.0.5 \
	&& tar zxvf rabbitmq-c-0.8.0.tar.gz && cd rabbitmq-c-0.8.0 && ./configure --prefix=/usr/local/rabbitmq-c-0.8.0 && make && make install && cd ../ \
	&& tar zxvf amqp-1.6.1.tgz && cd amqp-1.6.1 && phpize && ./configure --with-amqp --with-librabbitmq-dir=/usr/local/rabbitmq-c-0.8.0/ && make && make install && cd /root/ \
    && tar -zxvf libmcrypt-2.5.8.tar.gz && cd libmcrypt-2.5.8 && ./configure && make && make install && cd /root/ \
    && tar -zxvf mhash-0.9.9.9.tar.gz && cd mhash-0.9.9.9 && ./configure && make && make install && cd /root/ \
    && tar -zxvf mcrypt-2.6.8.tar.gz && cd mcrypt-2.6.8 && LD_LIBRARY_PATH=/usr/local/lib ./configure && make && make install && cd /root/ \
    && tar zxvf  php-5.3.3.tar.gz && cd /root/php-5.3.3/ext/mcrypt && phpize && ./configure && make && make install \
	&& cd /root/ && rm -rf amqp* Dockerfile README.md rabbitmq* libmcrypt* mcrypt* mhash* php* \
    && php --version \
    && ln -sf /conf/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf \
    && ln -sf /conf/php.ini /etc/php.ini \
    && echo -e '#!/bin/bash\nchown -R apache.apache /tmp/dola*\ngroupadd -g 500 dola\nusermod -a -G dola apache\n/usr/sbin/httpd -D FOREGROUND' > /usr/local/bin/http-foregroud \
    && chmod +x /usr/local/bin/http-foregroud \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
    && mkdir -p /tmp/dolabank && chmod -R 777 /tmp/dolabank


EXPOSE 80 443

ENTRYPOINT ["http-foregroud"]

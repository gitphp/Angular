FROM centos:centos6.8
MAINTAINER "chenyoufeng" <youfeng.chen@dolabank.com>
WORKDIR /root/

# 安装PHP
COPY remi-release-6.rpm  ./
RUN yum install -y epel-release \
	&& rpm -ivh remi-release-6.rpm \
	&& yum install -y --enablerepo=remi --enablerepo=remi-php56 php php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-ssh2  php-opcache \
	&& rm remi-release-6.rpm \
    && php --version \
    && ln -sf /conf/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf \
    && ln -sf /conf/php.ini /etc/php.ini \
    && echo -e '#!/bin/bash\nchown -R apache.apache /tmp/dola*\n/usr/sbin/httpd -D FOREGROUND' > /usr/local/bin/http-foregroud \
    && chmod +x /usr/local/bin/http-foregroud \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
    && mkdir -p /tmp/dolabank && chmod -R 777 /tmp/dolabank

EXPOSE 80 443

ENTRYPOINT ["http-foregroud"]
FROM centos:centos6.8
MAINTAINER "chenyoufeng" <youfeng.chen@dolabank.com>

#   && ln -sf /conf/httpd/conf.d /etc/httpd/conf.d \

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm \
  && yum install -y http://rpms.remirepo.net/enterprise/remi-release-6.rpm \
  && yum install -y --enablerepo=remi --enablerepo=remi-php71 php php-devel php-pdo php-pecl-xdebug php-mbstring php-mcrypt php-bcmath php-xml php-mysqlnd mod_ssl php-pecl-redis php-pecl-zip php-opcache \
  \
  && yum remove -y epel remi && yum clean all && php --version \
  \
  && ln -sf /conf/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf \
  && ln -sf /conf/php.ini /etc/php.ini \
  && echo -e '#!/bin/bash\nchown -R apache.apache /tmp/dola*\ngroupadd -g 500 dola\nusermod -a -G dola apache\n/usr/sbin/httpd -D FOREGROUND' > /usr/local/bin/http-foregroud \
  && chmod +x /usr/local/bin/http-foregroud \
  && ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
  && mkdir -p /tmp/dolabank && chmod -R 777 /tmp/dolabank

EXPOSE 80 443

ENTRYPOINT ["http-foregroud"]
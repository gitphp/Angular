FROM centos:centos6.8
MAINTAINER "chenyoufeng" <youfeng.chen@dolabank.com>

WORKDIR /usr/local/src
ENV PATH /usr/java/jdk1.7.0_80/jre/bin:/usr/java/jdk1.7.0_80/bin:$PATH

COPY remi-release-6.rpm ./
# COPY hahang/*.jar ./
#   && mv *.jar /usr/java/jdk1.7.0_80/jre/lib/ext/ \
#   && mv /usr/java/jdk1.7.0_80/jre/lib/ext/JavaBridge.jar /home \
COPY jdk-7u80-linux-x64.tar.gz  ./

RUN yum install -y epel-release \
  && rpm -ivh remi-release-6.rpm \
  && yum install -y --enablerepo=remi --enablerepo=remi-php56 php php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-ssh2 php-bcmath \
  \
  && mkdir /usr/java \
  && tar xf jdk-7u80-linux-x64.tar.gz -C /usr/java/ \
  \
  && echo -e '#!/bin/bash\njava -jar /home/JavaBridge.jar SERVLET_LOCAL:8080 3 /var/log/JavaBridge.log & /usr/sbin/httpd -D FOREGROUND' > /usr/local/bin/javabridge \
  && chmod +x /usr/local/bin/javabridge \
  && yum remove -y epel remi \
  && yum clean all \
  && rm -rf /usr/local/src/* \
  \
  && ln -sf /conf/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf \
  && ln -sf /conf/php.ini /etc/php.ini \
  \
  && mkdir -p /tmp/dolabank && chmod -R 777 /tmp/dolabank \
  \
  && ln -sf /var/www/html/p2p_escrow/java/hahang/SignEncrypt.jar /usr/java/jdk1.7.0_80/jre/lib/ext/SignEncrypt.jar \
  && ln -sf /var/www/html/p2p_escrow/java/hahang/commons-codec-1.9.jar /usr/java/jdk1.7.0_80/jre/lib/ext/commons-codec-1.9.jar \
  && ln -sf /var/www/html/p2p_escrow/java/hahang/commons-io-1.4.jar /usr/java/jdk1.7.0_80/jre/lib/ext/commons-io-1.4.jar \
  && ln -sf /var/www/html/p2p_escrow/java/hahang/JavaBridge.jar /home/JavaBridge.jar

EXPOSE 80
ENTRYPOINT ["javabridge"]

FROM centos:7
#FROM ubuntu:18.04

MAINTAINER zyy (952233678@qq.com)

ENV DEBIAN_FRONTEND noninteractive

ARG java_home=/home/apps/jdk8
ARG tomcat_home=/home/apps/tomcat8

RUN mkdir -p /home/apps/ && mkdir -p /root/.ssh

ADD ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
ADD ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key.pub
ADD authorized_keys /root/.ssh/authorized_keys

COPY jdk-8u191-linux-x64.tar.gz /home/apps
COPY apache-tomcat-8.5.37.tar.gz /home/apps

#ENV CATALINA_HOME /home/apps/tomcat8
#ENV JAVA_HOME=$java_home
#ENV JRE_HOME=${JAVA_HOME}/jre/
#ENV CLASSPATH=${JAVA_HOME}/lib/
#ENV PATH=$PATH:${JAVA_HOME}/bin

ADD tomcat8 /usr/local/bin/tomcat8
ADD init    /usr/local/bin/init

RUN set -x \
        && yum -y update \
        && yum -y install ntpdate \
        && chmod 777 /usr/local/bin/tomcat8 \
        && chmod 777 /usr/local/bin/init \
#        && sed -i '$a\export LANG=en_US.UTF-8' /etc/profile \
#        && sed -i '$a\export JAVA_HOME=/home/apps/jdk8' /etc/profile \
#        && sed -i '$a\export JRE_HOME=$JAVA_HOME/jre' /etc/profile \
#        && sed -i '$a\export CATALINA_HOME=/home/apps/tomcat8' /etc/profile \
#        && sed -i '$a\export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin' /etc/profile \
#        && sed -i '$a\export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib' /etc/profile \
        && cd /home/apps/ && tar xzf jdk-8u191-linux-x64.tar.gz && mv jdk1.8.0_191 ${java_home} && rm -f jdk-8u191-linux-x64.tar.gz \
        && cd /home/apps/ && tar xzf apache-tomcat-8.5.37.tar.gz && mv apache-tomcat-8.5.37 ${tomcat_home} && rm -f apache-tomcat-8.5.37.tar.gz \
#       && sed -i "niecho "CATALINA_HOME=/home/apps/tomcat8"" a 
#       && yum -y install wget \
        && yum -y install net-tools \
        && yum -y install openssh-server \
        && yum clean all \
        && echo "root:Qq123456"|chpasswd \
        && echo "Hello World!"

EXPOSE 22 8080
#ENTRYPOINT ntpdate ntp1.aliyun.com && timedatectl set-timezone Asia/Shanghai && hwclock --systohc 
#CMD ["/home/sshd.sh"]
CMD /bin/bash
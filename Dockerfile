FROM ansible/centos7-ansible:latest
MAINTAINER www.jfedu.net 2022
WORKDIR /root/
RUN mv /etc/yum.repos.d/* /tmp/
RUN cp /tmp/CentOS-Base* /etc/yum.repos.d/
RUN yum install -y net-tools
RUN yum install -y openssh-server openssh
RUN ssh-keygen -A
ENV PASS 1
RUN echo $PASS|passwd --stdin root
RUN yum install -y wget make gzip zip unzip
RUN yum install httpd -y
COPY index.html /var/www/html/
VOLUME /var/www/html/
EXPOSE 80 22 8080
ENTRYPOINT /usr/sbin/init
CMD /usr/sbin/sshd -D

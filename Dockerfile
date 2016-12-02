FROM centos:7
MAINTAINER "DBousquet" didier.bousquet@eservglobal.com
ENV container docker
RUN yum clean all; yum -y update
RUN yum -y install iproute net-tools 
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i ==systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

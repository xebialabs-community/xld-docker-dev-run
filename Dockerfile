FROM xebialabs/xld_dev_compile:v6.0.0.1

MAINTAINER Joris De Winne <jdewinne@xebialabs.com>
ENV REFRESHED_AT 2016-11-10

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xld/command.sh

CMD ["/usr/bin/supervisord"]
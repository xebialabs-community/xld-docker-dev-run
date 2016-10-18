FROM xebialabs/xld_dev_compile:v5.5.5.4

MAINTAINER Joris De Winne <jdewinne@xebialabs.com>
ENV REFRESHED_AT 2016-10-17

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xld/command.sh

CMD ["/usr/bin/supervisord"]
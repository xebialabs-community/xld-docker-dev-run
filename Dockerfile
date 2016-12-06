FROM xebialabs/xld_dev_compile:v6.0.1.1

MAINTAINER Joris De Winne <jdewinne@xebialabs.com>
ENV REFRESHED_AT 2016-12-06

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xld/command.sh
ADD resources/xld_test.py /opt/xld/xld_test.py
ADD resources/jython-standalone-2.7.0.jar /opt/xld/cli/lib/jython-standalone-2.7.0.jar

CMD ["/usr/bin/supervisord"]
FROM xebialabs/xld_dev_compile:v7.0.0.1

MAINTAINER XebiaLabs <info@xebialabs.com>
ENV REFRESHED_AT 2017-06-05

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xld/command.sh
ADD resources/xld_test.py /opt/xld/xld_test.py
ADD resources/jython-standalone-2.7.0.jar /opt/xld/cli/lib/jython-standalone-2.7.0.jar

CMD ["/usr/bin/supervisord"]

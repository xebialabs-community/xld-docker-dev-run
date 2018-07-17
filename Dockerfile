ARG xld_tag
FROM xebialabsunsupported/xld_dev_compile:$xld_tag

MAINTAINER XebiaLabs <info@xebialabs.com>

ADD resources/command.sh /opt/xld/command.sh

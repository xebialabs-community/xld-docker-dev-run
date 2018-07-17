#!/usr/bin/env sh

# Copy downloads into 'plugins'
if [ -d "/data/build/downloads/plugins" ]; then
    cp /data/build/downloads/plugins/* /opt/xl-deploy-server/plugins
fi

# Copy to plugins
cp /data/build/distributions/*.xldp /opt/xl-deploy-server/plugins

# Link `ext` folder
find /data/src/main/resources -maxdepth 1 -mindepth 1 -type d -exec ln -s -f '{}' /opt/xl-deploy-server/ext/ \;
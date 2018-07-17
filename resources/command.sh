#!/usr/bin/env sh

# Copy downloads into 'plugins'
if [ -d "/data/build/downloads/plugins" ]; then
    cp /data/build/downloads/plugins/* /opt/xl-deploy-server/default-plugins
fi

# Copy to plugins
cp /data/build/distributions/*.xldp /opt/xl-deploy-server/default-plugins

# Link `ext` folder
find /data/src/main/resources -maxdepth 1 -mindepth 1 -type d -exec ln -s -f '{}' /opt/xl-deploy-server/ext/ \;

export ADMIN_PASSWORD=admin
export REPOSITORY_KEYSTORE_PASSPHRASE=admin
/usr/bin/dumb-init /opt/xl-deploy-server/bin/run-in-container.sh
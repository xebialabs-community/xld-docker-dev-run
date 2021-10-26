#!/usr/bin/env sh

# Copy downloads into 'plugins'
if [ -d "/data/build/downloads/plugins" ]; then
    cp /data/build/downloads/plugins/* ${APP_HOME}/default-plugins/__local__
fi

# Copy to plugins
cp /data/build/distributions/*.xldp ${APP_HOME}/default-plugins/__local__

# Link `ext` folder
find /data/src/main/resources -maxdepth 1 -mindepth 1 -type d -exec ln -s -f '{}' ${APP_HOME}/ext/ \;

# Link license
ln -s /license/deployit-license.lic ${APP_HOME}/default-conf/deployit-license.lic

export ADMIN_PASSWORD=admin
export REPOSITORY_KEYSTORE_PASSPHRASE=admin
/opt/xebialabs/tini ${APP_HOME}/bin/run-in-container.sh

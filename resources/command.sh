#!/usr/bin/env sh

# Copy downloads into 'plugins'
if [ -d "/data/build/downloads/plugins" ]; then
    cp /data/build/downloads/plugins/* /opt/xld/server/plugins
fi

# Copy to plugins
cp /data/build/distributions/*.xldp /opt/xld/server/plugins

# Link `ext` folder
find /data/src/main/resources -maxdepth 1 -mindepth 1 -type d -exec ln -s -f '{}' /opt/xld/server/ext/ \;

# Start XLD and
# Run XLD CLI xld_initialize
count=0
/opt/xld/server/bin/run.sh &
echo "Waiting for server to start..."
sleep 10
while true
do
  if [ $count -le 25 ]; then

    wget --spider -q http://localhost:4516
    if [ $? -ne 0 ] ;then
      echo "waiting $count"
      tail -1 /opt/xld/server/log/deployit.log
      sleep 4
      count=$(( count+1 ))
    else
      sleep 4
      echo "Website is up"
      if [ -f /data/build/resources/test/docker/initialize/xld_initialize.py ]; then
          /opt/xld/cli/bin/cli.sh -username admin -password admin -f /data/build/resources/test/docker/initialize/xld_initialize.py
          res=$?
          if [ $res != 0 ] ; then
            exit $res
          fi
      fi
      if [ -d /data/build/resources/test/docker/tests ]; then
          cp /data/build/resources/test/docker/tests/* /opt/xld/cli/ext
          /opt/xld/cli/bin/cli.sh -username admin -password admin -f /opt/xld/xld_test.py
          res=$?
          if [ $res != 0 ] ; then
            exit $res
          fi
      fi
      sleep 4
      exit
    fi
  else
    echo "Timeout exceeded...giving up waiting for website"
    exit 1
  fi
done
#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d "
{
\"username\": \"$DOCKER_USERNAME\",
\"password\": \"$DOCKER_PASSWORD\"
}
" https://hub.docker.com/v2/users/login/ | jq -r .token)

http --follow https://gist.githubusercontent.com/jdewinne/3f13494858fad8b6b2b88ebd3439f1ea/raw/dce2f06fea89a6038acd6944c516c8be9347c48d/dockertags > ./dockertags
chmod +x dockertags

image_name="xebialabsunsupported/xld_dev_run"
./dockertags -i xebialabsunsupported/xl-deploy -e "centos$" > /tmp/xld
./dockertags -i $image_name > /tmp/xl
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
while read tag ; do
    docker build -t $image_name:$tag --build-arg xld_tag=$tag .
    echo "####################################################################"
    echo "####        $image_name:$tag built"
    docker push $image_name:$tag
    echo "####        $image_name:$tag pushed"
    echo "####################################################################"
done < <(comm -23 <(sort /tmp/xld) <(sort /tmp/xl))

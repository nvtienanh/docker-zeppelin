#!/bin/bash
set -e

if [ $# -eq 0 ]
    then
        BRANCH=$(git rev-parse --abbrev-ref HEAD)
    else
        BRANCH=$1
fi

if [ $BRANCH == "master" ]
then
    ZEPPELIN_VERSION="0.8.2"
    IMAGE_TAG="latest"
else
    ZEPPELIN_VERSION="$(echo $BRANCH | cut -d'-' -f1)"
    IMAGE_TAG=$BRANCH
fi

echo $BRANCH

deploy() {
    NAME=$1
    IMAGE_TAG=$2
    ZEPPELIN_VERSION=$3
    SPARK_BASE=$4
    IMAGE=nvtienanh/zeppelin:$IMAGE_TAG
    cd $([ -z "$1" ] && echo "./$NAME" || echo "$1")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build \
     -t $IMAGE \
     --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
     --build-arg VCS_REF=`git rev-parse --short HEAD` \
     --build-arg SPARK_BASE=$SPARK_BASE \
     --build-arg ZEPPELIN_VERSION=$ZEPPELIN_VERSION .
    cd -
    docker push $IMAGE
}


deploy zeppelin $IMAGE_TAG $ZEPPELIN_VERSION 2.4.3-debian
# Update Microbadger
curl -X POST https://hooks.microbadger.com/images/nvtienanh/zeppelin/X8D_8YdknhUZiRvtXEJUTmYJSkk=
#!/bin/sh -l

IMAGE_NAME="$INPUT_GCR_HOST/$GOOGLE_PROJECT_ID/$INPUT_IMAGE_NAME:$INPUT_IMAGE_TAG"

BUILD_ARGS=""
if [ -z "$INPUT_BUILD_ARGS" ]
then
    BUILD_ARGS="--build-arg ${$INPUT_BUILD_ARGS}"
fi

echo $GCLOUD_SERVICE_KEY | docker login -u _json_key --password-stdin https://$INPUT_GCR_HOST/
docker build $BUILD_ARGS -t $IMAGE_NAME -f $INPUT_FILE .
docker push $IMAGE_NAME 

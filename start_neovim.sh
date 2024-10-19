#!/bin/bash

# コンテナ名
CONTAINER_NAME="your container name"

# イメージ名
IMAGE_NAME="your image name"

# ホストのディレクトリを指定（必要に応じて変更）
HOST_DIRECTORY="/path/to/host/directory"
CONTAINER_DIRECTORY="/path/in/container"

# コンテナが既に存在する場合は削除
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Removing existing container..."
    docker rm -f $CONTAINER_NAME
fi

# コンテナを起動
echo "Starting the container..."
docker run -d \
    --name $CONTAINER_NAME \
    -v $HOST_DIRECTORY:$CONTAINER_DIRECTORY \
    $IMAGE_NAME bash
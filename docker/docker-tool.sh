#!/bin/bash

exec_dir=$(pwd)
cd "${1}"
source meta.docker
shift

BUILD_BOOL=0
PUSH_BOOL=0
RUN_BOOL=0

help(){
  echo "Please supply a platform and service path (e.g. 'rockylinux/go') and docker action argument: b|build, p|push, r|run are valid arguments."
}

iterate_tag(){
  TAG=$(curl https://registry.hub.docker.com/v2/repositories/$REPO/${NAME}-${SERVICE}/tags  | grep -oE "\"name\":\"[0-9]+\"" | cut -d ":" -f 2 | cut -d "\"" -f 2)
  TAG=$(( $TAG + 1 ))
}

build(){
  docker build -t "${NAME}-${SERVICE}:${TAG}" .
}

push(){
  docker tag "$NAME-$SERVICE:${TAG}" "$REPO/$NAME-$SERVICE:${TAG}"
  docker push "$REPO/$NAME-$SERVICE:${TAG}"
  docker tag "$NAME-$SERVICE:${TAG}" "$REPO/$NAME-$SERVICE:latest"
  docker push "$REPO/$NAME-$SERVICE:latest"
}

run(){
  docker run -it --rm "${NAME}-${SERVICE}:${TAG}"
}

if [[ $# -eq 0 ]]; then
  help
  exit 1
fi

while [[ $# -gt 0 ]]; do
  case $1 in
    b|build)
      BUILD_BOOL=1
      shift
      ;;
    p|push)
      PUSH_BOOL=1
      shift
      ;;
    r|run)
      RUN_BOOL=1
      shift # past argument
      ;;
    *)
      help
      exit 1
      ;;
  esac
done

iterate_tag
if [ $BUILD_BOOL -eq 1 ]; then build; fi
if [ $PUSH_BOOL -eq 1 ]; then push; fi
if [ $RUN_BOOL -eq 1 ]; then run; fi

cd $exec_dir

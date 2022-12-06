#!/bin/bash

exec_dir=$(pwd)
cd "${1}"
source meta.docker
shift

help(){
  echo "Please supply a platform and service path (e.g. 'rockylinux/go') and docker action argument: b|build, p|push, r|run are valid arguments."
}

iterate_tag(){
  TAG=$(curl https://registry.hub.docker.com/v1/repositories/$REPO/${NAME}-${SERVICE}/tags  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | sed -sn 2p | cut -d ":" -f3)
  if [ -z "$TAG" ]; then
    TAG=1;
  fi
}

build(){
  iterate_tag
  docker build -t "${NAME}-${SERVICE}:${TAG}" .
}

push(){
  iterate_tag
  docker tag "$NAME-$SERVICE:${TAG}" "$REPO/$NAME-$SERVICE:${TAG}"
  docker push "$REPO/$NAME-$SERVICE:${TAG}"
  docker tag "$NAME-$SERVICE:${TAG}" "$REPO/$NAME-$SERVICE:latest"
  docker push "$REPO/$NAME-$SERVICE:latest"
}

run(){
  iterate_tag
  docker run -it --rm "${NAME}-${SERVICE}:${TAG}"
}

if [[ $# -eq 0 ]]; then
  help
  exit 1
fi

while [[ $# -gt 0 ]]; do
  case $1 in
    b|build)
      build
      shift
      ;;
    p|push)
      push
      shift
      ;;
    r|run)
      run
      shift # past argument
      ;;
    *)
      help
      exit 1
      ;;
  esac
done

cd $exec_dir

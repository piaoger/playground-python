#!/bin/bash

THIS_DIR=$(cd ${0%/*} && echo $PWD)
source $THIS_DIR/environment.sh

## -----------------------------------------
## golang
## -----------------------------------------
cd $APP_CACHE_DIR

# history:
# 1.6.2
# 1.7.4
GOLANG_VERSION=1.7.4

if [ "$OS" = "Darwin" ]; then
   export GOLANG_PKG_NAME=go$GOLANG_VERSION.darwin-amd64.tar.gz
else
   export GOLANG_PKG_NAME=go$GOLANG_VERSION.linux-amd64.tar.gz
fi

# download & decompress
GOLANG_DOWNLOAD_URL=https://storage.googleapis.com/golang/$GOLANG_PKG_NAME
if [ ! -f $GOLANG_PKG_NAME ]; then
    # TODO: use curl in mac by default
    echo "install golang from $GOLANG_DOWNLOAD_URL"
    wget $GOLANG_DOWNLOAD_URL
fi
tar -vxf $GOLANG_PKG_NAME

# copy to destination
APP_BIN_GOLANG_DIR=$APP_BIN_DIR/golang/go-v$1.7.4
rm -rf $APP_BIN_GOLANG_DIR
mkdir -p $APP_BIN_GOLANG_DIR

mv $APP_CACHE_DIR/go/bin        $APP_BIN_GOLANG_DIR/$OS
mv $APP_CACHE_DIR/go/pkg        $APP_BIN_GOLANG_DIR/pkg
mv $APP_CACHE_DIR/go/src        $APP_BIN_GOLANG_DIR/src
mv $APP_CACHE_DIR/go/VERSION    $APP_BIN_GOLANG_DIR/VERSION

# clean up cache
rm -rf $APP_CACHE_DIR/go


export PATH=$APP_BIN_GOLANG_DIR/$OS:$PATH
export GOROOT=$APP_BIN_GOLANG_DIR/$OS
go version
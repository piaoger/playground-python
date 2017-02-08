#!/bin/bash

THIS_DIR=$(cd ${0%/*} && echo $PWD)
source $THIS_DIR/environment.sh

## -----------------------------------------
## node.js
## -----------------------------------------
cd $APP_CACHE_DIR

export NODEJS_VERSION=v4.2.4

if [ "$OS" = "Darwin" ]; then
   export NODEJS_PKG_NAME=node-$NODEJS_VERSION-darwin-x64.tar.gz
   export NODEJS_ROOT_NAME=node-$NODEJS_VERSION-darwin-x64
else
   export NODEJS_PKG_NAME=node-$NODEJS_VERSION-linux-x64.tar.gz
   export NODEJS_ROOT_NAME=node-$NODEJS_VERSION-linux-x64
fi

if [ ! -f $NODEJS_PKG_NAME ]; then
    wget --no-check-certificate https://nodejs.org/dist/$NODEJS_VERSION/$NODEJS_PKG_NAME
fi
tar -vxf $NODEJS_PKG_NAME

# copy to destination
APP_BIN_NODEJS_DIR=$APP_BIN_DIR/nodejs/nodejs-$NODEJS_VERSION
rm -rf $APP_BIN_NODEJS_DIR

mkdir -p $APP_BIN_NODEJS_DIR
mv -f $APP_CACHE_DIR/$NODEJS_ROOT_NAME/* $APP_BIN_NODEJS_DIR

export PATH=$APP_BIN_NODEJS_DIR/bin:$PATH:
export NODE_PATH=$NODE_PATH:$APP_BIN_NODEJS_DIR/lib/node_modules

echo $APP_BIN_NODEJS_DIR/bin/node
echo "node version:"
node --version



# yarn
curl -o- -L https://yarnpkg.com/install.sh | bash
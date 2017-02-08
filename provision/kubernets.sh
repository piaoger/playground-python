#!/bin/bash

THIS_DIR=$(cd ${0%/*} && echo $PWD)
source $THIS_DIR/environment.sh

## -----------------------------------------
## kubernets
## -----------------------------------------
cd $APP_CACHE_DIR

# http://get.k8s.io/
# version: https://github.com/kubernetes/kubernetes/releases
# history:
# 1.3.6
# 1.5.1
K8S_VERSION=1.3.6

K8S_PKG_NAME=k8s-v$K8S_VERSION.zip

if [ ! -f $K8S_PKG_NAME ]; then
    if [ "$OS" = "Linux" ]; then
        K8S_URL=http://storage.googleapis.com/kubernetes-release/release/v${K8S_VERSION}/bin/linux/amd64
        K8S_EXECS="\
          kubectl \
          hyperkube"

        mkdir -p $APP_CACHE_DIR/k8s-v$K8S_VERSION
        cd $APP_CACHE_DIR/k8s-v$K8S_VERSION
        for K8SEXEC in $K8S_EXECS; do
            echo "downloading $$K8S_URL/$K8SEXEC"
            wget --no-check-certificate $K8S_URL/$K8SEXEC
            chmod +x $APP_CACHE_DIR/k8s-v$K8S_VERSION/$K8SEXEC
            mv $K8SEXEC $APP_CACHE_DIR/k8s-v$K8S_VERSION/
        done
        cd $APP_CACHE_DIR/
        zip -r k8s-v$K8S_VERSION.zip ./k8s-v$K8S_VERSION/
    fi
else
    echo "unzipping .."
    unzip -o k8s-v$K8S_VERSION
fi

# copy to destinatione
APP_BIN_K8S_DIR=$APP_BIN_DIR/kubernets/
rm -rf $APP_BIN_K8S_DIR/k8s-v$K8S_VERSION

mkdir -p $APP_BIN_K8S_DIR
mv -f $APP_CACHE_DIR/k8s-v$K8S_VERSION $APP_BIN_K8S_DIR

export PATH=$APP_BIN_K8S_DIR:$PATH

#hyperkube --help
#kubectl --help
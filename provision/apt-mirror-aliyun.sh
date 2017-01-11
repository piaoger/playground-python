#!/usr/bin/env bash

cd /vagrant/provision

# http://blog.csdn.net/freeman1975/article/details/51475250
sudo cat /etc/apt/sources.list >> /vagrant/provision/sources.list
sudo cat apt-mirror-aliyun.list >> /vagrant/provision/sources.list
sudo mv /vagrant/provision/sources.list /etc/apt/sources.list

sudo apt-get update
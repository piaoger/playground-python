#!/usr/bin/env bash

#cd /vagrant

mkdir -p /vagrant/temp

# echo "swithch to aliyun source ..." >> /vagrant/temp/log.txt
# /vagrant/provision/apt-mirror-aliyun.sh >> /vagrant/temp/log.txt

# echo "scm tools ..." >> /vagrant/temp/log.txt
# /vagrant/provision/git.sh >> /vagrant/temp/log.txt
# /vagrant/provision/mercurial.sh >> /vagrant/temp/log.txt

# echo "base tools ..." >> /vagrant/temp/log.txt
# /vagrant/provision/curl_wget.sh >> /vagrant/temp/log.txt

# echo "dev tools ..." >> /vagrant/temp/log.txt
# /vagrant/provision/python.sh >> /vagrant/temp/log.txt
# /vagrant/provision/django.sh >> /vagrant/temp/log.txt
# /vagrant/provision/gcc.sh >> /vagrant/temp/log.txt

# echo "social tools ..." >>/vagrant/temp/log.txt
# /vagrant/provision/social.sh >> /vagrant/temp/log.txt

echo "bashrc ..." >>/vagrant/temp/log.txt
/vagrant/provision/bashrc.sh >> /vagrant/temp/log.txt

echo "ai ..." >>/vagrant/temp/log.txt
/vagrant/provision/python-science.sh >> /vagrant/temp/log.txt
/vagrant/provision/theano.sh >> /vagrant/temp/log.txt

echo "provision is done !!" >> /vagrant/temp/log.txt

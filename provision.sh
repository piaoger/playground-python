#!/usr/bin/env bash

#cd /vagrant

mkdir -p /vagrant/temp


echo "scm tools ..." >> /vagrant/temp/log.txt
/vagrant/provision/git.sh >> /vagrant/temp/log.txt
/vagrant/provision/mercurial.sh >> /vagrant/temp/log.txt

echo "base tools ..." >> /vagrant/temp/log.txt
/vagrant/provision/curl_wget.sh >> /vagrant/temp/log.txt

echo "dev tools ..." >> /vagrant/temp/log.txt
/vagrant/provision/python.sh >> /vagrant/temp/log.txt
/vagrant/provision/gcc.sh >> /vagrant/temp/log.txt

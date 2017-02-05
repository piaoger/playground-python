#!/usr/bin/env bash

sudo su - ubuntu



cat >> $APP_TMP_DIR/run-bubble <<EOF
# bashrc_has_been_appended
source /home/ubuntu/bashrc-append.bashrc

EOF



pwd

cp /vagrant/provision/bashrc-append.bashrc /home/ubuntu/bashrc-append.bashrc     >> /vagrant/temp/log.txt

echo "cp done"

ls -a  /home/ubuntu/

rm /home/ubuntu/bashrc.tmp
touch /home/ubuntu/bashrc.tmp

cat /home/ubuntu/.bashrc > /home/ubuntu/bashrc.tmp
cat >> /home/ubuntu/bashrc.tmp <<EOF
# bashrc_has_been_appended
#
source ~/bashrc-append.bashrc

EOF

#grep 'bashrc_has_been_appended' ~/.bashrc || echo $append_source >> ~/.bashrc
grep 'bashrc_has_been_appended' /home/ubuntu/.bashrc || cat /home/ubuntu/bashrc.tmp > /home/ubuntu/.bashrc

cat ~/.bashrc >> /vagrant/temp/log.txt

exit
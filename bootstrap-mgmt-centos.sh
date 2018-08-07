#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
yum update
yum -y install epel-release
yum -y install ansible

chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.21  node1
10.0.15.22  node2
10.0.15.23  node3
10.0.15.24  node4
10.0.15.25  node5
10.0.15.26  node6
10.0.15.27  node7
10.0.15.28  node8
10.0.15.29  node9
EOL

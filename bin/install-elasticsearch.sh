#!/bin/bash

function install-elasticsearch() {
  rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
  cp /vagrant/conf/elasticsearch.repo /etc/yum.repos.d/
  yum -y install elasticsearch
}

function start() {
  systemctl enable elasticsearch.service
  service elasticsearch start
  chkconfig elasticsearch on
}

function main() {
  install-elasticsearch
  start
}

main
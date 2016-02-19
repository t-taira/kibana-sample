#!/bin/bash

function install-kibana() {
  wget https://download.elastic.co/kibana/kibana/kibana-4.3.1-linux-x64.tar.gz
  tar xvfz kibana-4.3.1-linux-x64.tar.gz
  ln -s kibana-4.3.1-linux-x64 kibana
  cd kibana
}

function start() {
  ./bin/kibana &
}

function main() {
  install-kibana
  start
}

main
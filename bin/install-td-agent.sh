#!/bin/bash

function install-td-agent() {
  curl -L http://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
  cp /vagrant/conf/td-agent.conf /etc/td-agent
}

function install-td-agent-plugins() {
  /usr/sbin/td-agent-gem install \
    fluent-plugin-elasticsearch \
    fluent-plugin-mysql-replicator \
    fluent-plugin-couchbase \
    --no-ri --no-rdoc
}

function start() {
  service td-agent start
  chkconfig td-agent on
}

function main() {
  install-td-agent
  install-td-agent-plugins
  start
}

main
#!/bin/bash

function install-couchbase() {
   wget http://packages.couchbase.com/releases/4.0.0-dp/couchbase-server-enterprise-4.0.0-dp-centos7.x86_64.rpm
   rpm -ivh couchbase-server-enterprise-4.0.0-dp-centos7.x86_64.rpm
}

function main() {
  install-couchbase
}

main
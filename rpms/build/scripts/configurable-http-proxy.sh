#!/usr/bin/env bash

USERID=$1
GROUPID=$2

source /opt/rh/python27/enable
source /opt/rh/devtoolset-6/enable

set -x
set -e

yum install -y /tmp/rpmbuild/RPMS/x86_64/nodejs-8.5.0-13.x86_64.rpm
ldconfig

mkdir -p /tmp/working/SOURCES/
mkdir -p /tmp/working/RPMS/x86_64
cp -R /tmp/rpmbuild/SPECS /tmp/working
cd /tmp/working
rpmbuild -v -bb --clean SPECS/configurable-http-proxy.spec
mkdir -p /tmp/rpmbuild/RPMS/x86_64
chmod 666 RPMS/x86_64/configurable-http-proxy*
cp RPMS/x86_64/configurable-http-proxy* /tmp/rpmbuild/RPMS/x86_64

#!/usr/bin/env bash

USERID=$1
GROUPID=$2

source /opt/rh/python27/enable
source /opt/rh/devtoolset-6/enable

set -x
set -e

yum install -y /tmp/rpmbuild/RPMS/x86_64/nodejs-8.5.0-13.x86_64.rpm
ldconfig

cp -R /tmp/rpmbuild /tmp/working
cd /tmp/working
rpmbuild -v -bb --clean SPECS/configurable-http-proxy.spec
/usr/bin/sudo -u \#${USERID} -g \#${GROUPID} cp RPMS/x86_64/configurable-http-proxy* /tmp/rpmbuild/RPMS/x86_64

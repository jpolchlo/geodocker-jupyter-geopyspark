#!/usr/bin/env bash

USERID=$1
GROUPID=$2

source /opt/rh/python27/enable
source /opt/rh/devtoolset-6/enable

set -x
set -e

yum install -y /tmp/rpmbuild/RPMS/x86_64/nodejs-8.5.0-13.x86_64.rpm
ldconfig

cp /tmp/rpmbuild /tmp/working
cd /tmp/working
rpmbuild -v -bb --clean SPECS/configurable-http-proxy.spec
chown -R $USERID:$GROUPID /tmp/rpmbuild
cp /tmp/working/RPMS/x86_64/configurable-http-proxy* /tmp/rpmbuild/RPMS/x86_64

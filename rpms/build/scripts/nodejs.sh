#!/usr/bin/env bash

USERID=$1
GROUPID=$2

source /opt/rh/python27/enable
source /opt/rh/devtoolset-6/enable

set -x
set -e

ldconfig

cp -R /tmp/rpmbuild /tmp/working
cd /tmp/working
rpmbuild -v -bb --clean SPECS/nodejs.spec
chown -R $USERID:$GROUPID /tmp/working/RPMS
cp RPMS/x86_64/nodejs* /tmp/rpmbuild/RPMS/x86_64

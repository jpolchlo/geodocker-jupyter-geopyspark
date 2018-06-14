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
rpmbuild -v -bb --clean SPECS/proj.spec
chmod 666 RPMS/x86_64/proj493*
cp RPMS/x86_64/proj493* /tmp/rpmbuild/RPMS/x86_64

#!/usr/bin/env bash

USERID=$1
GROUPID=$2

source /opt/rh/python27/enable
source /opt/rh/devtoolset-6/enable

set -x
set -e

yum install -y libcurl-devel
ldconfig

cp -R /tmp/rpmbuild /tmp/working
cd /tmp/working
rpmbuild -v -bb --clean SPECS/hdf5.spec
mkdir -p /tmp/rpmbuild/RPMS/x86_64
chmod 666 RPMS/x86_64/hdf*
cp RPMS/x86_64/hdf* /tmp/rpmbuild/RPMS/x86_64

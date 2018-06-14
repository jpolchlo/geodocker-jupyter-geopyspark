#!/usr/bin/env bash

USERID=$1
GROUPID=$2

source /opt/rh/python27/enable
source /opt/rh/devtoolset-6/enable

set -x
set -e

yum install -y libcurl-devel
yum localinstall -y /tmp/rpmbuild/RPMS/x86_64/proj493-4.9.3-33.x86_64.rpm /tmp/rpmbuild/RPMS/x86_64/hdf5-1.8.20-33.x86_64.rpm
ldconfig

cp -R /tmp/rpmbuild /tmp/working
cd /tmp/working
rpmbuild -v -bb --clean SPECS/netcdf.spec
chmod 666 RPMS/x86_64/netcdf*
cp RPMS/x86_64/netcdf* /tmp/rpmbuild/RPMS/x86_64

#!/usr/bin/env bash

USERID=$1
GROUPID=$2

set -x
set -e

yum install -y geos-devel lcms2-devel libcurl-devel libpng-devel openjpeg-devel zlib-devel
yum localinstall -y /tmp/rpmbuild/RPMS/x86_64/proj493-4.9.3-33.x86_64.rpm /tmp/rpmbuild/RPMS/x86_64/hdf5-1.8.20-33.x86_64.rpm /tmp/rpmbuild/RPMS/x86_64/netcdf-4.5.0-33.x86_64.rpm
ldconfig

cp -R /tmp/rpmbuild /tmp/working
cd /tmp/working
rpmbuild -v -bb --clean SPECS/gdal.spec
mkdir -p /tmp/rpmbuild/RPMS/x86_64
chmod 666 RPMS/x86_64/gdal*
cp RPMS/x86_64/gdal* /tmp/rpmbuild/RPMS/x86_64

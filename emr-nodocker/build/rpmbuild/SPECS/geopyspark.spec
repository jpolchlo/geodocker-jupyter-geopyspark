%define _topdir   /tmp/rpmbuild
%define name      geopyspark
%define release   13
%define version   0.2.2

BuildRoot: %{buildroot}
Summary:   GeoPySpark
License:   Apache 2.0
Name:      %{name}
Version:   %{version}
Release:   %{release}
Source:    geopyspark.tar
Prefix:    /
Group:     Geography

%global _enable_debug_package 0
%global debug_package %{nil}
%global __os_install_post /usr/lib/rpm/brp-compress %{nil}

%description
GeoPySpark 0.2.2

%prep
%setup -q -n geopyspark

%build
echo

%install
find /usr/local | grep 'site-packages/[^/]\+$' | sort > before.txt
pip3 install Cython==0.27
pip3 install 'https://github.com/numpy/numpy/archive/a1ec2867999293db3e31ba3af122c0e36f56dede.zip'
pip3 install -r requirements.txt
pip3 install /archives/geopyspark.zip
pip3 install /archives/geopyspark-netcdf.zip
find /usr/local | grep 'site-packages/[^/]\+$' | sort > after.txt
tar cvf /tmp/packages.tar $(diff before.txt after.txt | grep '^>' | cut -f2 '-d ')
cd %{buildroot}
tar axvf /tmp/packages.tar
mkdir -p %{buildroot}/opt/jars
cp /archives/gddp-assembly-%{version}.jar /archives/geotrellis-backend-assembly-%{version}.jar %{buildroot}/opt/jars

%package worker
Group: Geography
Summary: GeoPySpark
%description worker
Just the Python parts

%files
%defattr(-,root,root)
/usr/local/lib/*
/usr/local/lib64/*
/opt/jars/*

%files worker
%defattr(-,root,root)
/usr/local/lib/*
/usr/local/lib64/*
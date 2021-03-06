%define _topdir   /tmp/rpmbuild
%define name      gcc6
%define release   33
%define version   6.4.0

%define debug_package %{nil}

BuildRoot: %{buildroot}
Summary:   GCC
License:   GPL
Name:      %{name}
Version:   %{version}
Release:   %{release}
Source:    gcc-%{version}.tar.xz
Prefix:    /usr/local
Group:     Azavea

%description
Gnu Compiler Collection 6.4.0

%prep
%setup -q -n gcc-6.4.0

%build
tar axvf /tmp/rpmbuild/SOURCES/isl-0.16.1.tar.bz2
mv isl-0.16.1/ isl/
./configure --prefix=/usr/local --disable-nls --disable-multilib --disable-bootstrap --enable-linker-build-id --enable-languages='c,c++'
nice -n 19 make -j$(grep -c ^processor /proc/cpuinfo)

%install
nice -n 19 make DESTDIR=%{buildroot} install

%package lib
Group: Development/Tools
Summary: GCC libraries
%description lib
The libraries

%files
%defattr(-,root,root)
/usr/local/bin/*
/usr/local/include/*
/usr/local/share/*
/usr/local/lib/*
/usr/local/lib64/*
/usr/local/libexec/*

%files lib
%defattr(-,root,root)
/usr/local/lib/*
/usr/local/lib64/*
/usr/local/libexec/*

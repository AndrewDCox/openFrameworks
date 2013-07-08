#! /bin/bash
#
# A Massively Spiffy Yet Delicately Unobtrusive Compression Library
# http://zlib.net/

VER=1.2.8

# download the source code and unpack it into LIB_NAME
function download() {
	curl -LO http://zlib.net/zlib-$VER.tar.gz
	tar -xf zlib-$VER.tar.gz
	mv zlib-$VER zlib
	rm zlib-$VER.tar.gz
}

# executed inside the build dir
function build() {
	if [ "$TYPE" == "osx" ] ; then
		echo "build not needed for $TYPE"
	else
		./configure --static
		make clean; make
	fi
}

# executed inside the lib src dir, first arg $1 is the dest libs dir root
function copy() {
	if [ "$TYPE" == "osx" ] ; then
		return
	fi
	make install
}

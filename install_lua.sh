#!/bin/bash

export PATH=/usr/bin:/bin:/usr/sbin:/sbin

ROOT_DIR=`pwd`
sysName=`uname`

echo $ROOT_DIR

echo $sysName


mkdir -p build/deps
mkdir -p bin

MAKE_LUA_OPTION=
if [ "$sysName" == "Darwin" ];then

	MACOSX_SYS=`sw_vers -productVersion`
	MAKE_LUA_OPTION="MACOSX_DEPLOYMENT_TARGET=$MACOSX_SYS"
fi


export PREFIX=$ROOT_DIR/bin
echo "install PREFIX:$ROOT_DIR/bin/luajit"
echo "cd build/LuaJIT-2.1 && make $MAKE_LUA_OPTION PREFIX=$ROOT_DIR/bin && make install"

if [ ! -d build/deps/LuaJIT-2.1 ];then
	cp -rf deps/LuaJIT-2.1 build/deps/LuaJIT-2.1
fi

if [ ! -d $ROOT_DIR/bin/luajit ];then
	cd $ROOT_DIR/build/deps/LuaJIT-2.1 && \
	make  $MAKE_LUA_OPTION && \
	make install PREFIX=$ROOT_DIR/bin/luajit
fi
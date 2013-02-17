#!/bin/bash
rootdir=`pwd`
tmpdir=/tmp/compile_$$
mkdir -p ${tmpdir}/src/
mkdir -p ${rootdir}/modules/

for a in `ls ${rootdir}/src/*`
do
    tar zxf ${a} -C ${tmpdir}/src/
done

for src in `find ${tmpdir}/src/* -maxdepth 0 -type d -print`
do
    pushd ${src}
    echo ${src}
    phpize
    ./configure
    make
    cp modules/*.so ${rootdir}/modules/
    popd
done

rm -rf ${tmpdir}


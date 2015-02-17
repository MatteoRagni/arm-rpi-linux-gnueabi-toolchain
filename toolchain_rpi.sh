# Insert this file near configure of package to build.

: ${RPI_DIR?"Need to set RPI_DIR :: ERROR"}

echo "Using Staging_Dir = $RPI_DIR"

PACKAGE_NAME=#insert here package name

toolchain_prefix=arm-rpi-linux-gnueabi
toolchain_path=$RPI_DIR/$toolchain_prefix
toolchain_binpath=$toolchain_path/bin
toolchain_include=$toolchain_path/$toolchain_prefix/sysroot/usr/include
toolchain_libpath=$toolchain_path/$toolchain_prefix/sysroot/usr/lib
toolchain_bin=$toolchain_binpath/$toolchain_prefix

CC=$toolchain_bin-gcc
CFLAGS=-I$toolchain_include
LDFLAGS=-L$toolchain_libpath

CXX=$toolchain_bin-g++
CXXFLAGS=$toolchain_include

PATH=$PATH:$toolchain_binpath

./configure --host=$toolchain_prefix --prefix=$STAGING_DIR/$PACKAGE_NAME
make 
make install
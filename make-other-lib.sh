cd $WORKPATH/
tar xf jansson-2.10.tar.gz
tar xf gengetopt-2.22.6.tar.gz
tar xf libsrtp-2.0.0.tar.gz
tar xf openssl-1.0.1g.tar.gz
tar xf gmp-6.1.2.tar.xz
tar xf nettle-3.1.tar.gz
tar xf gnutls-3.5.13.tar.xz
tar xf libnice-0.1.14.tar.gz
tar xf libmicrohttpd-0.9.54.tar.gz

cd jansson-2.10
./configure --prefix="${SYSROOT}/usr" --host=arm-linux-androideabi
make
make install
cd ..

cd gengetopt-2.22.6
./configure --prefix="${SYSROOT}/usr"         --host=arm-linux-androideabi
make
make install
cd ..

cd libsrtp-2.0.0
./configure --prefix="${SYSROOT}/usr"         --host=arm-linux-androideabi
make
make install
cd ..

#有问题
cd gmp-6.1.2
./configure --prefix="${SYSROOT}/usr" --host=arm-linux-androideabi  
#CFLAGS="--sysroot $SYSROOT" 
make
make install
cd ..

cd nettle-3.1
./configure --prefix="${SYSROOT}/usr" --host=arm-linux-androideabi 
#CFLAGS="--sysroot $SYSROOT"
make
make install
cd ..

cd gnutls-3.5.13
./configure --prefix="${SYSROOT}/usr"  \
       --host=arm-linux-androideabi    \
       --enable-static=yes \
       --enable-share=no \
       --with-included-libtasn1 \
       --with-included-unistring \
       --without-p11-kit  \
       --disable-cxx \
       PKG_CONFIG_PATH="${SYSROOT}/usr/lib/pkgconfig" 
# fix config.h
sed -i -e 's/#define HAVE_STDATOMIC_H 1//g' config.h
#modify src/Makefile  add LIBS="-lglib-2.0"
sed -i -e 's/^LIBS =/LIBS = -lglib-2.0/' src/Makefile
make 
make install
cd ..

cd libnice-0.1.14
./configure --prefix="${SYSROOT}/usr" --host=arm-linux-androideabi PKG_CONFIG_PATH="${SYSROOT}/usr/lib/pkgconfig"
make
make install
cd ..

cd libmicrohttpd-0.9.54
./configure --prefix="${SYSROOT}/usr"   --host=arm-linux-androideabi
make
make install
cd ..

. ./Setenv-android.sh
cd openssl-1.0.1g # Perl is optional, and may fail in OpenSSL 1.1.0
perl -pi -e 's/install: all install_docs install_sw/install: install_docs install_sw/g' Makefile.org
./config shared no-ssl2 no-ssl3 no-comp no-hw no-engine  --prefix="${SYSROOT}/usr"  --openssldir="${SYSROOT}/usr"
make depend
make all
# Do'not install document ,because error,not run make install. 
make install_sw
cd ..


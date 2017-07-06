cd $WORKPATH/
tar xf libiconv-1.14.tar.gz
tar xf gettext-0.19.8.tar.xz
tar xf pcre-8.40.tar.gz
tar xf libffi-3.2.1.tar.gz
tar xf glib-2.44.1.tar.xz

cd libiconv-1.14
./configure --prefix="${SYSROOT}/usr" --host=arm-linux-eabi
make
make install
cd ..

cd gettext-0.19.8
./configure --prefix="${SYSROOT}/usr" --host=arm-linux-eabi
cp $WORKPATH/gettext-fix-msginit.c ./gettext-tools/src/msginit.c
make
make install
cd ..

cd libffi-3.2.1
./configure --prefix="${SYSROOT}/usr" --host=arm-linux-androideabi
make
make install
cd ..

cd pcre-8.40
./configure --prefix="${SYSROOT}/usr" --host=arm-linux-androideabi LDFLAGS="-L$NDK/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi/"  LIBS="-lgnustl_static"
make
make install
cd ..

apt-get install -y  gettext
cd glib-2.44.1
cp $WORKPATH/glib-android.cache android.cache
CPP="arm-linux-androideabi-gcc -E" CPPFLAGS="-I${SYSROOT}/usr/include" CFLAGS="-fPIC " CXXFLAGS="-fPIC " LDFLAGS="-fPIC" ./configure --prefix="${SYSROOT}/usr" --host=arm-linux-androideabi --cache-file=android.cache CFLAGS="--sysroot $SYSROOT" --enable-static PKG_CONFIG_PATH="$SYSROOT/usr/lib/pkgconfig"
cp $WORKPATH/glib-fix-gthreadedresolver.c ./gio/gthreadedresolver.c
make
make install
cd ..
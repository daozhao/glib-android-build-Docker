# glib-android-build-docker
build glib for android

# build depend lib list:
1) iconv (1.14) https://www.gnu.org/software/libiconv/
2) gettext (0.19.8) https://www.gnu.org/software/gettext/
3) pcre (8.40) http://www.pcre.org/
4) libffi (3.2.1) https://sourceware.org/libffi/
5) glib (2.44.1) https://developer.gnome.org/glib/stable/

# build other lib list:
6) jansson (2.10) http://www.digip.org/jansson/
7) gengetopt (2.22.6) https://www.gnu.org/software/gengetopt/gengetopt.html
8) libsrtp (2.0.0) https://github.com/cisco/libsrtp
9) gmp (6.1.2) https://gmplib.org/
10) nettle (3.1) https://www.lysator.liu.se/~nisse/nettle/
11) gnutls (3.5.13) http://www.gnutls.org/
12) libnice (0.1.14) https://nice.freedesktop.org/wiki/
13) libmicrohttpd (0.9.54) https://www.gnu.org/software/libmicrohttpd/

# How to use:
```
docker run -it daozhao/glib-android-build-docker bash
```
# other information
NDK=/home/data/android-ndk-r13b  
SYSROOT=/home/data/standalone_toolchain/sysroot  
.a & .so file in /home/data/standalone_toolchain/sysroot/usr/lib/  
.h in /home/data/standalone_toolchain/sysroot/usr/include/  
arm-linux-androideab* in /home/data/standalone_toolchain/bin/  



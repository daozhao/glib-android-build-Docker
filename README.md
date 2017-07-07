# glib-android-build-Docker
build glib for android

# build depend lib list:
iconv (1.14) https://www.gnu.org/software/libiconv/
gettext (0.19.8) https://www.gnu.org/software/gettext/
pcre (8.40) http://www.pcre.org/
libffi (3.2.1) https://sourceware.org/libffi/
glib (2.44.1) https://developer.gnome.org/glib/stable/

# build other lib list:
jansson (2.10) http://www.digip.org/jansson/
gengetopt (2.22.6) https://www.gnu.org/software/gengetopt/gengetopt.html
libsrtp (2.0.0) https://github.com/cisco/libsrtp
gmp (6.1.2) https://gmplib.org/
nettle (3.1) https://www.lysator.liu.se/~nisse/nettle/
gnutls (3.5.13) http://www.gnutls.org/
libnice (0.1.14) https://nice.freedesktop.org/wiki/
libmicrohttpd (0.9.54) https://www.gnu.org/software/libmicrohttpd/

#How to use:
```
docker run -it daozhao/glib-android-build-docker bash
```
#other information
SYSROOT=/home/data/standalone_toolchain/sysroot
.a & .so file in /home/data/standalone_toolchain/sysroot/usr/lib/
.h in /home/data/standalone_toolchain/sysroot/usr/include/
arm-linux-androideab* in /home/data/standalone_toolchain/bin/



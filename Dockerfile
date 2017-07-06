FROM  buildpack-deps:jessie
MAINTAINER Daozhao chen "http://daozhao.goflytoday.com"

RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y gettext

ENV WORKPATH=/home/data

RUN mkdir -p $WORKPATH


RUN cd $WORKPATH
RUN wget https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
RUN wget https://ftp.gnu.org/pub/gnu/gettext/gettext-0.19.8.tar.xz
RUN wget https://nchc.dl.sourceforge.net/project/pcre/pcre/8.40/pcre-8.40.tar.gz
RUN wget ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz
RUN wget https://ftp.gnome.org/pub/gnome/sources/glib/2.44/glib-2.44.1.tar.xz

COPY gettext-fix-msginit.c $WORKPATH/gettext-fix-msginit.c
COPY glib-android.cache $WORKPATH/glib-android.cache
COPY glib-fix-gthreadedresolver.c $WORKPATH/glib-fix-gthreadedresolver.c

RUN wget https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip
RUN unzip -o  android-ndk-r13b-linux-x86_64.zip

ENV NDK=$WORKPATH/android-ndk-r13b

RUN $NDK/build/tools/make-standalone-toolchain.sh --platform=android-21 --toolchain=arm-linux-androideabi-4.9 --stl=gnustl --install-dir=$WORKPATH/standalone_toolchain

ENV PATH=$WORKPATH/standalone_toolchain/bin:$PATH
ENV SYSROOT=$WORKPATH/standalone_toolchain/sysroot

RUN cd $WORKPATH/standalone_toolchain/bin
RUN ln -s arm-linux-androideabi-ar arm-linux-eabi-ar
RUN ln -s arm-linux-androideabi-as  arm-linux-eabi-as
RUN ln -s arm-linux-androideabi-c++ arm-linux-eabi-c++
RUN ln -s arm-linux-androideabi-cpp arm-linux-eabi-cpp
RUN ln -s arm-linux-androideabi-g++ arm-linux-eabi-g++
RUN ln -s arm-linux-androideabi-gcc arm-linux-eabi-gcc
RUN ln -s arm-linux-androideabi-ld arm-linux-eabi-ld
RUN ln -s arm-linux-androideabi-nm arm-linux-eabi-nm

RUN cd $WORKPATH

VOLUME ["/home/data"]

CMD ["bash"]



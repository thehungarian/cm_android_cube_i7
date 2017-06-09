FROM ubuntu:15.10
RUN apt-get update  -qy && \
  apt-get upgrade -qy
RUN apt-get install -qy repo ccache yasm \
    bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf lib32ncurses5-dev lib32readline6-dev \
    lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk2.8-dev libxml2 libxml2-utils \
    lzop pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev imagemagick util-linux bsdmainutils gettext\
    wpasupplicant python-networkx tmux
RUN apt-get install -qy openjdk-8-jdk
RUN apt-get install -qy python-mako genisoimage syslinux

RUN useradd -d /home/mach/code/android-x86 -M -u 1000 -U mach
ENV USER=mach
ENV USE_CCACHE=1

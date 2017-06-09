FROM ubuntu:15.10
RUN apt-get update  -qy && \
  apt-get upgrade -qy && \
  apt-get install -qy repo ccache yasm \
    bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf lib32ncurses5-dev lib32readline6-dev \
    lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk2.8-dev libxml2 libxml2-utils \
    lzop pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev imagemagick util-linux bsdmainutils \
    wpasupplicant openjdk-8-jdk python-networkx \
	tmux
RUN useradd -d /android -M -u 1000 -U mach

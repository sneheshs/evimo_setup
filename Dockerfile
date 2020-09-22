# Noetic on Ubuntu 20.04 (focal) base image
from ros:noetic-ros-base-focal

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ros-noetic-cv-bridge \
    ros-noetic-image-transport \
    ros-noetic-pcl-conversions \
    ros-noetic-pcl-ros \
    ros-noetic-tf-conversions \
    ros-noetic-laser-geometry \
    ros-noetic-camera-info-manager \
    libyaml-cpp-dev \
    libzip-dev \
    git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Xenial based kinetic images ships with  gcc-5, need gcc-7 for proper C++11 support
# https://gist.github.com/jlblancoc/99521194aba975286c80f93e47966dc5
#RUN sudo apt-get update
#RUN sudo apt-get install -y software-properties-common
#RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test
#RUN apt-get update \
# && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
#    gcc-7 g++-7 \
# && apt-get clean \
# && rm -rf /var/lib/apt/lists/*
#RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 \
#                         --slave /usr/bin/g++ g++ /usr/bin/g++-7 
#RUN sudo update-alternatives --config gcc
#RUN gcc --version
#RUN g++ --version

#install latest cmake
#needed for building libcaer
#from https://askubuntu.com/a/889453
#ADD https://github.com/Kitware/CMake/releases/download/v3.18.2/cmake-3.18.2-Linux-x86_64.sh /cmake-3.18.2-Linux-x86_64.sh
#RUN mkdir /opt/cmake
#RUN sh /cmake-3.18.2-Linux-x86_64.sh --prefix=/opt/cmake --skip-license
#RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
#RUN cmake --version

#RUN pip3 install --upgrade pip

#COPY requirements.txt /workdir/requirements.txt
#WORKDIR /workdir
#RUN pip install -r requirements.txt

# Set HOME to workdir which will be mounted from host
# since recommended docker run command uses user uid and gid
# everything in the container is not writeable except this directory
# This is needed so that cupy can store it's cache
#ENV HOME=/workdir

# Last step, install motion_illusions in editable mode
# Docker command will mount this directory as volume to provide latest version
#COPY . /workdir
#RUN pip install -e .


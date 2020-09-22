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

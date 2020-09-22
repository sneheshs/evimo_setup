#!/bin/bash
set -e

mkdir -p catkin_ws/src
git clone git@github.com:better-flow/evimo.git --branch evimo2 catkin_ws/src/evimo
git clone git@github.com:KumarRobotics/vicon.git catkin_ws/src/vicon
git clone git@github.com:uzh-rpg/rpg_dvs_ros.git catkin_ws/src/rpg_dvs_ros
rm -rf catkin_ws/src/rpg_dvs_ros/davis_ros_driver \
       catkin_ws/src/rpg_dvs_ros/dvs_calibration  \
       catkin_ws/src/rpg_dvs_ros/dvs_calibration_gui \
       catkin_ws/src/rpg_dvs_ros/dvs_file_writer  \
       catkin_ws/src/rpg_dvs_ros/dvs_renderer     \
       catkin_ws/src/rpg_dvs_ros/dvs_ros_driver


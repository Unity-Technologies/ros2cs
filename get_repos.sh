#! /bin/bash

if [ -z "${ROS_DISTRO}" ]; then
    echo "Can't detect ROS2 version. Source your ros2 distro first."
    exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SRC_DIR="${SCRIPT_DIR}/src"
echo "Detected ROS2 ${ROS_DISTRO}. Getting required repos from 'ros2_"${ROS_DISTRO}".repos'"
vcs import $SRC_DIR < "${SCRIPT_DIR}/ros2_${ROS_DISTRO}.repos"

if [ "$1" = "--get-custom-messages" ]; then
    echo -e "\nGetting custom messages from 'custom_messages.repos'."
    vcs import $SRC_DIR < "${SCRIPT_DIR}/custom_messages.repos"
fi

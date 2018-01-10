#!/bin/bash

# see installation instructinos here : 
# http://wiki.ros.org/kinetic/Installation/Ubuntu
# and here https://github.com/erlerobot/gym-gazebo/blob/master/INSTALL.md#ubuntu-1604
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get -y -y update

sudo apt-get -y install ros-kinetic-desktop-full
sudo rosdep init
rosdep update

echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc

sudo apt-get -y install python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo pip3 install rospkg catkin_pkg

sudo apt-get -y install python3-pyqt4
sudo apt-get -y install \
    cmake gcc g++ qt4-qmake libqt4-dev \
    libusb-dev libftdi-dev \
    python3-defusedxml python3-vcstool \
    ros-kinetic-octomap-msgs        \
    ros-kinetic-joy                 \
    ros-kinetic-geodesy             \
    ros-kinetic-octomap-ros         \
    ros-kinetic-control-toolbox     \
    ros-kinetic-pluginlib          \
    ros-kinetic-trajectory-msgs     \
    ros-kinetic-control-msgs           \
    ros-kinetic-std-srvs           \
    ros-kinetic-nodelet        \
    ros-kinetic-urdf               \
    ros-kinetic-rviz               \
    ros-kinetic-kdl-conversions     \
    ros-kinetic-eigen-conversions   \
    ros-kinetic-tf2-sensor-msgs     \
    ros-kinetic-pcl-ros \
    ros-kinetic-navigation

#Install Sophus
cd
git clone https://github.com/stonier/sophus -b indigo
cd sophus
mkdir build
cd build
cmake ..
make
sudo make install
echo "## Sophus installed ##\n"

cd
git clone https://github.com/erlerobot/gym-gazebo
cd gym-gazebo
sudo pip3 install -e .

sudo pip3 install h5py
sudo apt-get -y install python3-skimage
sudo pip3 install keras
sudo apt-get install ros-kinetic-ar-track-alvar-msgs
sudo apt-get install libspnav-dev
sudo apt-get install libbluetooth-dev
sudo apt-get -y install ros-kinetic-kobuki-gazebo
sudo apt-get -y install libcwiid-dev cwiid-dbg libcwiid1 python-cwiid
sudo apt-install -y pyqt4-dev-tools
cd ~/gym-gazebo/gym_gazebo/envs/installation
bash kinetic_setup.bash
bash turtlebot_setup.bash

echo 'export PYTHONPATH="/usr/local/lib/python3.5/dist-packages/cv2/:$PYTHONPATH"' >> ~/.zshrc

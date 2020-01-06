FROM ubuntu:14.04

RUN apt update
RUN apt install -y software-properties-common wget

# Prepare an empty machine for building:
RUN add-apt-repository "deb http://packages.ros.org/ros/ubuntu trusty main"
RUN wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
RUN wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
RUN apt update

RUN apt install -y ros-indigo-desktop-full doxygen python-setuptools git g++ cppcheck python-git python-wstools python-catkin-tools

# Repo dependencies
RUN apt install -y autotools-dev doxygen dh-autoreconf git liblapack-dev libblas-dev libgtest-dev --yes

# Optional, possibly helpful packages
RUN apt-get install -y nautilus-open-terminal synaptic vim ccache

# Update ROS environment
RUN rosdep init
RUN rosdep update
RUN echo ". /opt/ros/indigo/setup.bash" >> ~/.bashrc;
# RUN source ~/.bashrc

# Install GDAL
RUN apt-get update
RUN apt-get install -y libgdal-dev

# Curl dependency for Google Maps Api
RUN apt-get update
RUN apt-get install -y libcurlpp-dev libcurl4-openssl-dev python-wstool git

# Install aerial-mapper
RUN mkdir -p ~/catkin_ws_aerial_mapper/src &&\
    cd ~/catkin_ws_aerial_mapper &&\ 
    catkin init &&\
    catkin config --merge-devel &&\
    catkin config --extend /opt/ros/indigo &&\
    catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release &&\
    cd src &&\
    wstool init &&\
    git clone https://github.com/ethz-asl/aerial_mapper.git

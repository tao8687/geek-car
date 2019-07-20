BUILD_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
apt clean
apt update -y && \
    apt install -y \
    build-essential \
    gcc-4.8 \
    g++-4.8 \
    cmake \
    curl \
    git \
    unzip \
    vim \
    wget \
    bc \
    gdb \
    uuid-dev \
    python \
    python-dev \
    python3 \
    python3-dev \
    libasio-dev \
    libtinyxml2-6 \
    libtinyxml2-dev \
    libncurses5-dev \
    libavcodec57 \
    libavcodec-dev \
    libswscale4 \
    libswscale-dev \
    libcurl4-nss-dev \
    libpoco-dev \
    libeigen3-dev \
    libflann-dev \
    libqhull-dev \
    libpcap0.8 \
    libpcap0.8-dev \
    libusb-1.0-0 \
    libusb-1.0-0-dev \
    libopenni0 \
    libopenni-dev \
    libopenni2-0 \
    libopenni2-dev \
    software-properties-common

#install gcc 4.8.5
rm -f /usr/bin/gcc
ln -s /usr/bin/gcc-4.8 /etc/alternatives/gcc
ln -s /etc/alternatives/gcc /usr/bin/gcc
rm -f /usr/bin/g++
ln -s /usr/bin/g++-4.8 /etc/alternatives/g++
ln -s /etc/alternatives/g++ /usr/bin/g++

# Run installer
bash ${BUILD_PATH}/docker/build/installers/install_bazel.sh
bash ${BUILD_PATH}/docker/build/installers/install_gflags_glog.sh
bash ${BUILD_PATH}/docker/build/installers/install_protobuf.sh
bash ${BUILD_PATH}/docker/build/installers/install_bazel_packages.sh
bash ${BUILD_PATH}/docker/build/installers/install_google_styleguide.sh
#bash ${BUILD_PATH}/docker/build/installers/install_osqp.sh
bash ${BUILD_PATH}/docker/build/installers/install_conda.sh

# Add Bionic source
echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic main restricted" > /etc/apt/sources.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic-updates main restricted" >> /etc/apt/sources.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic universe" >> /etc/apt/sources.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic-updates universe" >> /etc/apt/sources.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic multiverse" >> /etc/apt/sources.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic-updates multiverse" >> /etc/apt/sources.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu bionic-security main restricted" >> /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu bionic-security multiverse" >> /etc/apt/sources.list

#add Trusty universe into apt source for Poco foundation 9
echo "deb http://dk.archive.ubuntu.com/ubuntu/ trusty main" >> /etc/apt/sources.list
echo "deb http://dk.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list

apt update -y
apt install -y --allow-downgrades \
    libboost-system1.54.0 \
    libboost-thread1.54.0 \
    libboost-signals1.54.0 \
    libboost-filesystem1.54.0 \
    libboost-iostreams1.54.0 \
    libboost-chrono1.54.0 \
    libboost1.54-dev \
    libboost-dev=1.54.0.1ubuntu1 \
    libkml-dev \
    libopencv-core-dev=2.4.8+dfsg1-2ubuntu1 \
    libopencv-imgproc-dev=2.4.8+dfsg1-2ubuntu1 \
    libopencv-highgui-dev=2.4.8+dfsg1-2ubuntu1 \
    libgdal-dev \
    libvtk6-dev \
    libvtk6.3 \
    vtk6 \
    libpocofoundation9

rm -f /usr/lib/libPocoFoundation.so
ln -s /usr/lib/libPocoFoundation.so.9 /usr/lib/libPocoFoundation.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.54.0 /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_iostreams.so.1.54.0 /usr/lib/x86_64-linux-gnu/libboost_iostreams.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.65.1 /usr/lib/x86_64-linux-gnu/libboost_date_time.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.65.1 /usr/lib/x86_64-linux-gnu/libboost_regex.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_serialization.so.1.65.1 /usr/lib/x86_64-linux-gnu/libboost_serialization.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_signals.so.1.54.0 /usr/lib/x86_64-linux-gnu/libboost_signals.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_system.so.1.54.0 /usr/lib/x86_64-linux-gnu/libboost_system.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.54.0 /usr/lib/x86_64-linux-gnu/libboost_thread.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_wserialization.so.1.65.1 /usr/lib/x86_64-linux-gnu/libboost_wserialization.so
ln -s /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.54.0 /usr/lib/x86_64-linux-gnu/libboost_chrono.so
ln -s /usr/lib/python2.7/dist-packages/vtk/libvtkRenderingPythonTkWidgets.x86_64-linux-gnu.so /usr/lib/x86_64-linux-gnu/libvtkRenderingPythonTkWidgets.so

# intel realsense
apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
apt-get install librealsense2-dkms
apt-get install librealsense2-utils
apt-get install librealsense2-dev
apt-get install librealsense2-dbg

bash ${BUILD_PATH}/docker/build/installers/install_fast-rtps.sh
bash ${BUILD_PATH}/docker/build/installers/install_apriltag.sh
#bash ${BUILD_PATH}/docker/build/installers/install_pcl.sh

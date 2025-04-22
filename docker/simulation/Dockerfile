FROM osrf/ros:humble-desktop

RUN apt update && apt install -y \
    gnupg2 \
    curl \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Add the NVIDIA package repository
RUN curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | tee /etc/apt/trusted.gpg.d/nvidia.asc
RUN curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu22.04/nvidia-docker.list | tee /etc/apt/sources.list.d/nvidia-docker.list

# Install navigation and robot control dependencies
RUN apt-get update && apt-get install -y \
    ros-humble-navigation2 \
    ros-humble-tf2-ros \
    ros-humble-xacro \
    ros-humble-ros-ign \
    ros-humble-ros-ign-gazebo \
    ros-humble-ros-ign-bridge \
    ros-humble-ros-ign-image \
    ros-humble-turtlebot4-description \
    ros-humble-turtlebot4-navigation \
    nvidia-container-toolkit \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libxrender1 \
    mesa-utils \
    lsof \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
    

# Copy robot package
WORKDIR /ros_ws
# COPY . .

# Build the workspace
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]

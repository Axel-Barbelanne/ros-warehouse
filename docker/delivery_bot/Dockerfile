FROM osrf/ros:humble-desktop

# Install navigation and robot control dependencies
RUN apt-get update && apt-get install -y \
    ros-humble-navigation2 \
    ros-humble-tf2-ros \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-gazebo-ros2-control \
    ros-humble-xacro \
    ros-humble-robot-localization \
    ros-humble-interactive-marker-twist-server \
    ros-humble-twist-mux \
    ros-humble-ros2-control \
    ros-humble-diff-drive-controller \
    ros-humble-controller-manager \
    ros-humble-joint-state-broadcaster \
    ros-humble-gazebo-ros-pkgs \
    && rm -rf /var/lib/apt/lists/*

# Copy robot package
WORKDIR /ros_ws
# COPY . .

# Build the workspace
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
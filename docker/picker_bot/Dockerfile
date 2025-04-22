FROM osrf/ros:humble-desktop

# Install navigation and robot control dependencies
RUN apt-get update && apt-get install -y \
    ros-humble-navigation2 \
    ros-humble-tf2-ros \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-gazebo-ros2-control \
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
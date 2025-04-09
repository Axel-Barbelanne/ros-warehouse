FROM osrf/ros:humble-desktop

# Install dependencies
RUN apt-get update && apt-get install -y \
    ros-humble-rclcpp \
    && rm -rf /var/lib/apt/lists/*

# Copy mission control package
WORKDIR /ros_ws
# COPY . .

# Build the workspace
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
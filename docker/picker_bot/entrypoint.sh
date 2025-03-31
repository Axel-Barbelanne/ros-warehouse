#!/bin/bash

# Source ROS 2 environment setup (ensure this is done in each container that uses ROS)
source /opt/ros/humble/setup.bash

# Source your workspace setup
if [ -f /ros_ws/install/setup.bash ]; then
    source /ros_ws/install/setup.bash
fi

# Run the command passed to the container (usually bash or a ROS launch file)
exec "$@"

#!/bin/bash

set -e

# YOUR CODE BELOW THIS LINE
# ----------------------------------------------------------------------------
echo "This is an empty launch script. Update it to launch your application."

#roslaunch circle_drive circle_drive.launch

roslaunch --wait duckietown_demos lane_following.launch &

#roslaunch --wait circle_drive indefinite_navigation2.launch &

sleep 30
#we put a short sleep in here because rostopic will fail if there's no roscore yet
rostopic pub /$VEHICLE_NAME/fsm_node/mode duckietown_msgs/FSMState '{header: {}, state: "LANE_FOLLOWING"}' &

rostopic pub -r 10 /$VEHICLE_NAME/joy sensor_msgs/Joy '{header:{},axes:[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],buttons:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]}' &

# run demo only 40 secs
sleep 40

rostopic pub /$VEHICLE_NAME/fsm_node/mode duckietown_msgs/FSMState '{header: {}, state: "NORMAL_JOYSTICK_CONTROL"}' &


sleep 5

exit

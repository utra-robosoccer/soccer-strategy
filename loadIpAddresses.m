%% Modify the IP addresses of your ROS enabled robots/simulators here
% Copyright 2017 The MathWorks, Inc.

clear;
rosshutdown;

% Gazebo IP address
gazeboIp = '100.65.212.128';

% Turtlebot IP address
soccerbotIp = '100.65.212.128';

setenv('ROS_MASTER_URI','http://100.65.212.128:11311')
setenv('ROS_IP','100.64.199.237')

rosinit('100.65.212.128', 'NodeHost', '100.64.199.237')
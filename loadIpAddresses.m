%% Modify the IP addresses of your ROS enabled robots/simulators here
% Copyright 2017 The MathWorks, Inc.

clear;
rosshutdown;

% Gazebo IP address
gazeboIp = '100.64.71.19';

setenv('ROS_MASTER_URI',stcat('http://', gazeboIP, '100.65.212.128:11311'))
rosinit(gazeboIp)

% d = rosdevice(gazeboIp,'vuwij','sh961013');
% system('kill', cmdout);

% rosgenmsg('../soccer_ws/src/soccer_msgs')
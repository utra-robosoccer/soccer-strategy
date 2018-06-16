%% Modify the IP addresses of your ROS enabled robots/simulators here
% Copyright 2017 The MathWorks, Inc.

rosshutdown;
addpath('fixed_trajectories')
addpath('dynamic_trajectories')
addpath('soccer-vision')

% Gazebo IP address
gazeboIp = '100.65.216.233';
localIp = '100.64.197.9';

setenv('ROS_IP', localIp)
setenv('ROS_MASTER_URI',strcat('http://', gazeboIp, ':11311'))
rosinit(gazeboIp, 'NodeHost', localIp)

% d = rosdevice(gazeboIp,'vuwij','sh961013');
% system('kill', cmdout);
% rosgenmsg('../soccer_ws/src/soccer_msgs')
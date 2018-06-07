%% Modify the IP addresses of your ROS enabled robots/simulators here
% Copyright 2017 The MathWorks, Inc.

rosshutdown;

% Gazebo IP address
gazeboIp = '192.168.42.207';
localIp = '192.168.42.243';

setenv('ROS_IP', localIp)
setenv('ROS_MASTER_URI',strcat('http://', gazeboIp, ':11311'))
rosinit(gazeboIp, 'NodeHost', localIp)

% d = rosdevice(gazeboIp,'vuwij','sh961013');
% system('kill', cmdout);

% rosgenmsg('../soccer_ws/src/soccer_msgs')
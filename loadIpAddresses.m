%% Modify the IP addresses of your ROS enabled robots/simulators here
% Copyright 2017 The MathWorks, Inc.

rosshutdown;
addpath('fixed_trajectories')
addpath('dynamic_trajectories')
addpath('soccer-vision')

% Gazebo IP address
% gazeboIp = '172.20.10.7';
robotIp = '192.168.43.160';
localIp = '192.168.43.169';
% gazeboIp = '172.20.10.7';
% robotIp = '192.168.2.74';
% localIp = '192.168.2.241';

useRobot = 1;

if useRobot
    setenv('ROS_IP', localIp)
    setenv('ROS_MASTER_URI',strcat('http://', robotIp, ':11311'))
    rosinit(robotIp, 'NodeHost', localIp)
else
    setenv('ROS_IP', localIp)
    setenv('ROS_MASTER_URI',strcat('http://', gazeboIp, ':11311'))
    rosinit(gazeboIp, 'NodeHost', localIp)
end


% d = rosdevice(gazeboIp,'vuwij','sh961013');
% system('kill', cmdout);
% rosgenmsg('soccer_msgs')
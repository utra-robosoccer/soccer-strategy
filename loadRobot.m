% Load Paths
rosshutdown;
addpath('fixed_trajectories')
addpath('../soccer-control')
addpath('../soccer-vision')

% IP Addresses for robots
localIp = '100.64.37.135';
gazeboIp = '100.64.45.11';
robotIp = '172.20.10.4';

useRobot = 0;

if useRobot
    setenv('ROS_IP', localIp)
    setenv('ROS_MASTER_URI',strcat('http://', robotIp, ':11311'))
    rosinit(robotIp, 'NodeHost', localIp)
else
    setenv('ROS_IP', localIp)
    setenv('ROS_MASTER_URI',strcat('http://', gazeboIp, ':11311'))
    rosinit(gazeboIp, 'NodeHost', localIp)
end

% Generate Messages
% rosgenmsg('soccer_msgs')

% Calibration
motorCalibration = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];

% Fixed Trajectories
loadFixedTrajectories
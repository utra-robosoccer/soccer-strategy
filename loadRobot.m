% Load Paths
addpath('fixed_trajectories')
addpath('../soccer-control')
addpath('../soccer-vision')

% Connect Robot
connectRobot;

% Generate Messages
% rosgenmsg('soccer_msgs')

% Calibration
motorCalibration = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];

% Fixed Trajectories
loadFixedTrajectories
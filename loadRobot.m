% Load Paths
addpath('fixed_trajectories')
addpath('../soccer-control')
addpath('../soccer-vision')
addpath('../soccer-utility')

% Connect Robot
connectRobot;

% Calibration
motorCalibration = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];

% Fixed Trajectories
loadFixedTrajectories
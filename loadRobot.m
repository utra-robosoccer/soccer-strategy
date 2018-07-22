% Load Paths
addpath('fixed_trajectories')
addpath('../soccer-control')
addpath('../soccer-vision')
addpath('../soccer-utility')

% Connect Robot
connectRobot;

% Sample Time
sampleTime = 0.01;

% Calibration
motorCalibration = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];

% Fixed Trajectories
loadFixedTrajectories
%% Calibration

% Motor Calibration
motorCalibration = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];

%% Poses

% Custom State
%customState = zeros(1,20);

% Resting
load('fixed_trajectories/resting.mat');
resting = resting';

% Preparewalk
load('fixed_trajectories/prepareWalk.mat');

%% Standard Fixed Trajectories

% Walking Motion
load('fixed_trajectories/walking.mat');
walkTraj(length(walkTraj),20) = 0;
walkTrajTime = 0:0.01:length(walkTraj)*0.01 - 0.01;
walkTrajStatus = zeros(1,length(walkTraj));
walkTrajStatus(end-10:end) = 1;

% Get Up From Front
%load('fixed_trajectories/getUpFrontWayPoints.mat');
[l,~] = size(getUpFrontWayPoints);
t = linspace(0, 8, l); % # seconds to getup
getUpFrontTrajTime = 0:0.01:8;
getUpFrontTraj = spline(t, getUpFrontWayPoints', getUpFrontTrajTime);
getUpFrontTraj = getUpFrontTraj';
getUpFrontTraj(length(getUpFrontTraj),10) = 0;
for i=1:20
    getUpFrontTraj(:,i) = smooth(getUpFrontTraj(:,i), 0.02);
end
getUpFrontTrajTest = getUpFrontTraj';
temp = getUpFrontTrajTest(1:6,:);
getUpFrontTrajTest(1,:) = temp(6,:);
getUpFrontTrajTest(2,:) = temp(5,:);
getUpFrontTrajTest(3,:) = temp(4,:);
getUpFrontTrajTest(4,:) = temp(3,:);
getUpFrontTrajTest(5,:) = temp(2,:);
getUpFrontTrajTest(6,:) = temp(1,:);
getUpFrontTrajTest = round(getUpFrontTrajTest, 3);



getUpFrontTrajStatus = zeros(1,length(getUpFrontTraj));
getUpFrontTrajStatus(end-10:end) = 1;
% plot(getUpFrontTrajTime, getUpFrontTraj)

% Get Up From Back
load('fixed_trajectories/getUpBackWayPoints.mat');
[l,~] = size(getUpBackWayPoints);
t = linspace(0, 4, l); % 3 seconds to getup
getUpBackTrajTime = 0:0.01:4;
getUpBackTraj = spline(t, getUpBackWayPoints', getUpBackTrajTime);
getUpBackTraj = getUpBackTraj';
getUpBackTraj(length(getUpBackTraj),20) = 0;
for i=1:20
    getUpBackTraj(:,i) = smooth(getUpBackTraj(:,i), 0.1);
end
getUpBackTrajStatus = zeros(1,length(getUpBackTraj));
getUpBackTrajStatus(end-10:end) = 1;
% plot(getUpBackTrajTime, getUpBackTraj)

% PrepareToWalkAnimation
prepareToWalkTrajTime = 0:0.01:3; % 3 seconds
t = [0 3];
prepareToWalkWayPoints = [resting prepareWalk];
prepareToWalkTraj = spline(t, prepareToWalkWayPoints, prepareToWalkTrajTime)';
prepareToWalkTrajStatus = zeros(1,length(prepareToWalkTraj));
prepareToWalkTrajStatus(end-10:end) = 1;

% Look for ball
headmotion = zeros(1,1000);
for i=1:500
   headmotion(i) = (250-i)/250*pi/2;
end
for i=1:500
   headmotion(500+i) = (i-250)/250*pi/2;
end
findBallTraj = zeros(1000,20);
for i=1:1000
   findBallTraj(i,:) = resting;
end
findBallTraj(:,17) = headmotion;
findBallTrajTime = 0:0.01:length(findBallTraj)*0.01 - 0.01;
findBallTrajStatus = zeros(1,length(findBallTraj));
findBallTrajStatus(end-10:end) = 1;



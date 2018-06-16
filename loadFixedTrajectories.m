% Motor Calibration
motorCalibration = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];

% Walking Motion
load('fixed_trajectories/walking.mat');
walkTraj(length(walkTraj),20) = 0;
walkTrajTime = 0:0.01:length(walkTraj)*0.01 - 0.01;
walkTrajStatus = zeros(1,length(walkTraj));
walkTrajStatus(end) = 1;

% Get Up From Front
% load('fixed_trajectories/getUpFrontWayPoints.mat');
[l,~] = size(getUpFrontWayPoints);
t = linspace(0, 30, l); % 7 seconds to getup
getUpFrontTrajTime = 0:0.01:30;
getUpFrontTraj = spline(t, getUpFrontWayPoints', getUpFrontTrajTime);
getUpFrontTraj = getUpFrontTraj';
getUpFrontTraj(length(getUpFrontTraj),20) = 0;
for i=1:20
    getUpFrontTraj(:,i) = smooth(getUpFrontTraj(:,i), 0.1);
end
getUpFrontTrajStatus = zeros(1,length(getUpFrontTraj));
getUpFrontTrajStatus(end) = 1;
% plot(getUpFrontTrajTime, getUpFrontTraj)

% Get Up From Back
load('fixed_trajectories/getUpBackWayPoints.mat');
[l,~] = size(getUpBackWayPoints);
t = linspace(0, 15, l); % 7 seconds to getup
getUpBackTrajTime = 0:0.01:10;
getUpBackTraj = spline(t, getUpBackWayPoints', getUpBackTrajTime);
getUpBackTraj = getUpBackTraj';
getUpBackTraj(length(getUpBackTraj),20) = 0;
for i=1:20
    getUpBackTraj(:,i) = smooth(getUpBackTraj(:,i), 0.1);
end
getUpBackTrajStatus = zeros(1,length(getUpBackTraj));
getUpBackTrajStatus(end) = 1;
% plot(getUpBackTrajTime, getUpBackTraj)

% Custom State
% customState = zeros(1,20);

% Resting
load('fixed_trajectories/resting.mat');

% Preparewalk
load('fixed_trajectories/prepareWalk.mat');

% PrepareToWalkAnimation
prepareToWalkTrajTime = 0:0.01:3; % 3 seconds
t = [0 3];
prepareToWalkWayPoints = [resting prepareWalk];
prepareToWalkTraj = spline(t, prepareToWalkWayPoints, prepareToWalkTrajTime)';
prepareToWalkTrajStatus = zeros(1,length(prepareToWalkTraj));
prepareToWalkTrajStatus(end-50:end) = 1;

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
findBallTrajStatus(end) = 1;


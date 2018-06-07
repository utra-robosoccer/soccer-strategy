% Walking Motion
load('trajectories/walking.mat');
walkTraj(length(walkTraj),20) = 0;
walkTrajTime = 0:0.01:length(walkTraj)*0.01 - 0.01;

% Stand Up Motion
load('trajectories/getUpFrontWayPoints.mat')
t = linspace(0, 30, length(getUpFrontWayPoints)) % 7 seconds to getup
getUpFrontTrajTime = 0:0.01:30;
getUpFrontTraj = spline(t, getUpFrontWayPoints', getUpFrontTrajTime);
getUpFrontTraj = getUpFrontTraj';
getUpFrontTraj(length(getUpFrontTraj),20) = 0;
for i=1:20
    getUpFrontTraj(:,i) = smooth(getUpFrontTraj(:,i), 0.1);
end
plot(getUpFrontTrajTime, getUpFrontTraj)

customState = zeros(1,20);
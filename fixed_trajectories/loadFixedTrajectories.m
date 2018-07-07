Ts = 0.01; % Sample Time

% Poses
load('poses.mat')

% Animations
load('animations.mat')

[getupfrontspline, getupfrontsmooth] = createFixedTrajectory(getUpFrontWayPoints, Ts, 20, 0.02);
[getupbackspline, getupbacksmooth] = createFixedTrajectory(getUpBackWayPoints, Ts, 5, 0.1);

% Pose Transitions
standingtoready = changePoseTrajectory(standing, ready, Ts, 3);
readytostanding = changePoseTrajectory(ready, standing, Ts, 3);

% Customized Transitions
headTrajectory = createHeadTrajectory(ready);

customTrajectory = timeseries([customPose;customPose], [0;0]);



curPose = Pose(-2.5,-1.2,0,0,0);
destPose = Pose(2,2.2,0,0,0);

obs1 = Pose(0,1.3,0,0,0);
obs2 = Pose(-2.7,2.7,0,0,0);
obs3 = Pose(1.5,-1.5,0,0,0);
obstacles = {obs1, obs2, obs3};

findWayPoints(curPose, destPose, obstacles);
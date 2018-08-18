function trajectory = findPoseActions(curPose, destPose, obstacles, speed)

waypoints = findWayPoints(curPose, destPose, obstacles);
grid on;

figure
poseActionList = wayPointsToPoseActionList(waypoints, speed);
trajectory = run(poseActionList);

end
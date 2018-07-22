function poseActionList = wayPointsToPoseActionList(waypoints)
    [l,~] = size(waypoints);
    poseActionList = cell(l,1);
    for i = 1:l
        pose = Pose(waypoints(i,1),waypoints(i,2),waypoints(i,3),waypoints(i,4),waypoints(i,5));
        actionLabel = Command.ActionLabel.Forward;
        duration = 1;
        poseActionList{i} = PoseAction(pose, actionLabel, duration);        
    end
end
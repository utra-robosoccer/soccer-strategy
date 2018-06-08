function waypoints = findWayPoints(curPose, destPos, obstacles)
    if ~exist('fieldOccupancy','var')
        % Create the occupancy map for the first time
        field = createMap;
    end
    
    if nargin == 3            
        for i = 1 : length(obstacles)
            [xCor, yCor] = poseToOccupancy(obstacles{i});
            field(xCor, yCor) = 1;
        end
    end
    
    map = robotics.OccupancyGrid(field);
    mapInflated = copy(map);
    inflate(mapInflated, 1);
    show(mapInflated)
    prm = robotics.PRM;
    prm.Map = mapInflated;
    prm.NumNodes = 50;
    prm.ConnectionDistance = 3;
    
    curPosAdj = ([curPose.x, curPose.y] + [3, 4.5]) * 10;
    destPosAdj = ([destPos.x, destPos.y] + [3, 4.5]) * 10;
    path = findpath(prm, curPosAdj, destPosAdj);
    
    path = path - [3, 4.5];
end
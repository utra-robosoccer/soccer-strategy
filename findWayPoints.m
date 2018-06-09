function waypoints = findWayPoints(curPose, destPos, obstacles)
    if ~exist('fieldOccupancy','var')
        % Create the occupancy map for the first time
        field = createMap;
    end
    
    if nargin == 3            
        for i = 1 : length(obstacles)
            coord = int32(poseToOccupancy(obstacles{i}));
            field(coord(2), coord(1)) = 1;
        end
    end
    
    map = robotics.OccupancyGrid(field);
    mapInflated = copy(map);
    inflate(mapInflated, 2);
    show(mapInflated)
    prm = robotics.PRM;
    prm.Map = mapInflated;
    prm.NumNodes = 500;
    prm.ConnectionDistance = 6;
    
    curPosAdj = (poseToOccupancy(curPose));
    destPosAdj = (poseToOccupancy(destPos));
    path = findpath(prm, curPosAdj, destPosAdj);
    show(prm)
    
    % Removed jagged edges
    pathsmooth = [movmean(path(:,1),3), movmean(path(:,2),3)]
    
    % Downsample and smooth the path
    originalSpacing = 1:length(pathsmooth(:,1));
    finerSpacing = 1:0.1:length(pathsmooth(:,1));
    splineXY = spline(originalSpacing, pathsmooth', finerSpacing);
    downSplineXY = downsample(splineXY', int32(length(pathsmooth(:,1))/1.1))';
    
    % Find the angles between each downsample
    velocity = 2; % 5 seconds per decimeter
    
    plot(downSplineXY(1,:),downSplineXY(2,:));
    waypoints = zeros(length(downSplineXY)-1, 6);
    for i=1:length(downSplineXY)-1
       waypoints(i,1) = downSplineXY(1,i+1);
       waypoints(i,2) = downSplineXY(2,i+1);
       waypoints(i,3) = 0;
       waypoints(i,4) = atan2(downSplineXY(2,i+1)-downSplineXY(2,i), downSplineXY(1,i+1)-downSplineXY(1,i));
       waypoints(i,5) = 0.04;
       waypoints(i,6) = norm([downSplineXY(1,i+1)-downSplineXY(1,i), downSplineXY(2,i+1)-downSplineXY(2,i)]) * velocity;
    end
end
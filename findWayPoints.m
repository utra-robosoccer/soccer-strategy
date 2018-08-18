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
    
    % Method 1
    path = findpath(prm, curPosAdj, destPosAdj);
    show(prm)
    
    % Method 2
%     path = RRTStar(curPosAdj, destPosAdj, obstacles);
    
    
    % Downsample and smooth the path
    originalSpacing = 1:length(path(:,1));
    finerSpacing = 1:0.1:length(path(:,1));
    splineXY = spline(originalSpacing, path', finerSpacing);
    
    % Smooth after downsampling
    pathsmooth = [movmean(splineXY(1,:),50); movmean(splineXY(2,:),50)];
    
    % Find the angles between each downsample
    hold on;
    plot(pathsmooth(1,:),pathsmooth(2,:));
    waypoints = zeros(length(pathsmooth)-1, 5);
    for i=1:length(pathsmooth)-1
       waypoints(i,1) = pathsmooth(1,i+1);
       waypoints(i,2) = pathsmooth(2,i+1);
       waypoints(i,3) = 0;
       waypoints(i,4) = atan2(pathsmooth(2,i+1)-pathsmooth(2,i), pathsmooth(1,i+1)-pathsmooth(1,i));
       waypoints(i,5) = 0.04;
    end
    
    % Add start and end position
    startPosition = [ curPose.x curPose.y curPose.z waypoints(1,4)   waypoints(1,5)];
    endPosition   = [ destPos.x destPos.y destPos.z waypoints(end,4) waypoints(end,5)];
    
    waypoints = [startPosition; waypoints; endPosition];
    
    hold off;
end
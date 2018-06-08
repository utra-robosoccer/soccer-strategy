function fieldOccupancy = createMap()
    fieldOccupancy = zeros(60,90);
    fieldOccupancy(1,:) = 1;
    fieldOccupancy(end,:) = 1;
    fieldOccupancy(:,1) = 1;
    fieldOccupancy(:,end) = 1;
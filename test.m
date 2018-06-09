% function SmoothSplineCurve()
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
workspace;	% Make sure the workspace panel is showing.
fontSize = 20;

% Change the current folder to the folder of this m-file.
if(~isdeployed)
        cd(fileparts(which(mfilename)));
end
set(gcf, 'Position', get(0,'Screensize')); % Enlarge figure to full screen.
set(gcf,'name','Spline Image Analysis Demo','numbertitle','off') 

axis([0 10 0 10])
xlabel('X', 'FontSize', fontSize);
ylabel('Y', 'FontSize', fontSize);
title('Spline Demo', 'FontSize', fontSize);
hold on
% Initially, the list of points is empty.
knots = [];
numberOfPointsClicked = 0;
% Prompt the user
message = sprintf('Left click to draw some vertex points.\nRight click the final point to finish drawing.');
uiwait(msgbox(message));
buttonThatWasClicked = 1;
% Enter a loop asking user to click on the knot vertexes.
while buttonThatWasClicked == 1
    [xKnot, yKnot, buttonThatWasClicked] = ginput(1);
    plot(xKnot, yKnot, 'ro', 'LineWidth', 2)
    numberOfPointsClicked = numberOfPointsClicked+1;
	% Make this coordinate a new column.
    knots(:, numberOfPointsClicked) = [xKnot; yKnot];
end

% Calculate the area within the blue spline curve.
% You do not need to connect the last point back to the first point.
x = knots(1, :);
y = knots(2, :);
areaOfPolygon = polyarea(x,y);

% Interpolate with a spline curve and finer spacing.
originalSpacing = 1 : numberOfPointsClicked;
% Make 9 points in between our original points that the user clicked on.
finerSpacing = 1 : 0.1 : numberOfPointsClicked;
% Do the spline interpolation.
splineXY = spline(originalSpacing, knots, finerSpacing);
 
% Plot the interpolated curve.
hold off;
plot(knots(1, :), knots(2, :), 'ro',...
	splineXY(1, :), splineXY(2, :), 'b+-', 'LineWidth', 2, 'MarkerSize', 16);
title('Blue Spline Between Red Knots', 'FontSize', fontSize);
legend('Knots', 'Spline');
xlabel('X', 'FontSize', fontSize);
ylabel('Y', 'FontSize', fontSize);
grid on;
hold off;
% Calculate the area within the blue spline curve.
% You do not need to connect the last point back to the first point.
x = splineXY(1, :);
y = splineXY(2, :);
areaInsideSplineCurve = polyarea(x,y);

% Give the area calculations.
message = sprintf('The area inside the polygon you drew is %.2f.\nThe area inside the blue spline curve is %.2f', ...
	areaOfPolygon, areaInsideSplineCurve);
fprintf(1, '%s', message); % Print to command window.
msgbox(message); % Show user via a popup message box.
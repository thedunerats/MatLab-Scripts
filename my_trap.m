function [TrapezoidalRiemannSum] = my_trap(x,y)
%my_trap: accepts inputs x and y
%Uses the trapezoidal rule to estimate the integral of
% Y Over x

%find the width of each trapezoid
width = diff(x);
%calculate the average height of each respective trapezoid
AvgHeight = (y(1:end-1)+y(2:end))/2;
%Calculate the area of each respective trapezoid
Area = (width .* AvgHeight);
%Add up the area of all the trapezoids
TrapezoidalRiemannSum = sum(Area);
end
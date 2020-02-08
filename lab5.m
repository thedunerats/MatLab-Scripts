g=9.8; %Define variable g as 9.8m/s^2
Vo=input('enter initial velocity in m/s: '); %Take input value for original velocity
theta=input('enter launch angle in degrees: '); %Take input value for theta

Tflight = 2*(Vo/g)*sind(theta); %Calculate flight time
Xmax=Vo*Tflight*cosd(theta); %Use flight time to calculate distance
Ymax=.25*Vo*Tflight*sind(theta); %Use flight time to calculate max height

fprintf('Flight time: %.3f seconds \n', Tflight)
fprintf('Distance: %.3f meters \n', Xmax)
fprintf('Max height: %.3f meters \n', Ymax)
%Output flight time, distance, and max height

intervals = linspace(0, Tflight, 100);
xValues = Vo*(intervals)*cosd(theta); %Use linspace function to create array of x values with array length based on flight time
yValues = Vo*intervals*sind(theta)-.5*g*intervals.*intervals; %Use linspace function to create array of y values with array length based on flight time


plot(xValues, yValues,'r'); %Use above arrays to plot flight path.
axis('equal')
axis([0 Xmax 0 Ymax]);
title('Flight Path')
xlabel('Distance (meters)')
ylabel('Height (meters)')

figure(2); %Switch to figure 2


velocities=sqrt((Vo*cosd(theta))^2+(Vo*sind(theta)-g*intervals).*(Vo*sind(theta)-g*intervals));%Use these new variables to create an array of velocities at given points in time
plot(intervals, velocities,'b');%Create a second plat with time as the X axis and velocity as the y axis.
title('Velocity over Time')
xlabel('Time (seconds)')
ylabel('Velocity (m/s)')

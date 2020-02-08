Vo = [10,15,20,25,30]; %create an initial velocity array 
g = 9.8; % creates gravitvational acceleration constant
theta = 35; %create launch angle theta in degrees
Tflight = 2*(Vo/g)*sind(theta);%create flight time, the dependednt variable, based on Vo

%plot graph of Tflight over Vo
plot(Vo,Tflight,'o')
title('Projectile Motion: Flight Time Over Initial Velocity')
xlabel('Initial Velocity (meters/second)')
ylabel('Flight Time: (seconds)')

%linear interpolation: exercise 1
Ex1Interp = interp1(Vo,Tflight,17)

%spline interpolation: exercise 1
Ex1SplInterp = spline( 

%linear regession: exercise 1
LinearRegression1 = polyfit(Vo,Tflight,1)
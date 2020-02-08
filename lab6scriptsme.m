Vo = [10,15,20,25,30]; %create an initial velocity array 
theta = 35; %create launch angle theta in degrees
%find Tflight for the entire table
TflightTable = [1.20	1.71	2.26	3.15	3.42;
1.49	2.11	2.81	3.72	4.28;
1.85	2.69	3.42	4.45	5.24]
%plot graph of Tflight over Vo
plot(Vo,Tflight,'o')
title('Projectile Motion: Flight Time Over Initial Velocity')
xlabel('Initial Velocity (meters/second)')
ylabel('Flight Time: (seconds)')

%linear interpolation: exercise 1
Ex1Interp = interp1(Vo,Tflight,17)

%spline interpolation: exercise 1
Ex1SplInterp = spline(Vo,Tflight,17)

%create new theta array times a Vo array
Vo = [10,15,20,25,30];
%find Tflight for the entire table
TflightTable = [1.20	1.71	2.26	3.15	3.42;
1.49	2.11	2.81	3.72	4.28;
1.85	2.69	3.42	4.45	5.24];
%plot all three sets of data on the same graphs, different formats
plot(Vo,TflightTable(1,:),'ro',Vo,TflightTable(2,:),'bo',Vo,TflightTable(3,:),'go')
title('Projectile Motion: Flight Time Over Initial Velocity For 3 different Angles')
xlabel('Initial Velocity (meters/second)')
ylabel('Flight Time: (seconds)')
legend('Theta = 35','Theta = 45','Theta = 60')

%spline interpolation: combined data
theta_range = [35:60];
Ex2Interp = interp2(Vo,theta_range,Tflight,22,40)

%linear regession: exercise 1
LinearRegression1 = polyfit(Vo,Tflight,1)
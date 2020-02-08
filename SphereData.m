%prompt user for a minimum radius
SRadiusMin = input('Please enter a minimum value for the radius: ');
%prompt use for a maximum radius
SRadiusMax = input('Please enter a maximum value for the radius: ');
%form an array that spans values between the min and max
SRadius = [SRadiusMin:1:SRadiusMax];
%input radius array to surface area function
SphereArea(SRadius);%call surface area function
SphereVol(SRadius); %call volume function
SArea = SphereArea(SRadius);%define a variable for the result of surface area function 
SVol = SphereVol(SRadius);%define a variable for the result of volume function 
SVRsphere = SArea ./ SVol;%define a variable for the surface/volume ratio
%save all of the data to a table
Data = [SRadius;SArea;SVol;SVRsphere]';
save sphere.dat Data -ascii
%print every piece of data to 2 decimal places
fprintf('Radius: %.2f, Surface Area: %.2f, Volume: %.2f, Surface/Volume Ratio: %.2f \n', [SRadius;SArea;SVol;SVRsphere])
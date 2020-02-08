%prompt user for a minimum radius
RadiusMin = input('Please enter a minimum value for the radius: ');
%prompt use for a maximum radius
RadiusMax = input('Please enter a maximum value for the radius: ');
%input the user for a value for height
Height = input('Please enter a value for the height: ');
%form an array that spans values between the min and max
Radius = linspace(RadiusMin,RadiusMax,20);

%sphere calculations
SphereArea(Radius);%call surface area function
SphereVol(Radius); %call volume function
SArea = SphereArea(Radius);%define a variable for the result of surface area function 
SVol = SphereVol(Radius);%define a variable for the result of volume function 
SVRsphere = SArea ./ SVol;%define a variable for the surface/volume ratio

%cylinder calculations
CylArea(Radius,Height);
%input radius array to volume function
CylVol(Radius,Height);
%define a variable for the result of surface area function
CylinderArea = CylArea(Radius,Height);
%define a variable for the result of volume function 
CylinderVolume = CylVol(Radius,Height);
%define a variable for the surface/volume ratio
CRatio = (CylinderArea ./ CylinderVolume);

plot(Radius,SVRsphere,'ro')
hold on
plot(Radius,CRatio,'b')
legend('Sphere','Cylinder')
title('Surface Area to Volume Ratio of both a Sphere and a Cylinder')
xlabel('Radius')
ylabel('Surface Area to Volume Ratio')
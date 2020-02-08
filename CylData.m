%prompt user for a minimum radius
CRadiusMin = input('Please enter a minimum value for the radius: ');
%prompt use for a maximum radius
CRadiusMax = input('Please enter a maximum value for the radius: ');
%input the user for a value for height
CHeight = input('Please enter a value for the height: ');
%form an array that spans values between the min and max
CRadius = linspace(CRadiusMin,CRadiusMax,20);
%input radius array to surface area function
CylArea(CRadius,CHeight);
%input radius array to volume function
CylVol(CRadius,CHeight);
%define a variable for the result of surface area function
CylinderArea = CylArea(CRadius,CHeight);
%define a variable for the result of volume function 
CylinderVolume = CylVol(CRadius,CHeight);
%define a variable for the surface/volume ratio
CRatio = (CylinderArea./CylinderVolume);
function [ SurfaceArea ] = CylArea( Radius,Height );
%CylArea: calculate the surface area of a cylinder given an input
%radius and height
SurfaceArea = 2*pi * (Radius.^2 + (Radius .* Height));
end


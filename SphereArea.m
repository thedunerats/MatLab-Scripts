function [ SurfaceArea ] = SphereArea( Radius )
%SurfaceArea,multiply the radius squared by 4*pi
SurfaceArea = (4*pi) .* (Radius).^2;
end
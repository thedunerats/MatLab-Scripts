function [ Volume ] = CylVol( Radius, Height )
%CylVol: Calculates the volule of a cylinder based on a radius vector 
%and a scalar height
%calculate the volume of the cylinder
Volume = (pi*Height) .* (Radius) .^2;
end

